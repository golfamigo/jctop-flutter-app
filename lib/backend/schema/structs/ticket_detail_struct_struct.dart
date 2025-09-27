// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketDetailStructStruct extends BaseStruct {
  TicketDetailStructStruct({
    String? ticketTypeId,
    String? ticketTypeName,
    int? quantity,
    int? unitPrice,
    int? subtotal,
    String? seatingZone,
  })  : _ticketTypeId = ticketTypeId,
        _ticketTypeName = ticketTypeName,
        _quantity = quantity,
        _unitPrice = unitPrice,
        _subtotal = subtotal,
        _seatingZone = seatingZone;

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

  // "subtotal" field.
  int? _subtotal;
  int get subtotal => _subtotal ?? 0;
  set subtotal(int? val) => _subtotal = val;

  void incrementSubtotal(int amount) => subtotal = subtotal + amount;

  bool hasSubtotal() => _subtotal != null;

  // "seatingZone" field.
  String? _seatingZone;
  String get seatingZone => _seatingZone ?? '';
  set seatingZone(String? val) => _seatingZone = val;

  bool hasSeatingZone() => _seatingZone != null;

  static TicketDetailStructStruct fromMap(Map<String, dynamic> data) =>
      TicketDetailStructStruct(
        ticketTypeId: data['ticketTypeId'] as String?,
        ticketTypeName: data['ticketTypeName'] as String?,
        quantity: castToType<int>(data['quantity']),
        unitPrice: castToType<int>(data['unitPrice']),
        subtotal: castToType<int>(data['subtotal']),
        seatingZone: data['seatingZone'] as String?,
      );

  static TicketDetailStructStruct? maybeFromMap(dynamic data) => data is Map
      ? TicketDetailStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ticketTypeId': _ticketTypeId,
        'ticketTypeName': _ticketTypeName,
        'quantity': _quantity,
        'unitPrice': _unitPrice,
        'subtotal': _subtotal,
        'seatingZone': _seatingZone,
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
        'subtotal': serializeParam(
          _subtotal,
          ParamType.int,
        ),
        'seatingZone': serializeParam(
          _seatingZone,
          ParamType.String,
        ),
      }.withoutNulls;

  static TicketDetailStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TicketDetailStructStruct(
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
        subtotal: deserializeParam(
          data['subtotal'],
          ParamType.int,
          false,
        ),
        seatingZone: deserializeParam(
          data['seatingZone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TicketDetailStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TicketDetailStructStruct &&
        ticketTypeId == other.ticketTypeId &&
        ticketTypeName == other.ticketTypeName &&
        quantity == other.quantity &&
        unitPrice == other.unitPrice &&
        subtotal == other.subtotal &&
        seatingZone == other.seatingZone;
  }

  @override
  int get hashCode => const ListEquality().hash([
        ticketTypeId,
        ticketTypeName,
        quantity,
        unitPrice,
        subtotal,
        seatingZone
      ]);
}

TicketDetailStructStruct createTicketDetailStructStruct({
  String? ticketTypeId,
  String? ticketTypeName,
  int? quantity,
  int? unitPrice,
  int? subtotal,
  String? seatingZone,
}) =>
    TicketDetailStructStruct(
      ticketTypeId: ticketTypeId,
      ticketTypeName: ticketTypeName,
      quantity: quantity,
      unitPrice: unitPrice,
      subtotal: subtotal,
      seatingZone: seatingZone,
    );
