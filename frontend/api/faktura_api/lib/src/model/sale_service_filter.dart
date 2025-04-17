//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sale_service_filter.g.dart';

/// SaleServiceFilter
///
/// Properties:
/// * [description]
@BuiltValue()
abstract class SaleServiceFilter
    implements Built<SaleServiceFilter, SaleServiceFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  SaleServiceFilter._();

  factory SaleServiceFilter([void updates(SaleServiceFilterBuilder b)]) =
      _$SaleServiceFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SaleServiceFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SaleServiceFilter> get serializer =>
      _$SaleServiceFilterSerializer();
}

class _$SaleServiceFilterSerializer
    implements PrimitiveSerializer<SaleServiceFilter> {
  @override
  final Iterable<Type> types = const [SaleServiceFilter, _$SaleServiceFilter];

  @override
  final String wireName = r'SaleServiceFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SaleServiceFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    SaleServiceFilter object, {
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
    required SaleServiceFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  SaleServiceFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SaleServiceFilterBuilder();
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
