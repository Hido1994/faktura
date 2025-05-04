//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/number_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invoice_filter.g.dart';

/// InvoiceFilter
///
/// Properties:
/// * [invoiceNumber]
@BuiltValue()
abstract class InvoiceFilter
    implements Built<InvoiceFilter, InvoiceFilterBuilder> {
  @BuiltValueField(wireName: r'invoiceNumber')
  BuiltList<NumberOperatorTuple>? get invoiceNumber;

  InvoiceFilter._();

  factory InvoiceFilter([void updates(InvoiceFilterBuilder b)]) =
      _$InvoiceFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvoiceFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvoiceFilter> get serializer =>
      _$InvoiceFilterSerializer();
}

class _$InvoiceFilterSerializer implements PrimitiveSerializer<InvoiceFilter> {
  @override
  final Iterable<Type> types = const [InvoiceFilter, _$InvoiceFilter];

  @override
  final String wireName = r'InvoiceFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvoiceFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.invoiceNumber != null) {
      yield r'invoiceNumber';
      yield serializers.serialize(
        object.invoiceNumber,
        specifiedType:
            const FullType(BuiltList, [FullType(NumberOperatorTuple)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InvoiceFilter object, {
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
    required InvoiceFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'invoiceNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(NumberOperatorTuple)]),
          ) as BuiltList<NumberOperatorTuple>;
          result.invoiceNumber.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InvoiceFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvoiceFilterBuilder();
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
