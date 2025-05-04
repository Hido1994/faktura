//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/string_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier_filter.g.dart';

/// SupplierFilter
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class SupplierFilter
    implements Built<SupplierFilter, SupplierFilterBuilder> {
  @BuiltValueField(wireName: r'name')
  BuiltList<StringOperatorTuple>? get name;

  SupplierFilter._();

  factory SupplierFilter([void updates(SupplierFilterBuilder b)]) =
      _$SupplierFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SupplierFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SupplierFilter> get serializer =>
      _$SupplierFilterSerializer();
}

class _$SupplierFilterSerializer
    implements PrimitiveSerializer<SupplierFilter> {
  @override
  final Iterable<Type> types = const [SupplierFilter, _$SupplierFilter];

  @override
  final String wireName = r'SupplierFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SupplierFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.name != null) {
      yield r'name';
      yield serializers.serialize(
        object.name,
        specifiedType:
            const FullType(BuiltList, [FullType(StringOperatorTuple)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SupplierFilter object, {
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
    required SupplierFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(StringOperatorTuple)]),
          ) as BuiltList<StringOperatorTuple>;
          result.name.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SupplierFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupplierFilterBuilder();
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
