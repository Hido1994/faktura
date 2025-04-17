//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_filter.g.dart';

/// AccountFilter
///
/// Properties:
/// * [description]
@BuiltValue()
abstract class AccountFilter
    implements Built<AccountFilter, AccountFilterBuilder> {
  @BuiltValueField(wireName: r'description')
  String? get description;

  AccountFilter._();

  factory AccountFilter([void updates(AccountFilterBuilder b)]) =
      _$AccountFilter;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountFilterBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountFilter> get serializer =>
      _$AccountFilterSerializer();
}

class _$AccountFilterSerializer implements PrimitiveSerializer<AccountFilter> {
  @override
  final Iterable<Type> types = const [AccountFilter, _$AccountFilter];

  @override
  final String wireName = r'AccountFilter';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountFilter object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.description != null) {
      yield r'description';
      yield serializers.serialize(
        object.description,
        specifiedType: const FullType.nullable(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountFilter object, {
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
    required AccountFilterBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType.nullable(String),
          ) as String?;
          if (valueDes == null) continue;
          result.description = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  AccountFilter deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountFilterBuilder();
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
