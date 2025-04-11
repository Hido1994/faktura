//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'prepaid_tax.g.dart';

/// PrepaidTax
///
/// Properties:
/// * [taxYear] - Tax year
/// * [taxQuarter] - Quarter of the tax year
/// * [id] - Primary key identifier for the prepaid tax
/// * [taxCalculated] - Calculated prepaid tax amount
/// * [accountSurplus] - Surplus amount in the tax account
/// * [cashTransfer] - Cash transfer amount
/// * [note] - Additional notes about the prepaid tax
@BuiltValue()
abstract class PrepaidTax implements Built<PrepaidTax, PrepaidTaxBuilder> {
  /// Tax year
  @BuiltValueField(wireName: r'taxYear')
  int get taxYear;

  /// Quarter of the tax year
  @BuiltValueField(wireName: r'taxQuarter')
  int get taxQuarter;

  /// Primary key identifier for the prepaid tax
  @BuiltValueField(wireName: r'id')
  int? get id;

  /// Calculated prepaid tax amount
  @BuiltValueField(wireName: r'taxCalculated')
  double? get taxCalculated;

  /// Surplus amount in the tax account
  @BuiltValueField(wireName: r'accountSurplus')
  double? get accountSurplus;

  /// Cash transfer amount
  @BuiltValueField(wireName: r'cashTransfer')
  double? get cashTransfer;

  /// Additional notes about the prepaid tax
  @BuiltValueField(wireName: r'note')
  String? get note;

  PrepaidTax._();

  factory PrepaidTax([void updates(PrepaidTaxBuilder b)]) = _$PrepaidTax;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PrepaidTaxBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<PrepaidTax> get serializer => _$PrepaidTaxSerializer();
}

class _$PrepaidTaxSerializer implements PrimitiveSerializer<PrepaidTax> {
  @override
  final Iterable<Type> types = const [PrepaidTax, _$PrepaidTax];

  @override
  final String wireName = r'PrepaidTax';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PrepaidTax object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'taxYear';
    yield serializers.serialize(
      object.taxYear,
      specifiedType: const FullType(int),
    );
    yield r'taxQuarter';
    yield serializers.serialize(
      object.taxQuarter,
      specifiedType: const FullType(int),
    );
    if (object.id != null) {
      yield r'id';
      yield serializers.serialize(
        object.id,
        specifiedType: const FullType(int),
      );
    }
    if (object.taxCalculated != null) {
      yield r'taxCalculated';
      yield serializers.serialize(
        object.taxCalculated,
        specifiedType: const FullType(double),
      );
    }
    if (object.accountSurplus != null) {
      yield r'accountSurplus';
      yield serializers.serialize(
        object.accountSurplus,
        specifiedType: const FullType(double),
      );
    }
    if (object.cashTransfer != null) {
      yield r'cashTransfer';
      yield serializers.serialize(
        object.cashTransfer,
        specifiedType: const FullType(double),
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
    PrepaidTax object, {
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
    required PrepaidTaxBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'taxYear':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.taxYear = valueDes;
          break;
        case r'taxQuarter':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.taxQuarter = valueDes;
          break;
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'taxCalculated':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.taxCalculated = valueDes;
          break;
        case r'accountSurplus':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.accountSurplus = valueDes;
          break;
        case r'cashTransfer':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(double),
          ) as double;
          result.cashTransfer = valueDes;
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
  PrepaidTax deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PrepaidTaxBuilder();
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
