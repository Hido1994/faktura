//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/file_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'file_filter_request.g.dart';

/// FileFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class FileFilterRequest
    implements Built<FileFilterRequest, FileFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  FileFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  FileFilterRequest._();

  factory FileFilterRequest([void updates(FileFilterRequestBuilder b)]) =
      _$FileFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(FileFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<FileFilterRequest> get serializer =>
      _$FileFilterRequestSerializer();
}

class _$FileFilterRequestSerializer
    implements PrimitiveSerializer<FileFilterRequest> {
  @override
  final Iterable<Type> types = const [FileFilterRequest, _$FileFilterRequest];

  @override
  final String wireName = r'FileFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    FileFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(FileFilter),
      );
    }
    if (object.pageable != null) {
      yield r'pageable';
      yield serializers.serialize(
        object.pageable,
        specifiedType: const FullType(Pageable),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    FileFilterRequest object, {
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
    required FileFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(FileFilter),
          ) as FileFilter;
          result.filter.replace(valueDes);
          break;
        case r'pageable':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Pageable),
          ) as Pageable;
          result.pageable.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  FileFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = FileFilterRequestBuilder();
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
