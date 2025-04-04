//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/earning.dart';
import 'package:faktura_api/src/model/earning_list.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'earning_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class EarningPage
    implements EarningList, Page, Built<EarningPage, EarningPageBuilder> {
  EarningPage._();

  factory EarningPage([void updates(EarningPageBuilder b)]) = _$EarningPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EarningPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<EarningPage> get serializer => _$EarningPageSerializer();
}

class _$EarningPageSerializer implements PrimitiveSerializer<EarningPage> {
  @override
  final Iterable<Type> types = const [EarningPage, _$EarningPage];

  @override
  final String wireName = r'EarningPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    EarningPage object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.size != null) {
      yield r'size';
      yield serializers.serialize(
        object.size,
        specifiedType: const FullType(int),
      );
    }
    if (object.number != null) {
      yield r'number';
      yield serializers.serialize(
        object.number,
        specifiedType: const FullType(int),
      );
    }
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Earning)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    EarningPage object, {
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
    required EarningPageBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'size':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.size = valueDes;
          break;
        case r'number':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.number = valueDes;
          break;
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Earning)]),
          ) as BuiltList<Earning>;
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
  EarningPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EarningPageBuilder();
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
