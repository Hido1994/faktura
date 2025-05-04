import 'package:built_collection/built_collection.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/sale/service/sale_service_model.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../common/widget/datetime_picker_text_form_field.dart';
import '../../customer/customer_model.dart';

class SaleServiceFormScreen extends StatefulWidget {
  final SaleServiceBuilder? entry;

  const SaleServiceFormScreen({super.key, this.entry});

  @override
  State<SaleServiceFormScreen> createState() => _SaleServiceFormScreenState();
}

class _SaleServiceFormScreenState extends State<SaleServiceFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int currentStep = 0;

  bool get isFirstStep => currentStep == 0;

  bool get isLastStep => currentStep == steps().length - 1;

  SaleServiceBuilder builder = SaleServiceBuilder();
  List<TimeEntry> timeEntries = [];
  Set<int> selectedTimeEntryIds = {};

  Future<void> _initSaleService() async {
    SaleServiceBuilder entityBuilder = SaleServiceBuilder();

    if (widget.entry == null) {
    } else {
      entityBuilder = widget.entry!;
    }

    setState(() {
      builder = entityBuilder;
    });
  }

  Future<void> _loadTimeEntries(Customer? customer) async {
    if (customer == null) {
      timeEntries = [];
      selectedTimeEntryIds = {};
    } else {
      var timeEntryBuilder = TimeEntryFilterBuilder();
      var operatorBuilder = NumberOperatorTupleBuilder();
      operatorBuilder.operator_ = NumberOperatorTupleOperator_Enum.EQ;
      operatorBuilder.value = customer.id;
      timeEntryBuilder.customerId = ListBuilder([operatorBuilder.build()]);
      timeEntryBuilder.saleServiceId = null;
      var entries = await Provider.of<TimeEntryModel>(context, listen: false)
          .getAll(timeEntryBuilder);

      timeEntries = entries;
      selectedTimeEntryIds = {};
    }
  }

  @override
  void initState() {
    super.initState();
    _initSaleService();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.transparent,
        ),
        child: Stepper(
          type: StepperType.horizontal,
          elevation: 0,
          currentStep: currentStep,
          onStepContinue: () {
            if (isLastStep) {
              if (_formKey.currentState!.validate()) {
                try {
                  Provider.of<SaleServiceModel>(context, listen: false)
                      .save(builder.build())
                      .then((response) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Gespeichert'),
                      behavior: SnackBarBehavior.floating,
                    ));
                    Navigator.pop(context);
                  });
                } catch (e) {
                  print('Unexpected error: $e');
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Ein unerwarteter Fehler ist aufgetreten.'),
                    behavior: SnackBarBehavior.floating,
                  ));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Objekt konnte nicht gespeichert werden.'),
                  behavior: SnackBarBehavior.floating,
                ));
              }
            } else {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: isFirstStep
              ? null
              : () => setState(
                    () {
                      currentStep -= 1;
                    },
                  ),
          onStepTapped: (step) => setState(() {
            currentStep = step;
          }),
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Container(
              margin: EdgeInsets.only(top: 50),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: details.onStepContinue,
                    child: Text(isLastStep ? 'Speichern' : 'Weiter'),
                  ),
                  if (!isFirstStep) ...[
                    const SizedBox(width: 5),
                    ElevatedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Zurück'),
                    ),
                  ]
                ],
              ),
            );
          },
          steps: steps(),
        ),
      ),
    );
  }

  List<Step> steps() => [
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: Text('Details'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Erbringung am',
                initialValue: builder.suppliedOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.suppliedOn = date.toDate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Consumer<CustomerModel>(builder: (context, model, child) {
                return DropdownSearch<Customer>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.customer.id != null
                      ? builder.customer.build()
                      : null,
                  itemAsString: (Customer customer) => customer.name,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Kunde"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.customer = value?.toBuilder();
                    _loadTimeEntries(value);
                  },
                  filterFn: (Customer customer, String filter) {
                    return customer.name
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Stundensatz',
                  options: const [],
                  initialValue: builder.hourlyRate?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.hourlyRate = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Stunden',
                  options: const [],
                  initialValue: builder.hours?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.hours = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Description',
                options: [],
                initialValue: builder.description,
                onChanged: (value) {
                  builder.description = value;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: Text('Stunden'),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                if (timeEntries.isEmpty)
                  Expanded(
                    child: Center(
                      child: Text('Keine Stunden erfasst'),
                    ),
                  )
                else
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: false,
                      itemCount: timeEntries.length,
                      itemBuilder: (context, index) {
                        final entry = timeEntries[index];
                        final isSelected =
                            selectedTimeEntryIds.contains(entry.id);

                        return CheckboxListTile(
                          title: Text(entry.description),
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              if (value ?? false) {
                                selectedTimeEntryIds.add(entry.id!);
                              } else {
                                selectedTimeEntryIds.remove(entry.id!);
                              }
                            });
                          },
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ),
      ];
}
