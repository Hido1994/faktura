//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/international_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'international_info_list.g.dart';

/// List of InternationalInfos
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class InternationalInfoList {
  @BuiltValueField(wireName: r'content')
  BuiltList<InternationalInfo>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<InternationalInfoList> get serializer =>
      _$InternationalInfoListSerializer();
}

class _$InternationalInfoListSerializer
    implements PrimitiveSerializer<InternationalInfoList> {
  @override
  final Iterable<Type> types = const [InternationalInfoList];

  @override
  final String wireName = r'InternationalInfoList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InternationalInfoList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    InternationalInfoList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  InternationalInfoList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
            specifiedType: FullType($InternationalInfoList))
        as $InternationalInfoList;
  }
}

/// a concrete implementation of [InternationalInfoList], since [InternationalInfoList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $InternationalInfoList
    implements
        InternationalInfoList,
        Built<$InternationalInfoList, $InternationalInfoListBuilder> {
  $InternationalInfoList._();

  factory $InternationalInfoList(
          [void Function($InternationalInfoListBuilder)? updates]) =
      _$$InternationalInfoList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($InternationalInfoListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$InternationalInfoList> get serializer =>
      _$$InternationalInfoListSerializer();
}

class _$$InternationalInfoListSerializer
    implements PrimitiveSerializer<$InternationalInfoList> {
  @override
  final Iterable<Type> types = const [
    $InternationalInfoList,
    _$$InternationalInfoList
  ];

  @override
  final String wireName = r'$InternationalInfoList';

  @override
  Object serialize(
    Serializers serializers,
    $InternationalInfoList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(InternationalInfoList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InternationalInfoListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  $InternationalInfoList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $InternationalInfoListBuilder();
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
