//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/customer.dart';
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:faktura_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invoice.g.dart';

/// Invoice
///
/// Properties:
/// * [id] - Primary key identifier for the invoice
/// * [subject] - Subject of the invoice
/// * [createdOn] - Date when the invoice was created
/// * [invoiceNumber] - Invoice number
/// * [paidOn] - Date when the invoice was paid
/// * [paymentMethod]
/// * [customer]
/// * [servicePeriod] - Period of service covered by the invoice
/// * [revision] - Revision information for the invoice
@BuiltValue()
abstract class Invoice implements Built<Invoice, InvoiceBuilder> {
  /// Primary key identifier for the invoice
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Subject of the invoice
  @BuiltValueField(wireName: r'subject')
  String get subject;

  /// Date when the invoice was created
  @BuiltValueField(wireName: r'createdOn')
  Date get createdOn;

  /// Invoice number
  @BuiltValueField(wireName: r'invoiceNumber')
  int? get invoiceNumber;

  /// Date when the invoice was paid
  @BuiltValueField(wireName: r'paidOn')
  Date? get paidOn;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;

  @BuiltValueField(wireName: r'customer')
  Customer? get customer;

  /// Period of service covered by the invoice
  @BuiltValueField(wireName: r'servicePeriod')
  String? get servicePeriod;

  /// Revision information for the invoice
  @BuiltValueField(wireName: r'revision')
  String? get revision;

  Invoice._();

  factory Invoice([void updates(InvoiceBuilder b)]) = _$Invoice;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvoiceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Invoice> get serializer => _$InvoiceSerializer();
}

class _$InvoiceSerializer implements PrimitiveSerializer<Invoice> {
  @override
  final Iterable<Type> types = const [Invoice, _$Invoice];

  @override
  final String wireName = r'Invoice';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Invoice object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'subject';
    yield serializers.serialize(
      object.subject,
      specifiedType: const FullType(String),
    );
    yield r'createdOn';
    yield serializers.serialize(
      object.createdOn,
      specifiedType: const FullType(Date),
    );
    if (object.invoiceNumber != null) {
      yield r'invoiceNumber';
      yield serializers.serialize(
        object.invoiceNumber,
        specifiedType: const FullType(int),
      );
    }
    if (object.paidOn != null) {
      yield r'paidOn';
      yield serializers.serialize(
        object.paidOn,
        specifiedType: const FullType(Date),
      );
    }
    if (object.paymentMethod != null) {
      yield r'paymentMethod';
      yield serializers.serialize(
        object.paymentMethod,
        specifiedType: const FullType(PaymentMethod),
      );
    }
    if (object.customer != null) {
      yield r'customer';
      yield serializers.serialize(
        object.customer,
        specifiedType: const FullType(Customer),
      );
    }
    if (object.servicePeriod != null) {
      yield r'servicePeriod';
      yield serializers.serialize(
        object.servicePeriod,
        specifiedType: const FullType(String),
      );
    }
    if (object.revision != null) {
      yield r'revision';
      yield serializers.serialize(
        object.revision,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Invoice object, {
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
    required InvoiceBuilder result,
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
        case r'subject':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.subject = valueDes;
          break;
        case r'createdOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.createdOn = valueDes;
          break;
        case r'invoiceNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.invoiceNumber = valueDes;
          break;
        case r'paidOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.paidOn = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod.replace(valueDes);
          break;
        case r'customer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Customer),
          ) as Customer;
          result.customer.replace(valueDes);
          break;
        case r'servicePeriod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.servicePeriod = valueDes;
          break;
        case r'revision':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.revision = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Invoice deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvoiceBuilder();
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
