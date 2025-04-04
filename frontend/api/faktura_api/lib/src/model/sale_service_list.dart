//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/sale_service.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_service_list.g.dart';

/// List of SalesServices
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class SaleServiceList {
  @BuiltValueField(wireName: r'content')
  BuiltList<SaleService>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleServiceList> get serializer =>
      _$SaleServiceListSerializer();
}

class _$SaleServiceListSerializer
    implements PrimitiveSerializer<SaleServiceList> {
  @override
  final Iterable<Type> types = const [SaleServiceList];

  @override
  final String wireName = r'SaleServiceList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleServiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(SaleService)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleServiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  SaleServiceList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($SaleServiceList)) as $SaleServiceList;
  }
}

/// a concrete implementation of [SaleServiceList], since [SaleServiceList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SaleServiceList
    implements
        SaleServiceList,
        Built<$SaleServiceList, $SaleServiceListBuilder> {
  $SaleServiceList._();

  factory $SaleServiceList([void Function($SaleServiceListBuilder)? updates]) =
      _$$SaleServiceList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SaleServiceListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SaleServiceList> get serializer =>
      _$$SaleServiceListSerializer();
}

class _$$SaleServiceListSerializer
    implements PrimitiveSerializer<$SaleServiceList> {
  @override
  final Iterable<Type> types = const [$SaleServiceList, _$$SaleServiceList];

  @override
  final String wireName = r'$SaleServiceList';

  @override
  Object serialize(
    Serializers serializers,
    $SaleServiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(SaleServiceList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SaleServiceListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SaleService)]),
          ) as BuiltList<SaleService>;
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
  $SaleServiceList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SaleServiceListBuilder();
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
