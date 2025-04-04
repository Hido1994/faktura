//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/earning.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'earning_list.g.dart';

/// List of Earnings
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class EarningList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Earning>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<EarningList> get serializer => _$EarningListSerializer();
}

class _$EarningListSerializer implements PrimitiveSerializer<EarningList> {
  @override
  final Iterable<Type> types = const [EarningList];

  @override
  final String wireName = r'EarningList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EarningList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Earning)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EarningList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  EarningList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($EarningList)) as $EarningList;
  }
}

/// a concrete implementation of [EarningList], since [EarningList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $EarningList
    implements EarningList, Built<$EarningList, $EarningListBuilder> {
  $EarningList._();

  factory $EarningList([void Function($EarningListBuilder)? updates]) =
      _$$EarningList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($EarningListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$EarningList> get serializer => _$$EarningListSerializer();
}

class _$$EarningListSerializer implements PrimitiveSerializer<$EarningList> {
  @override
  final Iterable<Type> types = const [$EarningList, _$$EarningList];

  @override
  final String wireName = r'$EarningList';

  @override
  Object serialize(
    Serializers serializers,
    $EarningList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(EarningList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required EarningListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Earning)]),
          ) as BuiltList<Earning>;
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
  $EarningList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $EarningListBuilder();
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
