//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'string_operator_tuple.g.dart';

/// StringOperatorTuple
///
/// Properties:
/// * [operator_]
/// * [value]
@BuiltValue()
abstract class StringOperatorTuple
    implements Built<StringOperatorTuple, StringOperatorTupleBuilder> {
  @BuiltValueField(wireName: r'operator')
  StringOperatorTupleOperator_Enum? get operator_;
  // enum operator_Enum {  EQ,  STRING_CONTAINS,  IS_NULL,  IS_NOT_NULL,  };

  @BuiltValueField(wireName: r'value')
  String? get value;

  StringOperatorTuple._();

  factory StringOperatorTuple([void updates(StringOperatorTupleBuilder b)]) =
      _$StringOperatorTuple;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(StringOperatorTupleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<StringOperatorTuple> get serializer =>
      _$StringOperatorTupleSerializer();
}

class _$StringOperatorTupleSerializer
    implements PrimitiveSerializer<StringOperatorTuple> {
  @override
  final Iterable<Type> types = const [
    StringOperatorTuple,
    _$StringOperatorTuple
  ];

  @override
  final String wireName = r'StringOperatorTuple';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    StringOperatorTuple object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.operator_ != null) {
      yield r'operator';
      yield serializers.serialize(
        object.operator_,
        specifiedType: const FullType(StringOperatorTupleOperator_Enum),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    StringOperatorTuple object, {
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
    required StringOperatorTupleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(StringOperatorTupleOperator_Enum),
          ) as StringOperatorTupleOperator_Enum;
          result.operator_ = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
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
  StringOperatorTuple deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = StringOperatorTupleBuilder();
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

class StringOperatorTupleOperator_Enum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'EQ')
  static const StringOperatorTupleOperator_Enum EQ =
      _$stringOperatorTupleOperatorEnum_EQ;
  @BuiltValueEnumConst(wireName: r'STRING_CONTAINS')
  static const StringOperatorTupleOperator_Enum STRING_CONTAINS =
      _$stringOperatorTupleOperatorEnum_STRING_CONTAINS;
  @BuiltValueEnumConst(wireName: r'IS_NULL')
  static const StringOperatorTupleOperator_Enum IS_NULL =
      _$stringOperatorTupleOperatorEnum_IS_NULL;
  @BuiltValueEnumConst(wireName: r'IS_NOT_NULL')
  static const StringOperatorTupleOperator_Enum IS_NOT_NULL =
      _$stringOperatorTupleOperatorEnum_IS_NOT_NULL;

  static Serializer<StringOperatorTupleOperator_Enum> get serializer =>
      _$stringOperatorTupleOperatorEnumSerializer;

  const StringOperatorTupleOperator_Enum._(String name) : super(name);

  static BuiltSet<StringOperatorTupleOperator_Enum> get values =>
      _$stringOperatorTupleOperatorEnumValues;
  static StringOperatorTupleOperator_Enum valueOf(String name) =>
      _$stringOperatorTupleOperatorEnumValueOf(name);
}
