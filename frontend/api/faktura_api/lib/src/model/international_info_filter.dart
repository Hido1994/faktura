//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/string_operator_tuple.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'international_info_filter.g.dart';

/// InternationalInfoFilter
///
/// Properties:
/// * [description]
@BuiltValue()
abstract class InternationalInfoFilter
    implements Built<InternationalInfoFilter, InternationalInfoFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  BuiltList<StringOperatorTuple>? get description;

  InternationalInfoFilter._();

  factory InternationalInfoFilter(
          [void updates(InternationalInfoFilterBuilder b)]) =
      _$InternationalInfoFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InternationalInfoFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InternationalInfoFilter> get serializer =>
      _$InternationalInfoFilterSerializer();
}

class _$InternationalInfoFilterSerializer
    implements PrimitiveSerializer<InternationalInfoFilter> {
  @override
  final Iterable<Type> types = const [
    InternationalInfoFilter,
    _$InternationalInfoFilter
  ];

  @override
  final String wireName = r'InternationalInfoFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InternationalInfoFilter object, {
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
    InternationalInfoFilter object, {
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
    required InternationalInfoFilterBuilder result,
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
  InternationalInfoFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InternationalInfoFilterBuilder();
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
