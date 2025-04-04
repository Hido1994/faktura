//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/time_entry.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_entry_list.g.dart';

/// List of TimeEntries
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class TimeEntryList {
  @BuiltValueField(wireName: r'content')
  BuiltList<TimeEntry>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeEntryList> get serializer =>
      _$TimeEntryListSerializer();
}

class _$TimeEntryListSerializer implements PrimitiveSerializer<TimeEntryList> {
  @override
  final Iterable<Type> types = const [TimeEntryList];

  @override
  final String wireName = r'TimeEntryList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeEntryList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(TimeEntry)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    TimeEntryList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  TimeEntryList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($TimeEntryList)) as $TimeEntryList;
  }
}

/// a concrete implementation of [TimeEntryList], since [TimeEntryList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $TimeEntryList
    implements TimeEntryList, Built<$TimeEntryList, $TimeEntryListBuilder> {
  $TimeEntryList._();

  factory $TimeEntryList([void Function($TimeEntryListBuilder)? updates]) =
      _$$TimeEntryList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($TimeEntryListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$TimeEntryList> get serializer =>
      _$$TimeEntryListSerializer();
}

class _$$TimeEntryListSerializer
    implements PrimitiveSerializer<$TimeEntryList> {
  @override
  final Iterable<Type> types = const [$TimeEntryList, _$$TimeEntryList];

  @override
  final String wireName = r'$TimeEntryList';

  @override
  Object serialize(
    Serializers serializers,
    $TimeEntryList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(TimeEntryList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required TimeEntryListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(TimeEntry)]),
          ) as BuiltList<TimeEntry>;
          result.content.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $TimeEntryList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $TimeEntryListBuilder();
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
