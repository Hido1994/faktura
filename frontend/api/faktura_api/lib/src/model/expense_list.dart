//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/expense.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_list.g.dart';

/// List of Expenses
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class ExpenseList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Expense>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseList> get serializer => _$ExpenseListSerializer();
}

class _$ExpenseListSerializer implements PrimitiveSerializer<ExpenseList> {
  @override
  final Iterable<Type> types = const [ExpenseList];

  @override
  final String wireName = r'ExpenseList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Expense)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  ExpenseList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($ExpenseList)) as $ExpenseList;
  }
}

/// a concrete implementation of [ExpenseList], since [ExpenseList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $ExpenseList
    implements ExpenseList, Built<$ExpenseList, $ExpenseListBuilder> {
  $ExpenseList._();

  factory $ExpenseList([void Function($ExpenseListBuilder)? updates]) =
      _$$ExpenseList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($ExpenseListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$ExpenseList> get serializer => _$$ExpenseListSerializer();
}

class _$$ExpenseListSerializer implements PrimitiveSerializer<$ExpenseList> {
  @override
  final Iterable<Type> types = const [$ExpenseList, _$$ExpenseList];

  @override
  final String wireName = r'$ExpenseList';

  @override
  Object serialize(
    Serializers serializers,
    $ExpenseList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(ExpenseList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required ExpenseListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Expense)]),
          ) as BuiltList<Expense>;
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
  $ExpenseList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $ExpenseListBuilder();
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
