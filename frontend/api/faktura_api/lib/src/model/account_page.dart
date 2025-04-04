//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:faktura_api/src/model/account.dart';
import 'package:faktura_api/src/model/page.dart';
import 'package:faktura_api/src/model/account_list.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_page.g.dart';

/// typed Page
///
/// Properties:
/// * [number]
/// * [size]
/// * [content]
@BuiltValue()
abstract class AccountPage
    implements AccountList, Page, Built<AccountPage, AccountPageBuilder> {
  AccountPage._();

  factory AccountPage([void updates(AccountPageBuilder b)]) = _$AccountPage;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountPageBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountPage> get serializer => _$AccountPageSerializer();
}

class _$AccountPageSerializer implements PrimitiveSerializer<AccountPage> {
  @override
  final Iterable<Type> types = const [AccountPage, _$AccountPage];

  @override
  final String wireName = r'AccountPage';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountPage object, {
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
        specifiedType: const FullType(BuiltList, [FullType(Account)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    AccountPage object, {
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
    required AccountPageBuilder result,
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
  AccountPage deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountPageBuilder();
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
