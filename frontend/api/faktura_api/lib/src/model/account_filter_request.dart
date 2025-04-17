//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/account_filter.dart';
import 'package:faktura_api/src/model/pageable.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'account_filter_request.g.dart';

/// AccountFilterRequest
///
/// Properties:
/// * [filter]
/// * [pageable]
@BuiltValue()
abstract class AccountFilterRequest
    implements Built<AccountFilterRequest, AccountFilterRequestBuilder> {
  @BuiltValueField(wireName: r'filter')
  AccountFilter? get filter;

  @BuiltValueField(wireName: r'pageable')
  Pageable? get pageable;

  AccountFilterRequest._();

  factory AccountFilterRequest([void updates(AccountFilterRequestBuilder b)]) =
      _$AccountFilterRequest;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(AccountFilterRequestBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<AccountFilterRequest> get serializer =>
      _$AccountFilterRequestSerializer();
}

class _$AccountFilterRequestSerializer
    implements PrimitiveSerializer<AccountFilterRequest> {
  @override
  final Iterable<Type> types = const [
    AccountFilterRequest,
    _$AccountFilterRequest
  ];

  @override
  final String wireName = r'AccountFilterRequest';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    AccountFilterRequest object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.filter != null) {
      yield r'filter';
      yield serializers.serialize(
        object.filter,
        specifiedType: const FullType(AccountFilter),
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
    AccountFilterRequest object, {
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
    required AccountFilterRequestBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'filter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(AccountFilter),
          ) as AccountFilter;
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
  AccountFilterRequest deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = AccountFilterRequestBuilder();
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
