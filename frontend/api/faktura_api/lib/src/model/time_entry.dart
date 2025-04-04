//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/sale_service.dart';
import 'package:faktura_api/src/model/customer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_entry.g.dart';

/// TimeEntry
///
/// Properties:
/// * [id] - Primary key identifier for the time entry
/// * [startedOn] - Date and time when the entry started
/// * [description] - Description of the time entry
/// * [customer]
/// * [endedOn] - Date and time when the entry ended
/// * [saleService]
@BuiltValue()
abstract class TimeEntry implements Built<TimeEntry, TimeEntryBuilder> {
  /// Primary key identifier for the time entry
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Date and time when the entry started
  @BuiltValueField(wireName: r'startedOn')
  DateTime get startedOn;

  /// Description of the time entry
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'customer')
  Customer? get customer;

  /// Date and time when the entry ended
  @BuiltValueField(wireName: r'endedOn')
  DateTime? get endedOn;

  @BuiltValueField(wireName: r'saleService')
  SaleService? get saleService;

  TimeEntry._();

  factory TimeEntry([void updates(TimeEntryBuilder b)]) = _$TimeEntry;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeEntryBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeEntry> get serializer => _$TimeEntrySerializer();
}

class _$TimeEntrySerializer implements PrimitiveSerializer<TimeEntry> {
  @override
  final Iterable<Type> types = const [TimeEntry, _$TimeEntry];

  @override
  final String wireName = r'TimeEntry';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeEntry object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'startedOn';
    yield serializers.serialize(
      object.startedOn,
      specifiedType: const FullType(DateTime),
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
    if (object.endedOn != null) {
      yield r'endedOn';
      yield serializers.serialize(
        object.endedOn,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.saleService != null) {
      yield r'saleService';
      yield serializers.serialize(
        object.saleService,
        specifiedType: const FullType(SaleService),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeEntry object, {
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
    required TimeEntryBuilder result,
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
        case r'startedOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.startedOn = valueDes;
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
        case r'endedOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.endedOn = valueDes;
          break;
        case r'saleService':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SaleService),
          ) as SaleService;
          result.saleService.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimeEntry deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeEntryBuilder();
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
