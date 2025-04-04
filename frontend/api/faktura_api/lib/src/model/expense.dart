//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:faktura_api/src/model/payment_method.dart';
import 'package:faktura_api/src/model/supplier.dart';
import 'package:faktura_api/src/model/account.dart';
import 'package:faktura_api/src/model/date.dart';
import 'package:faktura_api/src/model/international_info.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'expense.g.dart';

/// Expense
///
/// Properties:
/// * [id] - Primary key identifier for the expense
/// * [incomingOn] - Date when the expense was received
/// * [description] - Description of the expense
/// * [priceNet] - Net price of the expense
/// * [priceTax] - Tax amount of the expense
/// * [account]
/// * [paidOn] - Date when the expense was paid
/// * [paymentMethod]
/// * [supplier]
/// * [internationalInfo]
/// * [note] - Additional notes about the expense
/// * [depreciationYears] - Number of years for tax depreciation
@BuiltValue()
abstract class Expense implements Built<Expense, ExpenseBuilder> {
  /// Primary key identifier for the expense
  @BuiltValueField(wireName: r'id')
  int get id;

  /// Date when the expense was received
  @BuiltValueField(wireName: r'incomingOn')
  Date get incomingOn;

  /// Description of the expense
  @BuiltValueField(wireName: r'description')
  String get description;

  /// Net price of the expense
  @BuiltValueField(wireName: r'priceNet')
  double get priceNet;

  /// Tax amount of the expense
  @BuiltValueField(wireName: r'priceTax')
  double get priceTax;

  @BuiltValueField(wireName: r'account')
  Account? get account;

  /// Date when the expense was paid
  @BuiltValueField(wireName: r'paidOn')
  Date? get paidOn;

  @BuiltValueField(wireName: r'paymentMethod')
  PaymentMethod? get paymentMethod;

  @BuiltValueField(wireName: r'supplier')
  Supplier? get supplier;

  @BuiltValueField(wireName: r'internationalInfo')
  InternationalInfo? get internationalInfo;

  /// Additional notes about the expense
  @BuiltValueField(wireName: r'note')
  String? get note;

  /// Number of years for tax depreciation
  @BuiltValueField(wireName: r'depreciationYears')
  int? get depreciationYears;

  Expense._();

  factory Expense([void updates(ExpenseBuilder b)]) = _$Expense;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(ExpenseBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Expense> get serializer => _$ExpenseSerializer();
}

class _$ExpenseSerializer implements PrimitiveSerializer<Expense> {
  @override
  final Iterable<Type> types = const [Expense, _$Expense];

  @override
  final String wireName = r'Expense';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Expense object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'incomingOn';
    yield serializers.serialize(
      object.incomingOn,
      specifiedType: const FullType(Date),
    );
    yield r'description';
    yield serializers.serialize(
      object.description,
      specifiedType: const FullType(String),
    );
    yield r'priceNet';
    yield serializers.serialize(
      object.priceNet,
      specifiedType: const FullType(double),
    );
    yield r'priceTax';
    yield serializers.serialize(
      object.priceTax,
      specifiedType: const FullType(double),
    );
    if (object.account != null) {
      yield r'account';
      yield serializers.serialize(
        object.account,
        specifiedType: const FullType(Account),
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
    if (object.internationalInfo != null) {
      yield r'internationalInfo';
      yield serializers.serialize(
        object.internationalInfo,
        specifiedType: const FullType(InternationalInfo),
      );
    }
    if (object.note != null) {
      yield r'note';
      yield serializers.serialize(
        object.note,
        specifiedType: const FullType(String),
      );
    }
    if (object.depreciationYears != null) {
      yield r'depreciationYears';
      yield serializers.serialize(
        object.depreciationYears,
        specifiedType: const FullType(int),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    Expense object, {
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
    required ExpenseBuilder result,
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
        case r'incomingOn':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Date),
          ) as Date;
          result.incomingOn = valueDes;
          break;
        case r'description':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.description = valueDes;
          break;
        case r'priceNet':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.priceNet = valueDes;
          break;
        case r'priceTax':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.priceTax = valueDes;
          break;
        case r'account':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Account),
          ) as Account;
          result.account.replace(valueDes);
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
        case r'internationalInfo':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(InternationalInfo),
          ) as InternationalInfo;
          result.internationalInfo.replace(valueDes);
          break;
        case r'note':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.note = valueDes;
          break;
        case r'depreciationYears':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.depreciationYears = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Expense deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ExpenseBuilder();
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
