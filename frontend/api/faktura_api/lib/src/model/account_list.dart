//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/account.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_list.g.dart';

/// List of Accounts
///
/// Properties:
/// * [content]
@BuiltValue(instantiable: false)
abstract class AccountList {
  @BuiltValueField(wireName: r'content')
  BuiltList<Account>? get content;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountList> get serializer => _$AccountListSerializer();
}

class _$AccountListSerializer implements PrimitiveSerializer<AccountList> {
  @override
  final Iterable<Type> types = const [AccountList];

  @override
  final String wireName = r'AccountList';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountList object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.content != null) {
      yield r'content';
      yield serializers.serialize(
        object.content,
        specifiedType: const FullType(BuiltList, [FullType(Account)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  AccountList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($AccountList)) as $AccountList;
  }
}

/// a concrete implementation of [AccountList], since [AccountList] is not instantiable
@BuiltValue(instantiable: true)
abstract class $AccountList
    implements AccountList, Built<$AccountList, $AccountListBuilder> {
  $AccountList._();

  factory $AccountList([void Function($AccountListBuilder)? updates]) =
      _$$AccountList;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($AccountListBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$AccountList> get serializer => _$$AccountListSerializer();
}

class _$$AccountListSerializer implements PrimitiveSerializer<$AccountList> {
  @override
  final Iterable<Type> types = const [$AccountList, _$$AccountList];

  @override
  final String wireName = r'$AccountList';

  @override
  Object serialize(
    Serializers serializers,
    $AccountList object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(AccountList))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required AccountListBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'content':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Account)]),
          ) as BuiltList<Account>;
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
  $AccountList deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $AccountListBuilder();
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
