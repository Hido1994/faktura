//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/time_entry.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:faktura_api/src/model/time_entry_list.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'time_entry_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class TimeEntryPage
    implements Page, TimeEntryList, Built<TimeEntryPage, TimeEntryPageBuilder> {
  TimeEntryPage._();

  factory TimeEntryPage([void updates(TimeEntryPageBuilder b)]) =
      _$TimeEntryPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(TimeEntryPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<TimeEntryPage> get serializer =>
      _$TimeEntryPageSerializer();
}

class _$TimeEntryPageSerializer implements PrimitiveSerializer<TimeEntryPage> {
  @override
  final Iterable<Type> types = const [TimeEntryPage, _$TimeEntryPage];

  @override
  final String wireName = r'TimeEntryPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    TimeEntryPage object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType(int),
      );
    }
    if (object.number != null) {
      yield r'number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType(int),
      );
    }
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
    TimeEntryPage object, {
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
    required TimeEntryPageBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.number = valueDes;
          break;
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
  TimeEntryPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = TimeEntryPageBuilder();
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
