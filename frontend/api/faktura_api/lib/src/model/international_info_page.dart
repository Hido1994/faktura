//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/international_info_list.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:faktura_api/src/model/international_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'international_info_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class InternationalInfoPage
    implements
        InternationalInfoList,
        Page,
        Built<InternationalInfoPage, InternationalInfoPageBuilder> {
  InternationalInfoPage._();

  factory InternationalInfoPage(
      [void updates(InternationalInfoPageBuilder b)]) = _$InternationalInfoPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InternationalInfoPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InternationalInfoPage> get serializer =>
      _$InternationalInfoPageSerializer();
}

class _$InternationalInfoPageSerializer
    implements PrimitiveSerializer<InternationalInfoPage> {
  @override
  final Iterable<Type> types = const [
    InternationalInfoPage,
    _$InternationalInfoPage
  ];

  @override
  final String wireName = r'InternationalInfoPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InternationalInfoPage object, {
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
        specifiedType: const FullType(BuiltList, [FullType(InternationalInfo)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InternationalInfoPage object, {
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
    required InternationalInfoPageBuilder result,
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
            specifiedType:
                const FullType(BuiltList, [FullType(InternationalInfo)]),
          ) as BuiltList<InternationalInfo>;
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
  InternationalInfoPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InternationalInfoPageBuilder();
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
