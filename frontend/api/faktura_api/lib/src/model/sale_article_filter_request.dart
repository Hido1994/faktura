//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/sale_article_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_article_filter_request.g.dart';

/// SaleArticleFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class SaleArticleFilterRequest
    implements
        Built<SaleArticleFilterRequest, SaleArticleFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  SaleArticleFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  SaleArticleFilterRequest._();

  factory SaleArticleFilterRequest(
          [void updates(SaleArticleFilterRequestBuilder b)]) =
      _$SaleArticleFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleArticleFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleArticleFilterRequest> get serializer =>
      _$SaleArticleFilterRequestSerializer();
}

class _$SaleArticleFilterRequestSerializer
    implements PrimitiveSerializer<SaleArticleFilterRequest> {
  @override
  final Iterable<Type> types = const [
    SaleArticleFilterRequest,
    _$SaleArticleFilterRequest
  ];

  @override
  final String wireName = r'SaleArticleFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleArticleFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(SaleArticleFilter),
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
    SaleArticleFilterRequest object, {
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
    required SaleArticleFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SaleArticleFilter),
          ) as SaleArticleFilter;
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
  SaleArticleFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleArticleFilterRequestBuilder();
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
