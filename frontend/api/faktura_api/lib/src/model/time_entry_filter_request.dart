//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/time_entry_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_entry_filter_request.g.dart';

/// TimeEntryFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class TimeEntryFilterRequest
    implements Built<TimeEntryFilterRequest, TimeEntryFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  TimeEntryFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  TimeEntryFilterRequest._();

  factory TimeEntryFilterRequest(
          [void updates(TimeEntryFilterRequestBuilder b)]) =
      _$TimeEntryFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeEntryFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeEntryFilterRequest> get serializer =>
      _$TimeEntryFilterRequestSerializer();
}

class _$TimeEntryFilterRequestSerializer
    implements PrimitiveSerializer<TimeEntryFilterRequest> {
  @override
  final Iterable<Type> types = const [
    TimeEntryFilterRequest,
    _$TimeEntryFilterRequest
  ];

  @override
  final String wireName = r'TimeEntryFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeEntryFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(TimeEntryFilter),
      );
    }
    if (object.pageable != null) {
      yield r'pageable';
      yield serializers.serialize(
        object.pageable,
        specifiedType: const FullType(Pageable),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeEntryFilterRequest object, {
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
    required TimeEntryFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(TimeEntryFilter),
          ) as TimeEntryFilter;
          result.filter.replace(valueDes);
          break;
        case r'pageable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Pageable),
          ) as Pageable;
          result.pageable.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  TimeEntryFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeEntryFilterRequestBuilder();
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
