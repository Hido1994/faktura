//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'international_info.g.dart';

/// InternationalInfo
///
/// Properties:
/// * [description] - Description of the international information
/// * [id] - Primary key identifier for the international info
/// * [invoiceText] - Text to be displayed on bills for international transactions
@BuiltValue()
abstract class InternationalInfo
    implements Built<InternationalInfo, InternationalInfoBuilder> {
  /// Description of the international information
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Primary key identifier for the international info
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Text to be displayed on bills for international transactions
  @BuiltValueField(wireName: r'invoiceText')
  String? get invoiceText;

  InternationalInfo._();

  factory InternationalInfo([void updates(InternationalInfoBuilder b)]) =
      _$InternationalInfo;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(InternationalInfoBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<InternationalInfo> get serializer =>
      _$InternationalInfoSerializer();
}

class _$InternationalInfoSerializer
    implements PrimitiveSerializer<InternationalInfo> {
  @override
  final Iterable<Type> types = const [InternationalInfo, _$InternationalInfo];

  @override
  final String wireName = r'InternationalInfo';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    InternationalInfo object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.invoiceText != null) {
      yield r'invoiceText';
      yield serializers.serialize(
        object.invoiceText,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    InternationalInfo object, {
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
    required InternationalInfoBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'invoiceText':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.invoiceText = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  InternationalInfo deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = InternationalInfoBuilder();
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
