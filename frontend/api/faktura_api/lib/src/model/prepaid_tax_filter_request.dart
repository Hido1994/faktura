//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/prepaid_tax_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prepaid_tax_filter_request.g.dart';

/// PrepaidTaxFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class PrepaidTaxFilterRequest
    implements Built<PrepaidTaxFilterRequest, PrepaidTaxFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  PrepaidTaxFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  PrepaidTaxFilterRequest._();

  factory PrepaidTaxFilterRequest(
          [void updates(PrepaidTaxFilterRequestBuilder b)]) =
      _$PrepaidTaxFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrepaidTaxFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrepaidTaxFilterRequest> get serializer =>
      _$PrepaidTaxFilterRequestSerializer();
}

class _$PrepaidTaxFilterRequestSerializer
    implements PrimitiveSerializer<PrepaidTaxFilterRequest> {
  @override
  final Iterable<Type> types = const [
    PrepaidTaxFilterRequest,
    _$PrepaidTaxFilterRequest
  ];

  @override
  final String wireName = r'PrepaidTaxFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrepaidTaxFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(PrepaidTaxFilter),
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
    PrepaidTaxFilterRequest object, {
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
    required PrepaidTaxFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PrepaidTaxFilter),
          ) as PrepaidTaxFilter;
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
  PrepaidTaxFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrepaidTaxFilterRequestBuilder();
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
