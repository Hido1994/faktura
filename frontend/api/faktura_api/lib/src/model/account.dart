//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account.g.dart';

/// Account
///
/// Properties:
/// * [description] - Description of the account
/// * [id] - Primary key identifier for the account
/// * [noCharging] - Flag indicating if charging is disabled for this account
@BuiltValue()
abstract class Account implements Built<Account, AccountBuilder> {
  /// Description of the account
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Primary key identifier for the account
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Flag indicating if charging is disabled for this account
  @BuiltValueField(wireName: r'noCharging')
  bool? get noCharging;

  Account._();

  factory Account([void updates(AccountBuilder b)]) = _$Account;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Account> get serializer => _$AccountSerializer();
}

class _$AccountSerializer implements PrimitiveSerializer<Account> {
  @override
  final Iterable<Type> types = const [Account, _$Account];

  @override
  final String wireName = r'Account';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Account object, {
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
    if (object.noCharging != null) {
      yield r'noCharging';
      yield serializers.serialize(
        object.noCharging,
        specifiedType: const FullType(bool),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Account object, {
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
    required AccountBuilder result,
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
        case r'noCharging':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(bool),
          ) as bool;
          result.noCharging = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Account deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountBuilder();
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
