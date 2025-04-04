//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/supplier.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier_list.g.dart';

/// List of Suppliers
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class SupplierList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Supplier>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<SupplierList> get serializer => _$SupplierListSerializer();
}

class _$SupplierListSerializer implements PrimitiveSerializer<SupplierList> {
  @override
  final Iterable<Type> types = const [SupplierList];

  @override
  final String wireName = r'SupplierList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SupplierList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Supplier)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SupplierList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  SupplierList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($SupplierList)) as $SupplierList;
  }
}

/// a concrete implementation of [SupplierList], since [SupplierList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SupplierList
    implements SupplierList, Built<$SupplierList, $SupplierListBuilder> {
  $SupplierList._();

  factory $SupplierList([void Function($SupplierListBuilder)? updates]) =
      _$$SupplierList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SupplierListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SupplierList> get serializer =>
      _$$SupplierListSerializer();
}

class _$$SupplierListSerializer implements PrimitiveSerializer<$SupplierList> {
  @override
  final Iterable<Type> types = const [$SupplierList, _$$SupplierList];

  @override
  final String wireName = r'$SupplierList';

  @override
  Object serialize(
    Serializers serializers,
    $SupplierList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(SupplierList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SupplierListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Supplier)]),
          ) as BuiltList<Supplier>;
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
  $SupplierList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SupplierListBuilder();
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
