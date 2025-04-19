//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_entry_filter.g.dart';

/// TimeEntryFilter
///
/// Properties:
/// * [description]
/// * [customerId]
/// * [saleServiceId]
@BuiltValue()
abstract class TimeEntryFilter
    implements Built<TimeEntryFilter, TimeEntryFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  @BuiltValueField(wireName: r'customerId')
  int? get customerId;

  @BuiltValueField(wireName: r'saleServiceId')
  int? get saleServiceId;

  TimeEntryFilter._();

  factory TimeEntryFilter([void updates(TimeEntryFilterBuilder b)]) =
      _$TimeEntryFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeEntryFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeEntryFilter> get serializer =>
      _$TimeEntryFilterSerializer();
}

class _$TimeEntryFilterSerializer
    implements PrimitiveSerializer<TimeEntryFilter> {
  @override
  final Iterable<Type> types = const [TimeEntryFilter, _$TimeEntryFilter];

  @override
  final String wireName = r'TimeEntryFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeEntryFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
    if (object.customerId != null) {
      yield r'customerId';
      yield serializers.serialize(
        object.customerId,
        specifiedType: const FullType.nullable(int),
      );
    }
    if (object.saleServiceId != null) {
      yield r'saleServiceId';
      yield serializers.serialize(
        object.saleServiceId,
        specifiedType: const FullType.nullable(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeEntryFilter object, {
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
    required TimeEntryFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        case r'customerId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.customerId = valueDes;
          break;
        case r'saleServiceId':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(int),
          ) as int?;
          if (valueDes == null) continue;
          result.saleServiceId = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimeEntryFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeEntryFilterBuilder();
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
