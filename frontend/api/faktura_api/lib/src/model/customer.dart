//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer.g.dart';

/// Customer
///
/// Properties:
/// * [id] - Primary key identifier for the customer
/// * [searchName] - Search name for the customer
/// * [name] - Full name of the customer
/// * [addressLine1] - First line of customer address
/// * [city] - City of the customer
/// * [postalCode] - Postal code of the customer
/// * [countryCode] - Country code of the customer
/// * [addressLine2] - Second line of customer address
/// * [taxIdentificationNumber] - Sales tax identifier for the customer
/// * [email] - Email address of the customer
/// * [phone] - Phone number of the customer
/// * [hourlyRate] - Hourly rate charged to the customer
/// * [paymentInfo] - Payment information for the customer
@BuiltValue()
abstract class Customer implements Built<Customer, CustomerBuilder> {
  /// Primary key identifier for the customer
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Search name for the customer
  @BuiltValueField(wireName: r'searchName')
  String get searchName;

  /// Full name of the customer
  @BuiltValueField(wireName: r'name')
  String get name;

  /// First line of customer address
  @BuiltValueField(wireName: r'addressLine1')
  String get addressLine1;

  /// City of the customer
  @BuiltValueField(wireName: r'city')
  String get city;

  /// Postal code of the customer
  @BuiltValueField(wireName: r'postalCode')
  String get postalCode;

  /// Country code of the customer
  @BuiltValueField(wireName: r'countryCode')
  String get countryCode;

  /// Second line of customer address
  @BuiltValueField(wireName: r'addressLine2')
  String? get addressLine2;

  /// Sales tax identifier for the customer
  @BuiltValueField(wireName: r'taxIdentificationNumber')
  String? get taxIdentificationNumber;

  /// Email address of the customer
  @BuiltValueField(wireName: r'email')
  String? get email;

  /// Phone number of the customer
  @BuiltValueField(wireName: r'phone')
  String? get phone;

  /// Hourly rate charged to the customer
  @BuiltValueField(wireName: r'hourlyRate')
  double? get hourlyRate;

  /// Payment information for the customer
  @BuiltValueField(wireName: r'paymentInfo')
  String? get paymentInfo;

  Customer._();

  factory Customer([void updates(CustomerBuilder b)]) = _$Customer;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Customer> get serializer => _$CustomerSerializer();
}

class _$CustomerSerializer implements PrimitiveSerializer<Customer> {
  @override
  final Iterable<Type> types = const [Customer, _$Customer];

  @override
  final String wireName = r'Customer';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Customer object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'searchName';
    yield serializers.serialize(
      object.searchName,
      specifiedType: const FullType(String),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    yield r'addressLine1';
    yield serializers.serialize(
      object.addressLine1,
      specifiedType: const FullType(String),
    );
    yield r'city';
    yield serializers.serialize(
      object.city,
      specifiedType: const FullType(String),
    );
    yield r'postalCode';
    yield serializers.serialize(
      object.postalCode,
      specifiedType: const FullType(String),
    );
    yield r'countryCode';
    yield serializers.serialize(
      object.countryCode,
      specifiedType: const FullType(String),
    );
    if (object.addressLine2 != null) {
      yield r'addressLine2';
      yield serializers.serialize(
        object.addressLine2,
        specifiedType: const FullType(String),
      );
    }
    if (object.taxIdentificationNumber != null) {
      yield r'taxIdentificationNumber';
      yield serializers.serialize(
        object.taxIdentificationNumber,
        specifiedType: const FullType(String),
      );
    }
    if (object.email != null) {
      yield r'email';
      yield serializers.serialize(
        object.email,
        specifiedType: const FullType(String),
      );
    }
    if (object.phone != null) {
      yield r'phone';
      yield serializers.serialize(
        object.phone,
        specifiedType: const FullType(String),
      );
    }
    if (object.hourlyRate != null) {
      yield r'hourlyRate';
      yield serializers.serialize(
        object.hourlyRate,
        specifiedType: const FullType(double),
      );
    }
    if (object.paymentInfo != null) {
      yield r'paymentInfo';
      yield serializers.serialize(
        object.paymentInfo,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Customer object, {
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
    required CustomerBuilder result,
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
        case r'searchName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.searchName = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'addressLine1':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine1 = valueDes;
          break;
        case r'city':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.city = valueDes;
          break;
        case r'postalCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.postalCode = valueDes;
          break;
        case r'countryCode':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.countryCode = valueDes;
          break;
        case r'addressLine2':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.addressLine2 = valueDes;
          break;
        case r'taxIdentificationNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.taxIdentificationNumber = valueDes;
          break;
        case r'email':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.email = valueDes;
          break;
        case r'phone':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.phone = valueDes;
          break;
        case r'hourlyRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.hourlyRate = valueDes;
          break;
        case r'paymentInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.paymentInfo = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Customer deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerBuilder();
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
