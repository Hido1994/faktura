import 'package:dropdown_search/dropdown_search.dart';
import 'package:faktura/common/widget/autocomplete_text_form_field.dart';
import 'package:faktura/sale/article/sale_article_model.dart';
import 'package:faktura_api/faktura_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../account/account_model.dart';
import '../../common/widget/datetime_picker_text_form_field.dart';
import '../../customer/customer_model.dart';
import '../../internationalinfo/international_info_model.dart';
import '../../paymentmethod/payment_method_model.dart';
import '../../supplier/supplier_model.dart';

class SaleArticleFormScreen extends StatefulWidget {
  final SaleArticleBuilder? entry;

  const SaleArticleFormScreen({super.key, this.entry});

  @override
  State<SaleArticleFormScreen> createState() => _SaleArticleFormScreenState();
}

class _SaleArticleFormScreenState extends State<SaleArticleFormScreen> {
  final _formKey = GlobalKey<FormState>();

  SaleArticleBuilder builder = SaleArticleBuilder();

  Future<void> _initSaleArticle() async {
    SaleArticleBuilder entityBuilder = SaleArticleBuilder();

    if (widget.entry == null) {
    } else {
      entityBuilder = widget.entry!;
    }

    setState(() {
      builder = entityBuilder;
    });
  }

  @override
  void initState() {
    super.initState();

    _initSaleArticle();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Bottom sheet title
              Text(
                widget.entry?.id == null ? "Erstellen" : "Bearbeiten",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Eingang am',
                initialValue: builder.incomingOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.incomingOn = date.toDate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Muss angegeben werden";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DateTimePickerTextFormField(
                key: UniqueKey(),
                title: 'Bezahlt am',
                initialValue: builder.paidOn?.toDateTime(),
                includeTime: false,
                onChanged: (date) {
                  builder.paidOn = date.toDate();
                },
              ),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Beschreibung',
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
              const SizedBox(height: 20),
              Consumer<AccountModel>(builder: (context, model, child) {
                return DropdownSearch<Account>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.account.id != null
                      ? builder.account.build()
                      : null,
                  itemAsString: (Account account) => account.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Konto"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.account = value?.toBuilder();
                  },
                  filterFn: (Account account, String filter) {
                    return account.description
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<SupplierModel>(builder: (context, model, child) {
                return DropdownSearch<Supplier>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.supplier.id != null
                      ? builder.supplier.build()
                      : null,
                  itemAsString: (Supplier entity) => entity.name,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Lieferant"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.supplier = value?.toBuilder();
                  },
                  filterFn: (Supplier entity, String filter) {
                    return entity.name
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<InternationalInfoModel>(
                  builder: (context, model, child) {
                return DropdownSearch<InternationalInfo>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.internationalInfo.id != null
                      ? builder.internationalInfo.build()
                      : null,
                  itemAsString: (InternationalInfo entity) =>
                      entity.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration:
                          InputDecoration(label: Text("International Info"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.internationalInfo = value?.toBuilder();
                  },
                  filterFn: (InternationalInfo entity, String filter) {
                    return entity.description
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                );
              }),
              const SizedBox(height: 20),
              Consumer<PaymentMethodModel>(builder: (context, model, child) {
                return DropdownSearch<PaymentMethod>(
                  items: (f, cs) => model.lovEntities,
                  selectedItem: builder.paymentMethod.id != null
                      ? builder.paymentMethod.build()
                      : null,
                  itemAsString: (PaymentMethod entity) => entity.description,
                  decoratorProps: DropDownDecoratorProps(
                      decoration: InputDecoration(label: Text("Zahlart"))),
                  compareFn: (e, e2) => e.id == e2.id,
                  suffixProps: DropdownSuffixProps(
                      clearButtonProps:
                          const ClearButtonProps(isVisible: true)),
                  popupProps:
                      PopupProps.menu(showSearchBox: true, fit: FlexFit.loose),
                  onChanged: (value) {
                    builder.paymentMethod = value?.toBuilder();
                  },
                  filterFn: (PaymentMethod entity, String filter) {
                    return entity.description
                        .toLowerCase()
                        .contains(filter.toLowerCase());
                  },
                  validator: (value) {
                    if (value == null) {
                      return "Muss angegeben werden";
                    }
                    return null;
                  },
                );
              }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Einkauf Netto',
                  options: const [],
                  initialValue: builder.priceNet?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.priceNet = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Einkauf Ust.',
                  options: const [],
                  initialValue: builder.priceTax?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.priceTax = double.tryParse(value);
                  }),
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
                  title: 'Verkauf Netto',
                  options: const [],
                  initialValue: builder.salesNet?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.salesNet = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                  key: UniqueKey(),
                  title: 'Verkauf Ust.',
                  options: const [],
                  initialValue: builder.salesTax?.toString(),
                  textInputType: TextInputType.numberWithOptions(decimal: true),
                  inputFormatter: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))
                  ],
                  onChanged: (value) {
                    builder.salesTax = double.tryParse(value);
                  }),
              const SizedBox(height: 20),
              AutocompleteTextFormField(
                key: UniqueKey(),
                title: 'Info',
                options: [],
                initialValue: builder.info,
                onChanged: (value) {
                  builder.info = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    try {
                      Provider.of<SaleArticleModel>(context, listen: false)
                          .save(builder.build())
                          .then((response) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('Gespeichert'),
                          behavior: SnackBarBehavior.floating,
                        ));
                        Navigator.pop(context);
                      });
                    } catch (e) {
                      print('Unexpected error: $e');
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content:
                            Text('Ein unerwarteter Fehler ist aufgetreten.'),
                        behavior: SnackBarBehavior.floating,
                      ));
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Objekt konnte nicht gespeichert werden.'),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                icon: Icon(Icons.check),
                label: Text('Speichern'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
