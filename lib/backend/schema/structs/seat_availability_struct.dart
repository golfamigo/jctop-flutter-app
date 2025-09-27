// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SeatAvailabilityStruct extends BaseStruct {
  SeatAvailabilityStruct({
    String? id,
    String? seatingZoneId,
    String? seatCode,
    String? rowCode,
    int? columnNumber,
    String? seatType,
    bool? isAvailable,
    bool? isBlocked,
    String? blockedReason,
    String? zoneName,
    String? eventId,
    String? eventTitle,
    String? registrationId,
    String? reservationStatus,
    String? reservedByName,
    MetadataStruct? metadata,
  })  : _id = id,
        _seatingZoneId = seatingZoneId,
        _seatCode = seatCode,
        _rowCode = rowCode,
        _columnNumber = columnNumber,
        _seatType = seatType,
        _isAvailable = isAvailable,
        _isBlocked = isBlocked,
        _blockedReason = blockedReason,
        _zoneName = zoneName,
        _eventId = eventId,
        _eventTitle = eventTitle,
        _registrationId = registrationId,
        _reservationStatus = reservationStatus,
        _reservedByName = reservedByName,
        _metadata = metadata;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "seatingZoneId" field.
  String? _seatingZoneId;
  String get seatingZoneId => _seatingZoneId ?? '';
  set seatingZoneId(String? val) => _seatingZoneId = val;

  bool hasSeatingZoneId() => _seatingZoneId != null;

  // "seatCode" field.
  String? _seatCode;
  String get seatCode => _seatCode ?? '';
  set seatCode(String? val) => _seatCode = val;

  bool hasSeatCode() => _seatCode != null;

  // "rowCode" field.
  String? _rowCode;
  String get rowCode => _rowCode ?? '';
  set rowCode(String? val) => _rowCode = val;

  bool hasRowCode() => _rowCode != null;

  // "columnNumber" field.
  int? _columnNumber;
  int get columnNumber => _columnNumber ?? 0;
  set columnNumber(int? val) => _columnNumber = val;

  void incrementColumnNumber(int amount) =>
      columnNumber = columnNumber + amount;

  bool hasColumnNumber() => _columnNumber != null;

  // "seatType" field.
  String? _seatType;
  String get seatType => _seatType ?? '';
  set seatType(String? val) => _seatType = val;

  bool hasSeatType() => _seatType != null;

  // "isAvailable" field.
  bool? _isAvailable;
  bool get isAvailable => _isAvailable ?? false;
  set isAvailable(bool? val) => _isAvailable = val;

  bool hasIsAvailable() => _isAvailable != null;

  // "isBlocked" field.
  bool? _isBlocked;
  bool get isBlocked => _isBlocked ?? false;
  set isBlocked(bool? val) => _isBlocked = val;

  bool hasIsBlocked() => _isBlocked != null;

  // "blockedReason" field.
  String? _blockedReason;
  String get blockedReason => _blockedReason ?? '';
  set blockedReason(String? val) => _blockedReason = val;

  bool hasBlockedReason() => _blockedReason != null;

  // "zoneName" field.
  String? _zoneName;
  String get zoneName => _zoneName ?? '';
  set zoneName(String? val) => _zoneName = val;

  bool hasZoneName() => _zoneName != null;

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;

  bool hasEventId() => _eventId != null;

  // "eventTitle" field.
  String? _eventTitle;
  String get eventTitle => _eventTitle ?? '';
  set eventTitle(String? val) => _eventTitle = val;

  bool hasEventTitle() => _eventTitle != null;

  // "registrationId" field.
  String? _registrationId;
  String get registrationId => _registrationId ?? '';
  set registrationId(String? val) => _registrationId = val;

  bool hasRegistrationId() => _registrationId != null;

  // "reservationStatus" field.
  String? _reservationStatus;
  String get reservationStatus => _reservationStatus ?? '';
  set reservationStatus(String? val) => _reservationStatus = val;

  bool hasReservationStatus() => _reservationStatus != null;

  // "reservedByName" field.
  String? _reservedByName;
  String get reservedByName => _reservedByName ?? '';
  set reservedByName(String? val) => _reservedByName = val;

  bool hasReservedByName() => _reservedByName != null;

  // "metadata" field.
  MetadataStruct? _metadata;
  MetadataStruct get metadata => _metadata ?? MetadataStruct();
  set metadata(MetadataStruct? val) => _metadata = val;

  void updateMetadata(Function(MetadataStruct) updateFn) {
    updateFn(_metadata ??= MetadataStruct());
  }

  bool hasMetadata() => _metadata != null;

  static SeatAvailabilityStruct fromMap(Map<String, dynamic> data) =>
      SeatAvailabilityStruct(
        id: data['id'] as String?,
        seatingZoneId: data['seatingZoneId'] as String?,
        seatCode: data['seatCode'] as String?,
        rowCode: data['rowCode'] as String?,
        columnNumber: castToType<int>(data['columnNumber']),
        seatType: data['seatType'] as String?,
        isAvailable: data['isAvailable'] as bool?,
        isBlocked: data['isBlocked'] as bool?,
        blockedReason: data['blockedReason'] as String?,
        zoneName: data['zoneName'] as String?,
        eventId: data['eventId'] as String?,
        eventTitle: data['eventTitle'] as String?,
        registrationId: data['registrationId'] as String?,
        reservationStatus: data['reservationStatus'] as String?,
        reservedByName: data['reservedByName'] as String?,
        metadata: data['metadata'] is MetadataStruct
            ? data['metadata']
            : MetadataStruct.maybeFromMap(data['metadata']),
      );

  static SeatAvailabilityStruct? maybeFromMap(dynamic data) => data is Map
      ? SeatAvailabilityStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'seatingZoneId': _seatingZoneId,
        'seatCode': _seatCode,
        'rowCode': _rowCode,
        'columnNumber': _columnNumber,
        'seatType': _seatType,
        'isAvailable': _isAvailable,
        'isBlocked': _isBlocked,
        'blockedReason': _blockedReason,
        'zoneName': _zoneName,
        'eventId': _eventId,
        'eventTitle': _eventTitle,
        'registrationId': _registrationId,
        'reservationStatus': _reservationStatus,
        'reservedByName': _reservedByName,
        'metadata': _metadata?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'seatingZoneId': serializeParam(
          _seatingZoneId,
          ParamType.String,
        ),
        'seatCode': serializeParam(
          _seatCode,
          ParamType.String,
        ),
        'rowCode': serializeParam(
          _rowCode,
          ParamType.String,
        ),
        'columnNumber': serializeParam(
          _columnNumber,
          ParamType.int,
        ),
        'seatType': serializeParam(
          _seatType,
          ParamType.String,
        ),
        'isAvailable': serializeParam(
          _isAvailable,
          ParamType.bool,
        ),
        'isBlocked': serializeParam(
          _isBlocked,
          ParamType.bool,
        ),
        'blockedReason': serializeParam(
          _blockedReason,
          ParamType.String,
        ),
        'zoneName': serializeParam(
          _zoneName,
          ParamType.String,
        ),
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'eventTitle': serializeParam(
          _eventTitle,
          ParamType.String,
        ),
        'registrationId': serializeParam(
          _registrationId,
          ParamType.String,
        ),
        'reservationStatus': serializeParam(
          _reservationStatus,
          ParamType.String,
        ),
        'reservedByName': serializeParam(
          _reservedByName,
          ParamType.String,
        ),
        'metadata': serializeParam(
          _metadata,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static SeatAvailabilityStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      SeatAvailabilityStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        seatingZoneId: deserializeParam(
          data['seatingZoneId'],
          ParamType.String,
          false,
        ),
        seatCode: deserializeParam(
          data['seatCode'],
          ParamType.String,
          false,
        ),
        rowCode: deserializeParam(
          data['rowCode'],
          ParamType.String,
          false,
        ),
        columnNumber: deserializeParam(
          data['columnNumber'],
          ParamType.int,
          false,
        ),
        seatType: deserializeParam(
          data['seatType'],
          ParamType.String,
          false,
        ),
        isAvailable: deserializeParam(
          data['isAvailable'],
          ParamType.bool,
          false,
        ),
        isBlocked: deserializeParam(
          data['isBlocked'],
          ParamType.bool,
          false,
        ),
        blockedReason: deserializeParam(
          data['blockedReason'],
          ParamType.String,
          false,
        ),
        zoneName: deserializeParam(
          data['zoneName'],
          ParamType.String,
          false,
        ),
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        eventTitle: deserializeParam(
          data['eventTitle'],
          ParamType.String,
          false,
        ),
        registrationId: deserializeParam(
          data['registrationId'],
          ParamType.String,
          false,
        ),
        reservationStatus: deserializeParam(
          data['reservationStatus'],
          ParamType.String,
          false,
        ),
        reservedByName: deserializeParam(
          data['reservedByName'],
          ParamType.String,
          false,
        ),
        metadata: deserializeStructParam(
          data['metadata'],
          ParamType.DataStruct,
          false,
          structBuilder: MetadataStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'SeatAvailabilityStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SeatAvailabilityStruct &&
        id == other.id &&
        seatingZoneId == other.seatingZoneId &&
        seatCode == other.seatCode &&
        rowCode == other.rowCode &&
        columnNumber == other.columnNumber &&
        seatType == other.seatType &&
        isAvailable == other.isAvailable &&
        isBlocked == other.isBlocked &&
        blockedReason == other.blockedReason &&
        zoneName == other.zoneName &&
        eventId == other.eventId &&
        eventTitle == other.eventTitle &&
        registrationId == other.registrationId &&
        reservationStatus == other.reservationStatus &&
        reservedByName == other.reservedByName &&
        metadata == other.metadata;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        seatingZoneId,
        seatCode,
        rowCode,
        columnNumber,
        seatType,
        isAvailable,
        isBlocked,
        blockedReason,
        zoneName,
        eventId,
        eventTitle,
        registrationId,
        reservationStatus,
        reservedByName,
        metadata
      ]);
}

SeatAvailabilityStruct createSeatAvailabilityStruct({
  String? id,
  String? seatingZoneId,
  String? seatCode,
  String? rowCode,
  int? columnNumber,
  String? seatType,
  bool? isAvailable,
  bool? isBlocked,
  String? blockedReason,
  String? zoneName,
  String? eventId,
  String? eventTitle,
  String? registrationId,
  String? reservationStatus,
  String? reservedByName,
  MetadataStruct? metadata,
}) =>
    SeatAvailabilityStruct(
      id: id,
      seatingZoneId: seatingZoneId,
      seatCode: seatCode,
      rowCode: rowCode,
      columnNumber: columnNumber,
      seatType: seatType,
      isAvailable: isAvailable,
      isBlocked: isBlocked,
      blockedReason: blockedReason,
      zoneName: zoneName,
      eventId: eventId,
      eventTitle: eventTitle,
      registrationId: registrationId,
      reservationStatus: reservationStatus,
      reservedByName: reservedByName,
      metadata: metadata ?? MetadataStruct(),
    );
