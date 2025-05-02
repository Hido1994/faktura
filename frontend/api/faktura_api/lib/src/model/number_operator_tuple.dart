//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'number_operator_tuple.g.dart';

/// NumberOperatorTuple
///
/// Properties:
/// * [operator_]
/// * [value]
@BuiltValue()
abstract class NumberOperatorTuple
    implements Built<NumberOperatorTuple, NumberOperatorTupleBuilder> {
  @BuiltValueField(wireName: r'operator')
  NumberOperatorTupleOperator_Enum get operator_;
  // enum operator_Enum {  EQ,  GT,  GTE,  LT,  LTE,  IS_NULL,  };

  @BuiltValueField(wireName: r'value')
  num? get value;

  NumberOperatorTuple._();

  factory NumberOperatorTuple([void updates(NumberOperatorTupleBuilder b)]) =
      _$NumberOperatorTuple;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(NumberOperatorTupleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<NumberOperatorTuple> get serializer =>
      _$NumberOperatorTupleSerializer();
}

class _$NumberOperatorTupleSerializer
    implements PrimitiveSerializer<NumberOperatorTuple> {
  @override
  final Iterable<Type> types = const [
    NumberOperatorTuple,
    _$NumberOperatorTuple
  ];

  @override
  final String wireName = r'NumberOperatorTuple';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    NumberOperatorTuple object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'operator';
    yield serializers.serialize(
      object.operator_,
      specifiedType: const FullType(NumberOperatorTupleOperator_Enum),
    );
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(num),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    NumberOperatorTuple object, {
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
    required NumberOperatorTupleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(NumberOperatorTupleOperator_Enum),
          ) as NumberOperatorTupleOperator_Enum;
          result.operator_ = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(num),
          ) as num;
          result.value = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  NumberOperatorTuple deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = NumberOperatorTupleBuilder();
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

class NumberOperatorTupleOperator_Enum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'EQ')
  static const NumberOperatorTupleOperator_Enum EQ =
      _$numberOperatorTupleOperatorEnum_EQ;
  @BuiltValueEnumConst(wireName: r'GT')
  static const NumberOperatorTupleOperator_Enum GT =
      _$numberOperatorTupleOperatorEnum_GT;
  @BuiltValueEnumConst(wireName: r'GTE')
  static const NumberOperatorTupleOperator_Enum GTE =
      _$numberOperatorTupleOperatorEnum_GTE;
  @BuiltValueEnumConst(wireName: r'LT')
  static const NumberOperatorTupleOperator_Enum LT =
      _$numberOperatorTupleOperatorEnum_LT;
  @BuiltValueEnumConst(wireName: r'LTE')
  static const NumberOperatorTupleOperator_Enum LTE =
      _$numberOperatorTupleOperatorEnum_LTE;
  @BuiltValueEnumConst(wireName: r'IS_NULL')
  static const NumberOperatorTupleOperator_Enum IS_NULL =
      _$numberOperatorTupleOperatorEnum_IS_NULL;

  static Serializer<NumberOperatorTupleOperator_Enum> get serializer =>
      _$numberOperatorTupleOperatorEnumSerializer;

  const NumberOperatorTupleOperator_Enum._(String name) : super(name);

  static BuiltSet<NumberOperatorTupleOperator_Enum> get values =>
      _$numberOperatorTupleOperatorEnumValues;
  static NumberOperatorTupleOperator_Enum valueOf(String name) =>
      _$numberOperatorTupleOperatorEnumValueOf(name);
}
