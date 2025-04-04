//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/invoice.dart';
import 'package:faktura_api/src/model/customer.dart';
import 'package:faktura_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_service.g.dart';

/// SaleService
///
/// Properties:
/// * [id] - Primary key identifier for the sales service
/// * [hourlyRate] - Hourly rate for the service
/// * [suppliedOn] - Date when the service was supplied
/// * [hours] - Number of hours of service provided
/// * [description] - Description of the sales service
/// * [customer]
/// * [invoice]
/// * [timeInfo] - Time information for the service
/// * [salesNet] - Net sales amount
@BuiltValue()
abstract class SaleService implements Built<SaleService, SaleServiceBuilder> {
  /// Primary key identifier for the sales service
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Hourly rate for the service
  @BuiltValueField(wireName: r'hourlyRate')
  double get hourlyRate;

  /// Date when the service was supplied
  @BuiltValueField(wireName: r'suppliedOn')
  Date get suppliedOn;

  /// Number of hours of service provided
  @BuiltValueField(wireName: r'hours')
  double get hours;

  /// Description of the sales service
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'customer')
  Customer? get customer;

  @BuiltValueField(wireName: r'invoice')
  Invoice? get invoice;

  /// Time information for the service
  @BuiltValueField(wireName: r'timeInfo')
  String? get timeInfo;

  /// Net sales amount
  @BuiltValueField(wireName: r'salesNet')
  double? get salesNet;

  SaleService._();

  factory SaleService([void updates(SaleServiceBuilder b)]) = _$SaleService;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleServiceBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleService> get serializer => _$SaleServiceSerializer();
}

class _$SaleServiceSerializer implements PrimitiveSerializer<SaleService> {
  @override
  final Iterable<Type> types = const [SaleService, _$SaleService];

  @override
  final String wireName = r'SaleService';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleService object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'hourlyRate';
    yield serializers.serialize(
      object.hourlyRate,
      specifiedType: const FullType(double),
    );
    yield r'suppliedOn';
    yield serializers.serialize(
      object.suppliedOn,
      specifiedType: const FullType(Date),
    );
    yield r'hours';
    yield serializers.serialize(
      object.hours,
      specifiedType: const FullType(double),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    if (object.customer != null) {
      yield r'customer';
      yield serializers.serialize(
        object.customer,
        specifiedType: const FullType(Customer),
      );
    }
    if (object.invoice != null) {
      yield r'invoice';
      yield serializers.serialize(
        object.invoice,
        specifiedType: const FullType(Invoice),
      );
    }
    if (object.timeInfo != null) {
      yield r'timeInfo';
      yield serializers.serialize(
        object.timeInfo,
        specifiedType: const FullType(String),
      );
    }
    if (object.salesNet != null) {
      yield r'salesNet';
      yield serializers.serialize(
        object.salesNet,
        specifiedType: const FullType(double),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleService object, {
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
    required SaleServiceBuilder result,
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
        case r'hourlyRate':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.hourlyRate = valueDes;
          break;
        case r'suppliedOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.suppliedOn = valueDes;
          break;
        case r'hours':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.hours = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'customer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Customer),
          ) as Customer;
          result.customer.replace(valueDes);
          break;
        case r'invoice':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Invoice),
          ) as Invoice;
          result.invoice.replace(valueDes);
          break;
        case r'timeInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.timeInfo = valueDes;
          break;
        case r'salesNet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.salesNet = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaleService deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleServiceBuilder();
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
