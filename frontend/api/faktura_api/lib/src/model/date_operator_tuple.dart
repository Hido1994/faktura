//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'date_operator_tuple.g.dart';

/// DateOperatorTuple
///
/// Properties:
/// * [operator_]
/// * [value]
@BuiltValue()
abstract class DateOperatorTuple
    implements Built<DateOperatorTuple, DateOperatorTupleBuilder> {
  @BuiltValueField(wireName: r'operator')
  DateOperatorTupleOperator_Enum? get operator_;
  // enum operator_Enum {  EQ,  GT,  GOE,  LT,  LOE,  IS_NULL,  IS_NOT_NULL,  };

  @BuiltValueField(wireName: r'value')
  DateTime? get value;

  DateOperatorTuple._();

  factory DateOperatorTuple([void updates(DateOperatorTupleBuilder b)]) =
      _$DateOperatorTuple;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(DateOperatorTupleBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<DateOperatorTuple> get serializer =>
      _$DateOperatorTupleSerializer();
}

class _$DateOperatorTupleSerializer
    implements PrimitiveSerializer<DateOperatorTuple> {
  @override
  final Iterable<Type> types = const [DateOperatorTuple, _$DateOperatorTuple];

  @override
  final String wireName = r'DateOperatorTuple';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    DateOperatorTuple object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.operator_ != null) {
      yield r'operator';
      yield serializers.serialize(
        object.operator_,
        specifiedType: const FullType(DateOperatorTupleOperator_Enum),
      );
    }
    if (object.value != null) {
      yield r'value';
      yield serializers.serialize(
        object.value,
        specifiedType: const FullType(DateTime),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    DateOperatorTuple object, {
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
    required DateOperatorTupleBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'operator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateOperatorTupleOperator_Enum),
          ) as DateOperatorTupleOperator_Enum;
          result.operator_ = valueDes;
          break;
        case r'value':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
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
  DateOperatorTuple deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = DateOperatorTupleBuilder();
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

class DateOperatorTupleOperator_Enum extends EnumClass {
  @BuiltValueEnumConst(wireName: r'EQ')
  static const DateOperatorTupleOperator_Enum EQ =
      _$dateOperatorTupleOperatorEnum_EQ;
  @BuiltValueEnumConst(wireName: r'GT')
  static const DateOperatorTupleOperator_Enum GT =
      _$dateOperatorTupleOperatorEnum_GT;
  @BuiltValueEnumConst(wireName: r'GOE')
  static const DateOperatorTupleOperator_Enum GOE =
      _$dateOperatorTupleOperatorEnum_GOE;
  @BuiltValueEnumConst(wireName: r'LT')
  static const DateOperatorTupleOperator_Enum LT =
      _$dateOperatorTupleOperatorEnum_LT;
  @BuiltValueEnumConst(wireName: r'LOE')
  static const DateOperatorTupleOperator_Enum LOE =
      _$dateOperatorTupleOperatorEnum_LOE;
  @BuiltValueEnumConst(wireName: r'IS_NULL')
  static const DateOperatorTupleOperator_Enum IS_NULL =
      _$dateOperatorTupleOperatorEnum_IS_NULL;
  @BuiltValueEnumConst(wireName: r'IS_NOT_NULL')
  static const DateOperatorTupleOperator_Enum IS_NOT_NULL =
      _$dateOperatorTupleOperatorEnum_IS_NOT_NULL;

  static Serializer<DateOperatorTupleOperator_Enum> get serializer =>
      _$dateOperatorTupleOperatorEnumSerializer;

  const DateOperatorTupleOperator_Enum._(String name) : super(name);

  static BuiltSet<DateOperatorTupleOperator_Enum> get values =>
      _$dateOperatorTupleOperatorEnumValues;
  static DateOperatorTupleOperator_Enum valueOf(String name) =>
      _$dateOperatorTupleOperatorEnumValueOf(name);
}
