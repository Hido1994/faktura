//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'pageable.g.dart';

/// Pageable query parameters
///
/// Properties:
/// * [pageNumber]
/// * [pageSize]
@BuiltValue()
abstract class Pageable implements Built<Pageable, PageableBuilder> {
  @BuiltValueField(wireName: r'pageNumber')
  int? get pageNumber;

  @BuiltValueField(wireName: r'pageSize')
  int? get pageSize;

  Pageable._();

  factory Pageable([void updates(PageableBuilder b)]) = _$Pageable;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PageableBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Pageable> get serializer => _$PageableSerializer();
}

class _$PageableSerializer implements PrimitiveSerializer<Pageable> {
  @override
  final Iterable<Type> types = const [Pageable, _$Pageable];

  @override
  final String wireName = r'Pageable';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Pageable object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.pageNumber != null) {
      yield r'pageNumber';
      yield serializers.serialize(
        object.pageNumber,
        specifiedType: const FullType(int),
      );
    }
    if (object.pageSize != null) {
      yield r'pageSize';
      yield serializers.serialize(
        object.pageSize,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Pageable object, {
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
    required PageableBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'pageNumber':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageNumber = valueDes;
          break;
        case r'pageSize':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.pageSize = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Pageable deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PageableBuilder();
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
