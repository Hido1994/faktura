//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/sale_service_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_service_filter_request.g.dart';

/// SaleServiceFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class SaleServiceFilterRequest
    implements
        Built<SaleServiceFilterRequest, SaleServiceFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  SaleServiceFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  SaleServiceFilterRequest._();

  factory SaleServiceFilterRequest(
          [void updates(SaleServiceFilterRequestBuilder b)]) =
      _$SaleServiceFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleServiceFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleServiceFilterRequest> get serializer =>
      _$SaleServiceFilterRequestSerializer();
}

class _$SaleServiceFilterRequestSerializer
    implements PrimitiveSerializer<SaleServiceFilterRequest> {
  @override
  final Iterable<Type> types = const [
    SaleServiceFilterRequest,
    _$SaleServiceFilterRequest
  ];

  @override
  final String wireName = r'SaleServiceFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleServiceFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(SaleServiceFilter),
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
    SaleServiceFilterRequest object, {
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
    required SaleServiceFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SaleServiceFilter),
          ) as SaleServiceFilter;
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
  SaleServiceFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleServiceFilterRequestBuilder();
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
