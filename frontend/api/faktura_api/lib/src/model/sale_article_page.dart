//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/sale_article_list.dart';
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/sale_article.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_article_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class SaleArticlePage
    implements
        Page,
        SaleArticleList,
        Built<SaleArticlePage, SaleArticlePageBuilder> {
  SaleArticlePage._();

  factory SaleArticlePage([void updates(SaleArticlePageBuilder b)]) =
      _$SaleArticlePage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleArticlePageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleArticlePage> get serializer =>
      _$SaleArticlePageSerializer();
}

class _$SaleArticlePageSerializer
    implements PrimitiveSerializer<SaleArticlePage> {
  @override
  final Iterable<Type> types = const [SaleArticlePage, _$SaleArticlePage];

  @override
  final String wireName = r'SaleArticlePage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleArticlePage object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType(int),
      );
    }
    if (object.number != null) {
      yield r'number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType(int),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(SaleArticle)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleArticlePage object, {
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
    required SaleArticlePageBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.number = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(SaleArticle)]),
          ) as BuiltList<SaleArticle>;
          result.content.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaleArticlePage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleArticlePageBuilder();
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
