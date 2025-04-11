//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setting.g.dart';

/// Setting
///
/// Properties:
/// * [key] - Key identifier for the setting
/// * [value] - Value of the setting
/// * [id] - Primary key identifier for the setting
@BuiltValue()
abstract class Setting implements Built<Setting, SettingBuilder> {
  /// Key identifier for the setting
  @BuiltValueField(wireName: r'key')
  String get key;

  /// Value of the setting
  @BuiltValueField(wireName: r'value')
  String get value;

  /// Primary key identifier for the setting
  @BuiltValueField(wireName: r'id')
  int? get id;

  Setting._();

  factory Setting([void updates(SettingBuilder b)]) = _$Setting;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SettingBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Setting> get serializer => _$SettingSerializer();
}

class _$SettingSerializer implements PrimitiveSerializer<Setting> {
  @override
  final Iterable<Type> types = const [Setting, _$Setting];

  @override
  final String wireName = r'Setting';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Setting object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    yield r'value';
    yield serializers.serialize(
      object.value,
      specifiedType: const FullType(String),
    );
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Setting object, {
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
    required SettingBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.value = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Setting deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingBuilder();
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
