//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/customer.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'customer_list.g.dart';

/// List of Customers
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class CustomerList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Customer>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<CustomerList> get serializer => _$CustomerListSerializer();
}

class _$CustomerListSerializer implements PrimitiveSerializer<CustomerList> {
  @override
  final Iterable<Type> types = const [CustomerList];

  @override
  final String wireName = r'CustomerList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    CustomerList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Customer)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    CustomerList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  CustomerList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($CustomerList)) as $CustomerList;
  }
}

/// a concrete implementation of [CustomerList], since [CustomerList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $CustomerList
    implements CustomerList, Built<$CustomerList, $CustomerListBuilder> {
  $CustomerList._();

  factory $CustomerList([void Function($CustomerListBuilder)? updates]) =
      _$$CustomerList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($CustomerListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$CustomerList> get serializer =>
      _$$CustomerListSerializer();
}

class _$$CustomerListSerializer implements PrimitiveSerializer<$CustomerList> {
  @override
  final Iterable<Type> types = const [$CustomerList, _$$CustomerList];

  @override
  final String wireName = r'$CustomerList';

  @override
  Object serialize(
    Serializers serializers,
    $CustomerList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object,
        specifiedType: FullType(CustomerList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required CustomerListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Customer)]),
          ) as BuiltList<Customer>;
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
  $CustomerList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $CustomerListBuilder();
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
