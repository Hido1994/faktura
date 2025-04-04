//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/setting.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setting_list.g.dart';

/// List of Settings
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class SettingList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Setting>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingList> get serializer => _$SettingListSerializer();
}

class _$SettingListSerializer implements PrimitiveSerializer<SettingList> {
  @override
  final Iterable<Type> types = const [SettingList];

  @override
  final String wireName = r'SettingList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SettingList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    SettingList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  SettingList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($SettingList)) as $SettingList;
  }
}

/// a concrete implementation of [SettingList], since [SettingList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SettingList
    implements SettingList, Built<$SettingList, $SettingListBuilder> {
  $SettingList._();

  factory $SettingList([void Function($SettingListBuilder)? updates]) =
      _$$SettingList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SettingListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SettingList> get serializer => _$$SettingListSerializer();
}

class _$$SettingListSerializer implements PrimitiveSerializer<$SettingList> {
  @override
  final Iterable<Type> types = const [$SettingList, _$$SettingList];

  @override
  final String wireName = r'$SettingList';

  @override
  Object serialize(
    Serializers serializers,
    $SettingList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(SettingList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SettingListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  $SettingList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SettingListBuilder();
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
