//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/setting_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'setting_filter_request.g.dart';

/// SettingFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class SettingFilterRequest
    implements Built<SettingFilterRequest, SettingFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  SettingFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  SettingFilterRequest._();

  factory SettingFilterRequest([void updates(SettingFilterRequestBuilder b)]) =
      _$SettingFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(SettingFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<SettingFilterRequest> get serializer =>
      _$SettingFilterRequestSerializer();
}

class _$SettingFilterRequestSerializer
    implements PrimitiveSerializer<SettingFilterRequest> {
  @override
  final Iterable<Type> types = const [
    SettingFilterRequest,
    _$SettingFilterRequest
  ];

  @override
  final String wireName = r'SettingFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    SettingFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(SettingFilter),
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
    SettingFilterRequest object, {
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
    required SettingFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(SettingFilter),
          ) as SettingFilter;
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
  SettingFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = SettingFilterRequestBuilder();
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
