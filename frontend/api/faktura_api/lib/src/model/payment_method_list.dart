//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'payment_method_list.g.dart';

/// List of PaymentMethods
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class PaymentMethodList {
  @BuiltValueField(wireName: r'content')
  BuiltList<PaymentMethod>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<PaymentMethodList> get serializer =>
      _$PaymentMethodListSerializer();
}

class _$PaymentMethodListSerializer
    implements PrimitiveSerializer<PaymentMethodList> {
  @override
  final Iterable<Type> types = const [PaymentMethodList];

  @override
  final String wireName = r'PaymentMethodList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PaymentMethodList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(PaymentMethod)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PaymentMethodList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  PaymentMethodList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($PaymentMethodList)) as $PaymentMethodList;
  }
}

/// a concrete implementation of [PaymentMethodList], since [PaymentMethodList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $PaymentMethodList
    implements
        PaymentMethodList,
        Built<$PaymentMethodList, $PaymentMethodListBuilder> {
  $PaymentMethodList._();

  factory $PaymentMethodList(
          [void Function($PaymentMethodListBuilder)? updates]) =
      _$$PaymentMethodList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($PaymentMethodListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$PaymentMethodList> get serializer =>
      _$$PaymentMethodListSerializer();
}

class _$$PaymentMethodListSerializer
    implements PrimitiveSerializer<$PaymentMethodList> {
  @override
  final Iterable<Type> types = const [$PaymentMethodList, _$$PaymentMethodList];

  @override
  final String wireName = r'$PaymentMethodList';

  @override
  Object serialize(
    Serializers serializers,
    $PaymentMethodList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(PaymentMethodList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required PaymentMethodListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(PaymentMethod)]),
          ) as BuiltList<PaymentMethod>;
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
  $PaymentMethodList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $PaymentMethodListBuilder();
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
