//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/invoice.dart';
import 'package:faktura_api/src/model/customer.dart';
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:faktura_api/src/model/supplier.dart';
import 'package:faktura_api/src/model/account.dart';
import 'package:faktura_api/src/model/date.dart';
import 'package:faktura_api/src/model/international_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_article.g.dart';

/// SaleArticle
///
/// Properties:
/// * [id] - Primary key identifier for the sales article
/// * [description] - Description of the sales article
/// * [incomingOn] - Date when the sales article was received
/// * [priceNet] - Net price of the sales article
/// * [priceTax] - Tax amount of the sales article
/// * [supplier]
/// * [internationalInfo]
/// * [account]
/// * [customer]
/// * [paidOn] - Date when the sales article was paid
/// * [invoice]
/// * [salesNet] - Net sales amount
/// * [salesTax] - Sales tax amount
/// * [paymentMethod]
/// * [info] - Additional information about the sales article
/// * [amount] - Quantity of the sales article
@BuiltValue()
abstract class SaleArticle implements Built<SaleArticle, SaleArticleBuilder> {
  /// Primary key identifier for the sales article
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Description of the sales article
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Date when the sales article was received
  @BuiltValueField(wireName: r'incomingOn')
  Date get incomingOn;

  /// Net price of the sales article
  @BuiltValueField(wireName: r'priceNet')
  double get priceNet;

  /// Tax amount of the sales article
  @BuiltValueField(wireName: r'priceTax')
  double get priceTax;

  @BuiltValueField(wireName: r'supplier')
  Supplier? get supplier;

  @BuiltValueField(wireName: r'internationalInfo')
  InternationalInfo? get internationalInfo;

  @BuiltValueField(wireName: r'account')
  Account? get account;

  @BuiltValueField(wireName: r'customer')
  Customer? get customer;

  /// Date when the sales article was paid
  @BuiltValueField(wireName: r'paidOn')
  Date? get paidOn;

  @BuiltValueField(wireName: r'invoice')
  Invoice? get invoice;

  /// Net sales amount
  @BuiltValueField(wireName: r'salesNet')
  double? get salesNet;

  /// Sales tax amount
  @BuiltValueField(wireName: r'salesTax')
  double? get salesTax;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;

  /// Additional information about the sales article
  @BuiltValueField(wireName: r'info')
  String? get info;

  /// Quantity of the sales article
  @BuiltValueField(wireName: r'amount')
  int? get amount;

  SaleArticle._();

  factory SaleArticle([void updates(SaleArticleBuilder b)]) = _$SaleArticle;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleArticleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleArticle> get serializer => _$SaleArticleSerializer();
}

class _$SaleArticleSerializer implements PrimitiveSerializer<SaleArticle> {
  @override
  final Iterable<Type> types = const [SaleArticle, _$SaleArticle];

  @override
  final String wireName = r'SaleArticle';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleArticle object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'incomingOn';
    yield serializers.serialize(
      object.incomingOn,
      specifiedType: const FullType(Date),
    );
    yield r'priceNet';
    yield serializers.serialize(
      object.priceNet,
      specifiedType: const FullType(double),
    );
    yield r'priceTax';
    yield serializers.serialize(
      object.priceTax,
      specifiedType: const FullType(double),
    );
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(Supplier),
      );
    }
    if (object.internationalInfo != null) {
      yield r'internationalInfo';
      yield serializers.serialize(
        object.internationalInfo,
        specifiedType: const FullType(InternationalInfo),
      );
    }
    if (object.account != null) {
      yield r'account';
      yield serializers.serialize(
        object.account,
        specifiedType: const FullType(Account),
      );
    }
    if (object.customer != null) {
      yield r'customer';
      yield serializers.serialize(
        object.customer,
        specifiedType: const FullType(Customer),
      );
    }
    if (object.paidOn != null) {
      yield r'paidOn';
      yield serializers.serialize(
        object.paidOn,
        specifiedType: const FullType(Date),
      );
    }
    if (object.invoice != null) {
      yield r'invoice';
      yield serializers.serialize(
        object.invoice,
        specifiedType: const FullType(Invoice),
      );
    }
    if (object.salesNet != null) {
      yield r'salesNet';
      yield serializers.serialize(
        object.salesNet,
        specifiedType: const FullType(double),
      );
    }
    if (object.salesTax != null) {
      yield r'salesTax';
      yield serializers.serialize(
        object.salesTax,
        specifiedType: const FullType(double),
      );
    }
    if (object.paymentMethod != null) {
      yield r'paymentMethod';
      yield serializers.serialize(
        object.paymentMethod,
        specifiedType: const FullType(PaymentMethod),
      );
    }
    if (object.info != null) {
      yield r'info';
      yield serializers.serialize(
        object.info,
        specifiedType: const FullType(String),
      );
    }
    if (object.amount != null) {
      yield r'amount';
      yield serializers.serialize(
        object.amount,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleArticle object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SaleArticleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'incomingOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.incomingOn = valueDes;
          break;
        case r'priceNet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.priceNet = valueDes;
          break;
        case r'priceTax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.priceTax = valueDes;
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Supplier),
          ) as Supplier;
          result.supplier.replace(valueDes);
          break;
        case r'internationalInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InternationalInfo),
          ) as InternationalInfo;
          result.internationalInfo.replace(valueDes);
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Account),
          ) as Account;
          result.account.replace(valueDes);
          break;
        case r'customer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Customer),
          ) as Customer;
          result.customer.replace(valueDes);
          break;
        case r'paidOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.paidOn = valueDes;
          break;
        case r'invoice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Invoice),
          ) as Invoice;
          result.invoice.replace(valueDes);
          break;
        case r'salesNet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.salesNet = valueDes;
          break;
        case r'salesTax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.salesTax = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod.replace(valueDes);
          break;
        case r'info':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.info = valueDes;
          break;
        case r'amount':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.amount = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaleArticle deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleArticleBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
