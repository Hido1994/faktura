import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/timeentry/time_entry_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../customer/customer_model.dart';

class TimeEntryFilterScreen extends StatefulWidget {
  const TimeEntryFilterScreen({super.key});

  @override
  State<TimeEntryFilterScreen> createState() => _TimeEntryFilterScreenState();
}

class _TimeEntryFilterScreenState extends State<TimeEntryFilterScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Consumer<TimeEntryModel>(builder: (context, model, child) {
      return Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Filter",
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 5,
                  children: [
                    FilterChip(
                      label: Text("Verrechnet"),
                      selected: model.filter.saleServiceId.operator_ ==
                          NumberOperatorTupleOperator_Enum.IS_NULL,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            NumberOperatorTupleBuilder operatorBuilder =
                                NumberOperatorTupleBuilder();
                            operatorBuilder.operator_ =
                                NumberOperatorTupleOperator_Enum.IS_NULL;
                            model.filter.saleServiceId = operatorBuilder;
                          } else {
                            model.filter.saleServiceId = null;
                          }
                        });
                      },
                    ),
                    FilterChip(
                      label: Text("Unverrechnet"),
                      selected: model.filter.saleServiceId.operator_ ==
                          NumberOperatorTupleOperator_Enum.IS_NULL,
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            NumberOperatorTupleBuilder operatorBuilder =
                                NumberOperatorTupleBuilder();
                            operatorBuilder.operator_ =
                                NumberOperatorTupleOperator_Enum.IS_NULL;
                            model.filter.saleServiceId = operatorBuilder;
                          } else {
                            model.filter.saleServiceId = null;
                          }
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Consumer<CustomerModel>(
                    builder: (context, customerModel, child) {
                  return DropdownSearch<Customer>(
                    items: (f, cs) => customerModel.lovEntities,
                    selectedItem: model.filter.customerId.value != null
                        ? customerModel.lovEntities.firstWhere(
                            (item) => item.id == model.filter.customerId.value)
                        : null,
                    itemAsString: (Customer customer) => customer.name,
                    decoratorProps: DropDownDecoratorProps(
                        decoration: InputDecoration(label: Text("Kunde"))),
                    compareFn: (e, e2) => e.id == e2.id,
                    suffixProps: DropdownSuffixProps(
                        clearButtonProps:
                            const ClearButtonProps(isVisible: true)),
                    popupProps: PopupProps.menu(
                        showSearchBox: true, fit: FlexFit.loose),
                    onChanged: (value) {
                      if (value != null) {
                        NumberOperatorTupleBuilder operatorBuilder =
                            NumberOperatorTupleBuilder();
                        operatorBuilder.operator_ =
                            NumberOperatorTupleOperator_Enum.EQ;
                        operatorBuilder.value = value.id;
                        model.filter.customerId = operatorBuilder;
                      } else {
                        model.filter.customerId = null;
                      }
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
                    title: 'Beschreibung',
                    options: [],
                    initialValue: model.filter.description.value,
                    onChanged: (value) {
                      StringOperatorTupleBuilder operatorBuilder =
                          StringOperatorTupleBuilder();
                      operatorBuilder.operator_ =
                          StringOperatorTupleOperator_Enum.STRING_CONTAINS;
                      operatorBuilder.value = value;
                      model.filter.description = operatorBuilder;
                    }),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Provider.of<TimeEntryModel>(context, listen: false)
                          .refresh();
                      Navigator.pop(context);
                    }
                  },
                  icon: Icon(Icons.filter_alt),
                  label: Text('Anwenden'),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
