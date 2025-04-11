//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'dart:typed_data';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'file.g.dart';

/// File
///
/// Properties:
/// * [key] - Key identifier for the file
/// * [id] - Primary key identifier for the file
/// * [filename] - Name of the file
/// * [mimeType] - MIME type of the file
/// * [charset] - Character set of the file
/// * [lastUpdatedOn] - Date and time when the file was last updated
/// * [content] - Content of the file
@BuiltValue()
abstract class File implements Built<File, FileBuilder> {
  /// Key identifier for the file
  @BuiltValueField(wireName: r'key')
  String get key;

  /// Primary key identifier for the file
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Name of the file
  @BuiltValueField(wireName: r'filename')
  String? get filename;

  /// MIME type of the file
  @BuiltValueField(wireName: r'mimeType')
  String? get mimeType;

  /// Character set of the file
  @BuiltValueField(wireName: r'charset')
  String? get charset;

  /// Date and time when the file was last updated
  @BuiltValueField(wireName: r'lastUpdatedOn')
  DateTime? get lastUpdatedOn;

  /// Content of the file
  @BuiltValueField(wireName: r'content')
  Uint8List? get content;

  File._();

  factory File([void updates(FileBuilder b)]) = _$File;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FileBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<File> get serializer => _$FileSerializer();
}

class _$FileSerializer implements PrimitiveSerializer<File> {
  @override
  final Iterable<Type> types = const [File, _$File];

  @override
  final String wireName = r'File';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    File object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'key';
    yield serializers.serialize(
      object.key,
      specifiedType: const FullType(String),
    );
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.filename != null) {
      yield r'filename';
      yield serializers.serialize(
        object.filename,
        specifiedType: const FullType(String),
      );
    }
    if (object.mimeType != null) {
      yield r'mimeType';
      yield serializers.serialize(
        object.mimeType,
        specifiedType: const FullType(String),
      );
    }
    if (object.charset != null) {
      yield r'charset';
      yield serializers.serialize(
        object.charset,
        specifiedType: const FullType(String),
      );
    }
    if (object.lastUpdatedOn != null) {
      yield r'lastUpdatedOn';
      yield serializers.serialize(
        object.lastUpdatedOn,
        specifiedType: const FullType(DateTime),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(Uint8List),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    File object, {
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
    required FileBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'key':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.key = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'filename':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.filename = valueDes;
          break;
        case r'mimeType':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.mimeType = valueDes;
          break;
        case r'charset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.charset = valueDes;
          break;
        case r'lastUpdatedOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.lastUpdatedOn = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Uint8List),
          ) as Uint8List;
          result.content = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  File deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FileBuilder();
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
