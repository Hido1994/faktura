//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'file_filter.g.dart';

/// FileFilter
///
/// Properties:
/// * [key]
@BuiltValue()
abstract class FileFilter implements Built<FileFilter, FileFilterBuilder> {
  @BuiltValueField(wireName: r'key')
  String? get key;

  FileFilter._();

  factory FileFilter([void updates(FileFilterBuilder b)]) = _$FileFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FileFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FileFilter> get serializer => _$FileFilterSerializer();
}

class _$FileFilterSerializer implements PrimitiveSerializer<FileFilter> {
  @override
  final Iterable<Type> types = const [FileFilter, _$FileFilter];

  @override
  final String wireName = r'FileFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FileFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.key != null) {
      yield r'key';
      yield serializers.serialize(
        object.key,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FileFilter object, {
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
    required FileFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.key = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FileFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FileFilterBuilder();
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
