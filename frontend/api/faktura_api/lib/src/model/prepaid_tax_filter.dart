//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/number_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prepaid_tax_filter.g.dart';

/// PrepaidTaxFilter
///
/// Properties:
/// * [taxYear]
@BuiltValue()
abstract class PrepaidTaxFilter
    implements Built<PrepaidTaxFilter, PrepaidTaxFilterBuilder> {
  @BuiltValueField(wireName: r'taxYear')
  BuiltList<NumberOperatorTuple>? get taxYear;

  PrepaidTaxFilter._();

  factory PrepaidTaxFilter([void updates(PrepaidTaxFilterBuilder b)]) =
      _$PrepaidTaxFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrepaidTaxFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrepaidTaxFilter> get serializer =>
      _$PrepaidTaxFilterSerializer();
}

class _$PrepaidTaxFilterSerializer
    implements PrimitiveSerializer<PrepaidTaxFilter> {
  @override
  final Iterable<Type> types = const [PrepaidTaxFilter, _$PrepaidTaxFilter];

  @override
  final String wireName = r'PrepaidTaxFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrepaidTaxFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.taxYear != null) {
      yield r'taxYear';
      yield serializers.serialize(
        object.taxYear,
        specifiedType:
            const FullType(BuiltList, [FullType(NumberOperatorTuple)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PrepaidTaxFilter object, {
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
    required PrepaidTaxFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'taxYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(NumberOperatorTuple)]),
          ) as BuiltList<NumberOperatorTuple>;
          result.taxYear.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PrepaidTaxFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrepaidTaxFilterBuilder();
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
