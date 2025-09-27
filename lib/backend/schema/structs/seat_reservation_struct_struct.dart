// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeatReservationStructStruct extends BaseStruct {
  SeatReservationStructStruct({
    String? id,
    String? seatId,
    String? registrationId,
    String? registrationTicketId,
    String? status,
    String? seatCode,
    String? zoneName,
    String? reservedAt,
    String? confirmedAt,
    String? cancelledAt,
  })  : _id = id,
        _seatId = seatId,
        _registrationId = registrationId,
        _registrationTicketId = registrationTicketId,
        _status = status,
        _seatCode = seatCode,
        _zoneName = zoneName,
        _reservedAt = reservedAt,
        _confirmedAt = confirmedAt,
        _cancelledAt = cancelledAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "seatId" field.
  String? _seatId;
  String get seatId => _seatId ?? '';
  set seatId(String? val) => _seatId = val;

  bool hasSeatId() => _seatId != null;

  // "registrationId" field.
  String? _registrationId;
  String get registrationId => _registrationId ?? '';
  set registrationId(String? val) => _registrationId = val;

  bool hasRegistrationId() => _registrationId != null;

  // "registrationTicketId" field.
  String? _registrationTicketId;
  String get registrationTicketId => _registrationTicketId ?? '';
  set registrationTicketId(String? val) => _registrationTicketId = val;

  bool hasRegistrationTicketId() => _registrationTicketId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "seatCode" field.
  String? _seatCode;
  String get seatCode => _seatCode ?? '';
  set seatCode(String? val) => _seatCode = val;

  bool hasSeatCode() => _seatCode != null;

  // "zoneName" field.
  String? _zoneName;
  String get zoneName => _zoneName ?? '';
  set zoneName(String? val) => _zoneName = val;

  bool hasZoneName() => _zoneName != null;

  // "reservedAt" field.
  String? _reservedAt;
  String get reservedAt => _reservedAt ?? '';
  set reservedAt(String? val) => _reservedAt = val;

  bool hasReservedAt() => _reservedAt != null;

  // "confirmedAt" field.
  String? _confirmedAt;
  String get confirmedAt => _confirmedAt ?? '';
  set confirmedAt(String? val) => _confirmedAt = val;

  bool hasConfirmedAt() => _confirmedAt != null;

  // "cancelledAt" field.
  String? _cancelledAt;
  String get cancelledAt => _cancelledAt ?? '';
  set cancelledAt(String? val) => _cancelledAt = val;

  bool hasCancelledAt() => _cancelledAt != null;

  static SeatReservationStructStruct fromMap(Map<String, dynamic> data) =>
      SeatReservationStructStruct(
        id: data['id'] as String?,
        seatId: data['seatId'] as String?,
        registrationId: data['registrationId'] as String?,
        registrationTicketId: data['registrationTicketId'] as String?,
        status: data['status'] as String?,
        seatCode: data['seatCode'] as String?,
        zoneName: data['zoneName'] as String?,
        reservedAt: data['reservedAt'] as String?,
        confirmedAt: data['confirmedAt'] as String?,
        cancelledAt: data['cancelledAt'] as String?,
      );

  static SeatReservationStructStruct? maybeFromMap(dynamic data) => data is Map
      ? SeatReservationStructStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'seatId': _seatId,
        'registrationId': _registrationId,
        'registrationTicketId': _registrationTicketId,
        'status': _status,
        'seatCode': _seatCode,
        'zoneName': _zoneName,
        'reservedAt': _reservedAt,
        'confirmedAt': _confirmedAt,
        'cancelledAt': _cancelledAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'seatId': serializeParam(
          _seatId,
          ParamType.String,
        ),
        'registrationId': serializeParam(
          _registrationId,
          ParamType.String,
        ),
        'registrationTicketId': serializeParam(
          _registrationTicketId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'seatCode': serializeParam(
          _seatCode,
          ParamType.String,
        ),
        'zoneName': serializeParam(
          _zoneName,
          ParamType.String,
        ),
        'reservedAt': serializeParam(
          _reservedAt,
          ParamType.String,
        ),
        'confirmedAt': serializeParam(
          _confirmedAt,
          ParamType.String,
        ),
        'cancelledAt': serializeParam(
          _cancelledAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static SeatReservationStructStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SeatReservationStructStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        seatId: deserializeParam(
          data['seatId'],
          ParamType.String,
          false,
        ),
        registrationId: deserializeParam(
          data['registrationId'],
          ParamType.String,
          false,
        ),
        registrationTicketId: deserializeParam(
          data['registrationTicketId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        seatCode: deserializeParam(
          data['seatCode'],
          ParamType.String,
          false,
        ),
        zoneName: deserializeParam(
          data['zoneName'],
          ParamType.String,
          false,
        ),
        reservedAt: deserializeParam(
          data['reservedAt'],
          ParamType.String,
          false,
        ),
        confirmedAt: deserializeParam(
          data['confirmedAt'],
          ParamType.String,
          false,
        ),
        cancelledAt: deserializeParam(
          data['cancelledAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'SeatReservationStructStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeatReservationStructStruct &&
        id == other.id &&
        seatId == other.seatId &&
        registrationId == other.registrationId &&
        registrationTicketId == other.registrationTicketId &&
        status == other.status &&
        seatCode == other.seatCode &&
        zoneName == other.zoneName &&
        reservedAt == other.reservedAt &&
        confirmedAt == other.confirmedAt &&
        cancelledAt == other.cancelledAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        seatId,
        registrationId,
        registrationTicketId,
        status,
        seatCode,
        zoneName,
        reservedAt,
        confirmedAt,
        cancelledAt
      ]);
}

SeatReservationStructStruct createSeatReservationStructStruct({
  String? id,
  String? seatId,
  String? registrationId,
  String? registrationTicketId,
  String? status,
  String? seatCode,
  String? zoneName,
  String? reservedAt,
  String? confirmedAt,
  String? cancelledAt,
}) =>
    SeatReservationStructStruct(
      id: id,
      seatId: seatId,
      registrationId: registrationId,
      registrationTicketId: registrationTicketId,
      status: status,
      seatCode: seatCode,
      zoneName: zoneName,
      reservedAt: reservedAt,
      confirmedAt: confirmedAt,
      cancelledAt: cancelledAt,
    );
