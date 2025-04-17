//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/customer_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_filter_request.g.dart';

/// CustomerFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class CustomerFilterRequest
    implements Built<CustomerFilterRequest, CustomerFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  CustomerFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  CustomerFilterRequest._();

  factory CustomerFilterRequest(
      [void updates(CustomerFilterRequestBuilder b)]) = _$CustomerFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CustomerFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerFilterRequest> get serializer =>
      _$CustomerFilterRequestSerializer();
}

class _$CustomerFilterRequestSerializer
    implements PrimitiveSerializer<CustomerFilterRequest> {
  @override
  final Iterable<Type> types = const [
    CustomerFilterRequest,
    _$CustomerFilterRequest
  ];

  @override
  final String wireName = r'CustomerFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(CustomerFilter),
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
    CustomerFilterRequest object, {
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
    required CustomerFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(CustomerFilter),
          ) as CustomerFilter;
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
  CustomerFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CustomerFilterRequestBuilder();
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
