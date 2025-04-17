//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/earning_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'earning_filter_request.g.dart';

/// EarningFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class EarningFilterRequest
    implements Built<EarningFilterRequest, EarningFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  EarningFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  EarningFilterRequest._();

  factory EarningFilterRequest([void updates(EarningFilterRequestBuilder b)]) =
      _$EarningFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EarningFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EarningFilterRequest> get serializer =>
      _$EarningFilterRequestSerializer();
}

class _$EarningFilterRequestSerializer
    implements PrimitiveSerializer<EarningFilterRequest> {
  @override
  final Iterable<Type> types = const [
    EarningFilterRequest,
    _$EarningFilterRequest
  ];

  @override
  final String wireName = r'EarningFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EarningFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(EarningFilter),
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
    EarningFilterRequest object, {
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
    required EarningFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(EarningFilter),
          ) as EarningFilter;
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
  EarningFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EarningFilterRequestBuilder();
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
