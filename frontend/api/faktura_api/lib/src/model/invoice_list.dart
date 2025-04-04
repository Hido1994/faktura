//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/invoice.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'invoice_list.g.dart';

/// List of Invoices
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class InvoiceList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Invoice>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<InvoiceList> get serializer => _$InvoiceListSerializer();
}

class _$InvoiceListSerializer implements PrimitiveSerializer<InvoiceList> {
  @override
  final Iterable<Type> types = const [InvoiceList];

  @override
  final String wireName = r'InvoiceList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InvoiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Invoice)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InvoiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  InvoiceList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($InvoiceList)) as $InvoiceList;
  }
}

/// a concrete implementation of [InvoiceList], since [InvoiceList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $InvoiceList
    implements InvoiceList, Built<$InvoiceList, $InvoiceListBuilder> {
  $InvoiceList._();

  factory $InvoiceList([void Function($InvoiceListBuilder)? updates]) =
      _$$InvoiceList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($InvoiceListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$InvoiceList> get serializer => _$$InvoiceListSerializer();
}

class _$$InvoiceListSerializer implements PrimitiveSerializer<$InvoiceList> {
  @override
  final Iterable<Type> types = const [$InvoiceList, _$$InvoiceList];

  @override
  final String wireName = r'$InvoiceList';

  @override
  Object serialize(
    Serializers serializers,
    $InvoiceList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(InvoiceList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required InvoiceListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Invoice)]),
          ) as BuiltList<Invoice>;
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
  $InvoiceList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $InvoiceListBuilder();
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
