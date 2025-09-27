// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CartItemStruct extends BaseStruct {
  CartItemStruct({
    String? ticketTypeId,
    String? ticketTypeName,
    int? quantity,
    int? unitPrice,
    int? originalPrice,
    int? subtotal,
    String? seatingZoneId,
    String? seatingZoneName,
    bool? requiresSeatSelection,
    int? maxPerUser,
    String? addedAt,
  })  : _ticketTypeId = ticketTypeId,
        _ticketTypeName = ticketTypeName,
        _quantity = quantity,
        _unitPrice = unitPrice,
        _originalPrice = originalPrice,
        _subtotal = subtotal,
        _seatingZoneId = seatingZoneId,
        _seatingZoneName = seatingZoneName,
        _requiresSeatSelection = requiresSeatSelection,
        _maxPerUser = maxPerUser,
        _addedAt = addedAt;

  // "ticketTypeId" field.
  String? _ticketTypeId;
  String get ticketTypeId => _ticketTypeId ?? '';
  set ticketTypeId(String? val) => _ticketTypeId = val;

  bool hasTicketTypeId() => _ticketTypeId != null;

  // "ticketTypeName" field.
  String? _ticketTypeName;
  String get ticketTypeName => _ticketTypeName ?? '';
  set ticketTypeName(String? val) => _ticketTypeName = val;

  bool hasTicketTypeName() => _ticketTypeName != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "unitPrice" field.
  int? _unitPrice;
  int get unitPrice => _unitPrice ?? 0;
  set unitPrice(int? val) => _unitPrice = val;

  void incrementUnitPrice(int amount) => unitPrice = unitPrice + amount;

  bool hasUnitPrice() => _unitPrice != null;

  // "originalPrice" field.
  int? _originalPrice;
  int get originalPrice => _originalPrice ?? 0;
  set originalPrice(int? val) => _originalPrice = val;

  void incrementOriginalPrice(int amount) =>
      originalPrice = originalPrice + amount;

  bool hasOriginalPrice() => _originalPrice != null;

  // "subtotal" field.
  int? _subtotal;
  int get subtotal => _subtotal ?? 0;
  set subtotal(int? val) => _subtotal = val;

  void incrementSubtotal(int amount) => subtotal = subtotal + amount;

  bool hasSubtotal() => _subtotal != null;

  // "seatingZoneId" field.
  String? _seatingZoneId;
  String get seatingZoneId => _seatingZoneId ?? '';
  set seatingZoneId(String? val) => _seatingZoneId = val;

  bool hasSeatingZoneId() => _seatingZoneId != null;

  // "seatingZoneName" field.
  String? _seatingZoneName;
  String get seatingZoneName => _seatingZoneName ?? '';
  set seatingZoneName(String? val) => _seatingZoneName = val;

  bool hasSeatingZoneName() => _seatingZoneName != null;

  // "requiresSeatSelection" field.
  bool? _requiresSeatSelection;
  bool get requiresSeatSelection => _requiresSeatSelection ?? false;
  set requiresSeatSelection(bool? val) => _requiresSeatSelection = val;

  bool hasRequiresSeatSelection() => _requiresSeatSelection != null;

  // "maxPerUser" field.
  int? _maxPerUser;
  int get maxPerUser => _maxPerUser ?? 0;
  set maxPerUser(int? val) => _maxPerUser = val;

  void incrementMaxPerUser(int amount) => maxPerUser = maxPerUser + amount;

  bool hasMaxPerUser() => _maxPerUser != null;

  // "addedAt" field.
  String? _addedAt;
  String get addedAt => _addedAt ?? '';
  set addedAt(String? val) => _addedAt = val;

  bool hasAddedAt() => _addedAt != null;

  static CartItemStruct fromMap(Map<String, dynamic> data) => CartItemStruct(
        ticketTypeId: data['ticketTypeId'] as String?,
        ticketTypeName: data['ticketTypeName'] as String?,
        quantity: castToType<int>(data['quantity']),
        unitPrice: castToType<int>(data['unitPrice']),
        originalPrice: castToType<int>(data['originalPrice']),
        subtotal: castToType<int>(data['subtotal']),
        seatingZoneId: data['seatingZoneId'] as String?,
        seatingZoneName: data['seatingZoneName'] as String?,
        requiresSeatSelection: data['requiresSeatSelection'] as bool?,
        maxPerUser: castToType<int>(data['maxPerUser']),
        addedAt: data['addedAt'] as String?,
      );

  static CartItemStruct? maybeFromMap(dynamic data) =>
      data is Map ? CartItemStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'ticketTypeId': _ticketTypeId,
        'ticketTypeName': _ticketTypeName,
        'quantity': _quantity,
        'unitPrice': _unitPrice,
        'originalPrice': _originalPrice,
        'subtotal': _subtotal,
        'seatingZoneId': _seatingZoneId,
        'seatingZoneName': _seatingZoneName,
        'requiresSeatSelection': _requiresSeatSelection,
        'maxPerUser': _maxPerUser,
        'addedAt': _addedAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ticketTypeId': serializeParam(
          _ticketTypeId,
          ParamType.String,
        ),
        'ticketTypeName': serializeParam(
          _ticketTypeName,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'unitPrice': serializeParam(
          _unitPrice,
          ParamType.int,
        ),
        'originalPrice': serializeParam(
          _originalPrice,
          ParamType.int,
        ),
        'subtotal': serializeParam(
          _subtotal,
          ParamType.int,
        ),
        'seatingZoneId': serializeParam(
          _seatingZoneId,
          ParamType.String,
        ),
        'seatingZoneName': serializeParam(
          _seatingZoneName,
          ParamType.String,
        ),
        'requiresSeatSelection': serializeParam(
          _requiresSeatSelection,
          ParamType.bool,
        ),
        'maxPerUser': serializeParam(
          _maxPerUser,
          ParamType.int,
        ),
        'addedAt': serializeParam(
          _addedAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static CartItemStruct fromSerializableMap(Map<String, dynamic> data) =>
      CartItemStruct(
        ticketTypeId: deserializeParam(
          data['ticketTypeId'],
          ParamType.String,
          false,
        ),
        ticketTypeName: deserializeParam(
          data['ticketTypeName'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        unitPrice: deserializeParam(
          data['unitPrice'],
          ParamType.int,
          false,
        ),
        originalPrice: deserializeParam(
          data['originalPrice'],
          ParamType.int,
          false,
        ),
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.int,
          false,
        ),
        seatingZoneId: deserializeParam(
          data['seatingZoneId'],
          ParamType.String,
          false,
        ),
        seatingZoneName: deserializeParam(
          data['seatingZoneName'],
          ParamType.String,
          false,
        ),
        requiresSeatSelection: deserializeParam(
          data['requiresSeatSelection'],
          ParamType.bool,
          false,
        ),
        maxPerUser: deserializeParam(
          data['maxPerUser'],
          ParamType.int,
          false,
        ),
        addedAt: deserializeParam(
          data['addedAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CartItemStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CartItemStruct &&
        ticketTypeId == other.ticketTypeId &&
        ticketTypeName == other.ticketTypeName &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        originalPrice == other.originalPrice &&
        subtotal == other.subtotal &&
        seatingZoneId == other.seatingZoneId &&
        seatingZoneName == other.seatingZoneName &&
        requiresSeatSelection == other.requiresSeatSelection &&
        maxPerUser == other.maxPerUser &&
        addedAt == other.addedAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ticketTypeId,
        ticketTypeName,
        quantity,
        unitPrice,
        originalPrice,
        subtotal,
        seatingZoneId,
        seatingZoneName,
        requiresSeatSelection,
        maxPerUser,
        addedAt
      ]);
}

CartItemStruct createCartItemStruct({
  String? ticketTypeId,
  String? ticketTypeName,
  int? quantity,
  int? unitPrice,
  int? originalPrice,
  int? subtotal,
  String? seatingZoneId,
  String? seatingZoneName,
  bool? requiresSeatSelection,
  int? maxPerUser,
  String? addedAt,
}) =>
    CartItemStruct(
      ticketTypeId: ticketTypeId,
      ticketTypeName: ticketTypeName,
      quantity: quantity,
      unitPrice: unitPrice,
      originalPrice: originalPrice,
      subtotal: subtotal,
      seatingZoneId: seatingZoneId,
      seatingZoneName: seatingZoneName,
      requiresSeatSelection: requiresSeatSelection,
      maxPerUser: maxPerUser,
      addedAt: addedAt,
    );
