//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/sale_article.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_article_list.g.dart';

/// List of SalesArticles
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class SaleArticleList {
  @BuiltValueField(wireName: r'content')
  BuiltList<SaleArticle>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleArticleList> get serializer =>
      _$SaleArticleListSerializer();
}

class _$SaleArticleListSerializer
    implements PrimitiveSerializer<SaleArticleList> {
  @override
  final Iterable<Type> types = const [SaleArticleList];

  @override
  final String wireName = r'SaleArticleList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleArticleList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    SaleArticleList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  SaleArticleList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($SaleArticleList)) as $SaleArticleList;
  }
}

/// a concrete implementation of [SaleArticleList], since [SaleArticleList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $SaleArticleList
    implements
        SaleArticleList,
        Built<$SaleArticleList, $SaleArticleListBuilder> {
  $SaleArticleList._();

  factory $SaleArticleList([void Function($SaleArticleListBuilder)? updates]) =
      _$$SaleArticleList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($SaleArticleListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$SaleArticleList> get serializer =>
      _$$SaleArticleListSerializer();
}

class _$$SaleArticleListSerializer
    implements PrimitiveSerializer<$SaleArticleList> {
  @override
  final Iterable<Type> types = const [$SaleArticleList, _$$SaleArticleList];

  @override
  final String wireName = r'$SaleArticleList';

  @override
  Object serialize(
    Serializers serializers,
    $SaleArticleList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(SaleArticleList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required SaleArticleListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  $SaleArticleList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $SaleArticleListBuilder();
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
