//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'sort.g.dart';

/// Sorting criteria
///
/// Properties:
/// * [property] - Property/field to sort by
/// * [direction] - Sort direction
@BuiltValue()
abstract class Sort implements Built<Sort, SortBuilder> {
  /// Property/field to sort by
  @BuiltValueField(wireName: r'property')
  String get property;

  /// Sort direction
  @BuiltValueField(wireName: r'direction')
  SortDirectionEnum get direction;
  // enum directionEnum {  ASC,  DESC,  };

  Sort._();

  factory Sort([void updates(SortBuilder b)]) = _$Sort;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SortBuilder b) =>
      b..direction = const SortDirectionEnum._('ASC');

  @BuiltValueSerializer(custom: true)
  static Serializer<Sort> get serializer => _$SortSerializer();
}

class _$SortSerializer implements PrimitiveSerializer<Sort> {
  @override
  final Iterable<Type> types = const [Sort, _$Sort];

  @override
  final String wireName = r'Sort';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Sort object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'property';
    yield serializers.serialize(
      object.property,
      specifiedType: const FullType(String),
    );
    yield r'direction';
    yield serializers.serialize(
      object.direction,
      specifiedType: const FullType(SortDirectionEnum),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Sort object, {
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
    required SortBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'property':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.property = valueDes;
          break;
        case r'direction':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SortDirectionEnum),
          ) as SortDirectionEnum;
          result.direction = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Sort deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SortBuilder();
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

class SortDirectionEnum extends EnumClass {
  /// Sort direction
  @BuiltValueEnumConst(wireName: r'ASC')
  static const SortDirectionEnum ASC = _$sortDirectionEnum_ASC;

  /// Sort direction
  @BuiltValueEnumConst(wireName: r'DESC')
  static const SortDirectionEnum DESC = _$sortDirectionEnum_DESC;

  static Serializer<SortDirectionEnum> get serializer =>
      _$sortDirectionEnumSerializer;

  const SortDirectionEnum._(String name) : super(name);

  static BuiltSet<SortDirectionEnum> get values => _$sortDirectionEnumValues;
  static SortDirectionEnum valueOf(String name) =>
      _$sortDirectionEnumValueOf(name);
}
