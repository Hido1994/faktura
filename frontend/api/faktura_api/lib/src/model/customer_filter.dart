//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/string_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_filter.g.dart';

/// CustomerFilter
///
/// Properties:
/// * [name]
@BuiltValue()
abstract class CustomerFilter
    implements Built<CustomerFilter, CustomerFilterBuilder> {
  @BuiltValueField(wireName: r'name')
  BuiltList<StringOperatorTuple>? get name;

  CustomerFilter._();

  factory CustomerFilter([void updates(CustomerFilterBuilder b)]) =
      _$CustomerFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerFilter> get serializer =>
      _$CustomerFilterSerializer();
}

class _$CustomerFilterSerializer
    implements PrimitiveSerializer<CustomerFilter> {
  @override
  final Iterable<Type> types = const [CustomerFilter, _$CustomerFilter];

  @override
  final String wireName = r'CustomerFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerFilter object, {
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
    CustomerFilter object, {
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
    required CustomerFilterBuilder result,
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
  CustomerFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerFilterBuilder();
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
