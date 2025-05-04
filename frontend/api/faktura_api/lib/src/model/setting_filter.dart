//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/string_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setting_filter.g.dart';

/// SettingFilter
///
/// Properties:
/// * [key]
@BuiltValue()
abstract class SettingFilter
    implements Built<SettingFilter, SettingFilterBuilder> {
  @BuiltValueField(wireName: r'key')
  BuiltList<StringOperatorTuple>? get key;

  SettingFilter._();

  factory SettingFilter([void updates(SettingFilterBuilder b)]) =
      _$SettingFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SettingFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingFilter> get serializer =>
      _$SettingFilterSerializer();
}

class _$SettingFilterSerializer implements PrimitiveSerializer<SettingFilter> {
  @override
  final Iterable<Type> types = const [SettingFilter, _$SettingFilter];

  @override
  final String wireName = r'SettingFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SettingFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType:
            const FullType(BuiltList, [FullType(StringOperatorTuple)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SettingFilter object, {
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
    required SettingFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(StringOperatorTuple)]),
          ) as BuiltList<StringOperatorTuple>;
          result.key.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SettingFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingFilterBuilder();
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
