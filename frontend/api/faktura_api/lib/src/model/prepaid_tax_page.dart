//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/prepaid_tax.dart';
import 'package:faktura_api/src/model/prepaid_tax_list.dart';
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prepaid_tax_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class PrepaidTaxPage
    implements
        Page,
        PrepaidTaxList,
        Built<PrepaidTaxPage, PrepaidTaxPageBuilder> {
  PrepaidTaxPage._();

  factory PrepaidTaxPage([void updates(PrepaidTaxPageBuilder b)]) =
      _$PrepaidTaxPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrepaidTaxPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrepaidTaxPage> get serializer =>
      _$PrepaidTaxPageSerializer();
}

class _$PrepaidTaxPageSerializer
    implements PrimitiveSerializer<PrepaidTaxPage> {
  @override
  final Iterable<Type> types = const [PrepaidTaxPage, _$PrepaidTaxPage];

  @override
  final String wireName = r'PrepaidTaxPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrepaidTaxPage object, {
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
        specifiedType: const FullType(BuiltList, [FullType(PrepaidTax)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PrepaidTaxPage object, {
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
    required PrepaidTaxPageBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(PrepaidTax)]),
          ) as BuiltList<PrepaidTax>;
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
  PrepaidTaxPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrepaidTaxPageBuilder();
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
