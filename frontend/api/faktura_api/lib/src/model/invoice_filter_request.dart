//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/invoice_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invoice_filter_request.g.dart';

/// InvoiceFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class InvoiceFilterRequest
    implements Built<InvoiceFilterRequest, InvoiceFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  InvoiceFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  InvoiceFilterRequest._();

  factory InvoiceFilterRequest([void updates(InvoiceFilterRequestBuilder b)]) =
      _$InvoiceFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InvoiceFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvoiceFilterRequest> get serializer =>
      _$InvoiceFilterRequestSerializer();
}

class _$InvoiceFilterRequestSerializer
    implements PrimitiveSerializer<InvoiceFilterRequest> {
  @override
  final Iterable<Type> types = const [
    InvoiceFilterRequest,
    _$InvoiceFilterRequest
  ];

  @override
  final String wireName = r'InvoiceFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvoiceFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(InvoiceFilter),
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
    InvoiceFilterRequest object, {
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
    required InvoiceFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InvoiceFilter),
          ) as InvoiceFilter;
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
  InvoiceFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InvoiceFilterRequestBuilder();
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
