//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/prepaid_tax.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prepaid_tax_list.g.dart';

/// List of PrepaidTaxs
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class PrepaidTaxList {
  @BuiltValueField(wireName: r'content')
  BuiltList<PrepaidTax>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrepaidTaxList> get serializer =>
      _$PrepaidTaxListSerializer();
}

class _$PrepaidTaxListSerializer
    implements PrimitiveSerializer<PrepaidTaxList> {
  @override
  final Iterable<Type> types = const [PrepaidTaxList];

  @override
  final String wireName = r'PrepaidTaxList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrepaidTaxList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
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
    PrepaidTaxList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  PrepaidTaxList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($PrepaidTaxList)) as $PrepaidTaxList;
  }
}

/// a concrete implementation of [PrepaidTaxList], since [PrepaidTaxList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $PrepaidTaxList
    implements PrepaidTaxList, Built<$PrepaidTaxList, $PrepaidTaxListBuilder> {
  $PrepaidTaxList._();

  factory $PrepaidTaxList([void Function($PrepaidTaxListBuilder)? updates]) =
      _$$PrepaidTaxList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($PrepaidTaxListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$PrepaidTaxList> get serializer =>
      _$$PrepaidTaxListSerializer();
}

class _$$PrepaidTaxListSerializer
    implements PrimitiveSerializer<$PrepaidTaxList> {
  @override
  final Iterable<Type> types = const [$PrepaidTaxList, _$$PrepaidTaxList];

  @override
  final String wireName = r'$PrepaidTaxList';

  @override
  Object serialize(
    Serializers serializers,
    $PrepaidTaxList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(PrepaidTaxList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PrepaidTaxListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
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
  $PrepaidTaxList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $PrepaidTaxListBuilder();
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
