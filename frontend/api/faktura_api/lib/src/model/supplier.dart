//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'supplier.g.dart';

/// Supplier
///
/// Properties:
/// * [name] - Full name of the supplier
/// * [id] - Primary key identifier for the supplier
/// * [searchName] - Search name for the supplier
@BuiltValue()
abstract class Supplier implements Built<Supplier, SupplierBuilder> {
  /// Full name of the supplier
  @BuiltValueField(wireName: r'name')
  String get name;

  /// Primary key identifier for the supplier
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Search name for the supplier
  @BuiltValueField(wireName: r'searchName')
  String? get searchName;

  Supplier._();

  factory Supplier([void updates(SupplierBuilder b)]) = _$Supplier;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SupplierBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Supplier> get serializer => _$SupplierSerializer();
}

class _$SupplierSerializer implements PrimitiveSerializer<Supplier> {
  @override
  final Iterable<Type> types = const [Supplier, _$Supplier];

  @override
  final String wireName = r'Supplier';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Supplier object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.searchName != null) {
      yield r'searchName';
      yield serializers.serialize(
        object.searchName,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Supplier object, {
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
    required SupplierBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'searchName':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.searchName = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Supplier deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SupplierBuilder();
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
