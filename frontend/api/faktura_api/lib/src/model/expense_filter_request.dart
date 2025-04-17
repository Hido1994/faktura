//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/expense_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense_filter_request.g.dart';

/// ExpenseFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class ExpenseFilterRequest
    implements Built<ExpenseFilterRequest, ExpenseFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  ExpenseFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  ExpenseFilterRequest._();

  factory ExpenseFilterRequest([void updates(ExpenseFilterRequestBuilder b)]) =
      _$ExpenseFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<ExpenseFilterRequest> get serializer =>
      _$ExpenseFilterRequestSerializer();
}

class _$ExpenseFilterRequestSerializer
    implements PrimitiveSerializer<ExpenseFilterRequest> {
  @override
  final Iterable<Type> types = const [
    ExpenseFilterRequest,
    _$ExpenseFilterRequest
  ];

  @override
  final String wireName = r'ExpenseFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    ExpenseFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(ExpenseFilter),
      );
    }
    if (object.pageable != null) {
      yield r'pageable';
      yield serializers.serialize(
        object.pageable,
        specifiedType: const FullType(Pageable),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    ExpenseFilterRequest object, {
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
    required ExpenseFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(ExpenseFilter),
          ) as ExpenseFilter;
          result.filter.replace(valueDes);
          break;
        case r'pageable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Pageable),
          ) as Pageable;
          result.pageable.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  ExpenseFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseFilterRequestBuilder();
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
