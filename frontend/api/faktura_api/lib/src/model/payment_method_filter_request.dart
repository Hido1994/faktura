//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/pageable.dart';
import 'package:faktura_api/src/model/payment_method_filter.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_method_filter_request.g.dart';

/// PaymentMethodFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class PaymentMethodFilterRequest
    implements
        Built<PaymentMethodFilterRequest, PaymentMethodFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  PaymentMethodFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  PaymentMethodFilterRequest._();

  factory PaymentMethodFilterRequest(
          [void updates(PaymentMethodFilterRequestBuilder b)]) =
      _$PaymentMethodFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PaymentMethodFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentMethodFilterRequest> get serializer =>
      _$PaymentMethodFilterRequestSerializer();
}

class _$PaymentMethodFilterRequestSerializer
    implements PrimitiveSerializer<PaymentMethodFilterRequest> {
  @override
  final Iterable<Type> types = const [
    PaymentMethodFilterRequest,
    _$PaymentMethodFilterRequest
  ];

  @override
  final String wireName = r'PaymentMethodFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentMethodFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(PaymentMethodFilter),
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
    PaymentMethodFilterRequest object, {
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
    required PaymentMethodFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethodFilter),
          ) as PaymentMethodFilter;
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
  PaymentMethodFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PaymentMethodFilterRequestBuilder();
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
