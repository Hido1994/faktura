//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/setting_list.dart';
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/setting.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setting_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class SettingPage
    implements Page, SettingList, Built<SettingPage, SettingPageBuilder> {
  SettingPage._();

  factory SettingPage([void updates(SettingPageBuilder b)]) = _$SettingPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SettingPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingPage> get serializer => _$SettingPageSerializer();
}

class _$SettingPageSerializer implements PrimitiveSerializer<SettingPage> {
  @override
  final Iterable<Type> types = const [SettingPage, _$SettingPage];

  @override
  final String wireName = r'SettingPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SettingPage object, {
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
        specifiedType: const FullType(BuiltList, [FullType(Setting)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SettingPage object, {
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
    required SettingPageBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(Setting)]),
          ) as BuiltList<Setting>;
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
  SettingPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingPageBuilder();
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
