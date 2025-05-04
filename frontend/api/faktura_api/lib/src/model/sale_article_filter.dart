//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/string_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_article_filter.g.dart';

/// SaleArticleFilter
///
/// Properties:
/// * [description]
@BuiltValue()
abstract class SaleArticleFilter
    implements Built<SaleArticleFilter, SaleArticleFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  BuiltList<StringOperatorTuple>? get description;

  SaleArticleFilter._();

  factory SaleArticleFilter([void updates(SaleArticleFilterBuilder b)]) =
      _$SaleArticleFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleArticleFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleArticleFilter> get serializer =>
      _$SaleArticleFilterSerializer();
}

class _$SaleArticleFilterSerializer
    implements PrimitiveSerializer<SaleArticleFilter> {
  @override
  final Iterable<Type> types = const [SaleArticleFilter, _$SaleArticleFilter];

  @override
  final String wireName = r'SaleArticleFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleArticleFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType:
            const FullType(BuiltList, [FullType(StringOperatorTuple)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleArticleFilter object, {
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
    required SaleArticleFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(StringOperatorTuple)]),
          ) as BuiltList<StringOperatorTuple>;
          result.description.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaleArticleFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleArticleFilterBuilder();
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
