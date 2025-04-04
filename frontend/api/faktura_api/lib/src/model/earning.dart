//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:faktura_api/src/model/supplier.dart';
import 'package:faktura_api/src/model/account.dart';
import 'package:faktura_api/src/model/date.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'earning.g.dart';

/// Earning
///
/// Properties:
/// * [id] - Primary key identifier for the earning
/// * [description] - Description of the earning
/// * [account]
/// * [priceNet] - Net price of the earning
/// * [paidOn] - Date when the earning was paid
/// * [paymentMethod]
/// * [supplier]
/// * [note] - Additional notes about the earning
@BuiltValue()
abstract class Earning implements Built<Earning, EarningBuilder> {
  /// Primary key identifier for the earning
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Description of the earning
  @BuiltValueField(wireName: r'description')
  String get description;

  @BuiltValueField(wireName: r'account')
  Account? get account;

  /// Net price of the earning
  @BuiltValueField(wireName: r'priceNet')
  double? get priceNet;

  /// Date when the earning was paid
  @BuiltValueField(wireName: r'paidOn')
  Date? get paidOn;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;

  @BuiltValueField(wireName: r'supplier')
  Supplier? get supplier;

  /// Additional notes about the earning
  @BuiltValueField(wireName: r'note')
  String? get note;

  Earning._();

  factory Earning([void updates(EarningBuilder b)]) = _$Earning;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(EarningBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Earning> get serializer => _$EarningSerializer();
}

class _$EarningSerializer implements PrimitiveSerializer<Earning> {
  @override
  final Iterable<Type> types = const [Earning, _$Earning];

  @override
  final String wireName = r'Earning';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Earning object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    if (object.account != null) {
      yield r'account';
      yield serializers.serialize(
        object.account,
        specifiedType: const FullType(Account),
      );
    }
    if (object.priceNet != null) {
      yield r'priceNet';
      yield serializers.serialize(
        object.priceNet,
        specifiedType: const FullType(double),
      );
    }
    if (object.paidOn != null) {
      yield r'paidOn';
      yield serializers.serialize(
        object.paidOn,
        specifiedType: const FullType(Date),
      );
    }
    if (object.paymentMethod != null) {
      yield r'paymentMethod';
      yield serializers.serialize(
        object.paymentMethod,
        specifiedType: const FullType(PaymentMethod),
      );
    }
    if (object.supplier != null) {
      yield r'supplier';
      yield serializers.serialize(
        object.supplier,
        specifiedType: const FullType(Supplier),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Earning object, {
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
    required EarningBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Account),
          ) as Account;
          result.account.replace(valueDes);
          break;
        case r'priceNet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.priceNet = valueDes;
          break;
        case r'paidOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.paidOn = valueDes;
          break;
        case r'paymentMethod':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(PaymentMethod),
          ) as PaymentMethod;
          result.paymentMethod.replace(valueDes);
          break;
        case r'supplier':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Supplier),
          ) as Supplier;
          result.supplier.replace(valueDes);
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Earning deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = EarningBuilder();
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
