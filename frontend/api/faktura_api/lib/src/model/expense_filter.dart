//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_filter.g.dart';

/// ExpenseFilter
///
/// Properties:
/// * [description]
@BuiltValue()
abstract class ExpenseFilter
    implements Built<ExpenseFilter, ExpenseFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  ExpenseFilter._();

  factory ExpenseFilter([void updates(ExpenseFilterBuilder b)]) =
      _$ExpenseFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseFilter> get serializer =>
      _$ExpenseFilterSerializer();
}

class _$ExpenseFilterSerializer implements PrimitiveSerializer<ExpenseFilter> {
  @override
  final Iterable<Type> types = const [ExpenseFilter, _$ExpenseFilter];

  @override
  final String wireName = r'ExpenseFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseFilter object, {
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
    required ExpenseFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseFilterBuilder();
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
