//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/file.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'file_list.g.dart';

/// List of Files
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class FileList {
  @BuiltValueField(wireName: r'content')
  BuiltList<File>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<FileList> get serializer => _$FileListSerializer();
}

class _$FileListSerializer implements PrimitiveSerializer<FileList> {
  @override
  final Iterable<Type> types = const [FileList];

  @override
  final String wireName = r'FileList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FileList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(File)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FileList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  FileList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($FileList)) as $FileList;
  }
}

/// a concrete implementation of [FileList], since [FileList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $FileList
    implements FileList, Built<$FileList, $FileListBuilder> {
  $FileList._();

  factory $FileList([void Function($FileListBuilder)? updates]) = _$$FileList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($FileListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$FileList> get serializer => _$$FileListSerializer();
}

class _$$FileListSerializer implements PrimitiveSerializer<$FileList> {
  @override
  final Iterable<Type> types = const [$FileList, _$$FileList];

  @override
  final String wireName = r'$FileList';

  @override
  Object serialize(
    Serializers serializers,
    $FileList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(FileList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required FileListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(File)]),
          ) as BuiltList<File>;
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
  $FileList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $FileListBuilder();
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
