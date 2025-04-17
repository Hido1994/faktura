//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/international_info_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'international_info_filter_request.g.dart';

/// InternationalInfoFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class InternationalInfoFilterRequest
    implements
        Built<InternationalInfoFilterRequest,
            InternationalInfoFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  InternationalInfoFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  InternationalInfoFilterRequest._();

  factory InternationalInfoFilterRequest(
          [void updates(InternationalInfoFilterRequestBuilder b)]) =
      _$InternationalInfoFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InternationalInfoFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InternationalInfoFilterRequest> get serializer =>
      _$InternationalInfoFilterRequestSerializer();
}

class _$InternationalInfoFilterRequestSerializer
    implements PrimitiveSerializer<InternationalInfoFilterRequest> {
  @override
  final Iterable<Type> types = const [
    InternationalInfoFilterRequest,
    _$InternationalInfoFilterRequest
  ];

  @override
  final String wireName = r'InternationalInfoFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InternationalInfoFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(InternationalInfoFilter),
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
    InternationalInfoFilterRequest object, {
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
    required InternationalInfoFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InternationalInfoFilter),
          ) as InternationalInfoFilter;
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
  InternationalInfoFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InternationalInfoFilterRequestBuilder();
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
