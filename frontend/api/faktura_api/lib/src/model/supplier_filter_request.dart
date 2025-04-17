//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/supplier_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier_filter_request.g.dart';

/// SupplierFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class SupplierFilterRequest
    implements Built<SupplierFilterRequest, SupplierFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  SupplierFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  SupplierFilterRequest._();

  factory SupplierFilterRequest(
      [void updates(SupplierFilterRequestBuilder b)]) = _$SupplierFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SupplierFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SupplierFilterRequest> get serializer =>
      _$SupplierFilterRequestSerializer();
}

class _$SupplierFilterRequestSerializer
    implements PrimitiveSerializer<SupplierFilterRequest> {
  @override
  final Iterable<Type> types = const [
    SupplierFilterRequest,
    _$SupplierFilterRequest
  ];

  @override
  final String wireName = r'SupplierFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SupplierFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(SupplierFilter),
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
    SupplierFilterRequest object, {
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
    required SupplierFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SupplierFilter),
          ) as SupplierFilter;
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
  SupplierFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupplierFilterRequestBuilder();
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
