// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventTicketingSummaryStruct extends BaseStruct {
  EventTicketingSummaryStruct({
    String? eventId,
    String? title,
    String? startDate,
    String? status,
    int? maxAttendees,
    int? currentAttendees,
    int? totalTicketTypes,
    int? totalCapacity,
    int? totalSold,
    int? totalAvailable,
    int? totalRevenue,
    int? totalSeatingZones,
    int? totalRegistrations,
    double? overallOccupancyRate,
  })  : _eventId = eventId,
        _title = title,
        _startDate = startDate,
        _status = status,
        _maxAttendees = maxAttendees,
        _currentAttendees = currentAttendees,
        _totalTicketTypes = totalTicketTypes,
        _totalCapacity = totalCapacity,
        _totalSold = totalSold,
        _totalAvailable = totalAvailable,
        _totalRevenue = totalRevenue,
        _totalSeatingZones = totalSeatingZones,
        _totalRegistrations = totalRegistrations,
        _overallOccupancyRate = overallOccupancyRate;

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;

  bool hasEventId() => _eventId != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "startDate" field.
  String? _startDate;
  String get startDate => _startDate ?? '';
  set startDate(String? val) => _startDate = val;

  bool hasStartDate() => _startDate != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "maxAttendees" field.
  int? _maxAttendees;
  int get maxAttendees => _maxAttendees ?? 0;
  set maxAttendees(int? val) => _maxAttendees = val;

  void incrementMaxAttendees(int amount) =>
      maxAttendees = maxAttendees + amount;

  bool hasMaxAttendees() => _maxAttendees != null;

  // "currentAttendees" field.
  int? _currentAttendees;
  int get currentAttendees => _currentAttendees ?? 0;
  set currentAttendees(int? val) => _currentAttendees = val;

  void incrementCurrentAttendees(int amount) =>
      currentAttendees = currentAttendees + amount;

  bool hasCurrentAttendees() => _currentAttendees != null;

  // "totalTicketTypes" field.
  int? _totalTicketTypes;
  int get totalTicketTypes => _totalTicketTypes ?? 0;
  set totalTicketTypes(int? val) => _totalTicketTypes = val;

  void incrementTotalTicketTypes(int amount) =>
      totalTicketTypes = totalTicketTypes + amount;

  bool hasTotalTicketTypes() => _totalTicketTypes != null;

  // "totalCapacity" field.
  int? _totalCapacity;
  int get totalCapacity => _totalCapacity ?? 0;
  set totalCapacity(int? val) => _totalCapacity = val;

  void incrementTotalCapacity(int amount) =>
      totalCapacity = totalCapacity + amount;

  bool hasTotalCapacity() => _totalCapacity != null;

  // "totalSold" field.
  int? _totalSold;
  int get totalSold => _totalSold ?? 0;
  set totalSold(int? val) => _totalSold = val;

  void incrementTotalSold(int amount) => totalSold = totalSold + amount;

  bool hasTotalSold() => _totalSold != null;

  // "totalAvailable" field.
  int? _totalAvailable;
  int get totalAvailable => _totalAvailable ?? 0;
  set totalAvailable(int? val) => _totalAvailable = val;

  void incrementTotalAvailable(int amount) =>
      totalAvailable = totalAvailable + amount;

  bool hasTotalAvailable() => _totalAvailable != null;

  // "totalRevenue" field.
  int? _totalRevenue;
  int get totalRevenue => _totalRevenue ?? 0;
  set totalRevenue(int? val) => _totalRevenue = val;

  void incrementTotalRevenue(int amount) =>
      totalRevenue = totalRevenue + amount;

  bool hasTotalRevenue() => _totalRevenue != null;

  // "totalSeatingZones" field.
  int? _totalSeatingZones;
  int get totalSeatingZones => _totalSeatingZones ?? 0;
  set totalSeatingZones(int? val) => _totalSeatingZones = val;

  void incrementTotalSeatingZones(int amount) =>
      totalSeatingZones = totalSeatingZones + amount;

  bool hasTotalSeatingZones() => _totalSeatingZones != null;

  // "totalRegistrations" field.
  int? _totalRegistrations;
  int get totalRegistrations => _totalRegistrations ?? 0;
  set totalRegistrations(int? val) => _totalRegistrations = val;

  void incrementTotalRegistrations(int amount) =>
      totalRegistrations = totalRegistrations + amount;

  bool hasTotalRegistrations() => _totalRegistrations != null;

  // "overallOccupancyRate" field.
  double? _overallOccupancyRate;
  double get overallOccupancyRate => _overallOccupancyRate ?? 0.0;
  set overallOccupancyRate(double? val) => _overallOccupancyRate = val;

  void incrementOverallOccupancyRate(double amount) =>
      overallOccupancyRate = overallOccupancyRate + amount;

  bool hasOverallOccupancyRate() => _overallOccupancyRate != null;

  static EventTicketingSummaryStruct fromMap(Map<String, dynamic> data) =>
      EventTicketingSummaryStruct(
        eventId: data['eventId'] as String?,
        title: data['title'] as String?,
        startDate: data['startDate'] as String?,
        status: data['status'] as String?,
        maxAttendees: castToType<int>(data['maxAttendees']),
        currentAttendees: castToType<int>(data['currentAttendees']),
        totalTicketTypes: castToType<int>(data['totalTicketTypes']),
        totalCapacity: castToType<int>(data['totalCapacity']),
        totalSold: castToType<int>(data['totalSold']),
        totalAvailable: castToType<int>(data['totalAvailable']),
        totalRevenue: castToType<int>(data['totalRevenue']),
        totalSeatingZones: castToType<int>(data['totalSeatingZones']),
        totalRegistrations: castToType<int>(data['totalRegistrations']),
        overallOccupancyRate: castToType<double>(data['overallOccupancyRate']),
      );

  static EventTicketingSummaryStruct? maybeFromMap(dynamic data) => data is Map
      ? EventTicketingSummaryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'eventId': _eventId,
        'title': _title,
        'startDate': _startDate,
        'status': _status,
        'maxAttendees': _maxAttendees,
        'currentAttendees': _currentAttendees,
        'totalTicketTypes': _totalTicketTypes,
        'totalCapacity': _totalCapacity,
        'totalSold': _totalSold,
        'totalAvailable': _totalAvailable,
        'totalRevenue': _totalRevenue,
        'totalSeatingZones': _totalSeatingZones,
        'totalRegistrations': _totalRegistrations,
        'overallOccupancyRate': _overallOccupancyRate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'startDate': serializeParam(
          _startDate,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'maxAttendees': serializeParam(
          _maxAttendees,
          ParamType.int,
        ),
        'currentAttendees': serializeParam(
          _currentAttendees,
          ParamType.int,
        ),
        'totalTicketTypes': serializeParam(
          _totalTicketTypes,
          ParamType.int,
        ),
        'totalCapacity': serializeParam(
          _totalCapacity,
          ParamType.int,
        ),
        'totalSold': serializeParam(
          _totalSold,
          ParamType.int,
        ),
        'totalAvailable': serializeParam(
          _totalAvailable,
          ParamType.int,
        ),
        'totalRevenue': serializeParam(
          _totalRevenue,
          ParamType.int,
        ),
        'totalSeatingZones': serializeParam(
          _totalSeatingZones,
          ParamType.int,
        ),
        'totalRegistrations': serializeParam(
          _totalRegistrations,
          ParamType.int,
        ),
        'overallOccupancyRate': serializeParam(
          _overallOccupancyRate,
          ParamType.double,
        ),
      }.withoutNulls;

  static EventTicketingSummaryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      EventTicketingSummaryStruct(
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        startDate: deserializeParam(
          data['startDate'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        maxAttendees: deserializeParam(
          data['maxAttendees'],
          ParamType.int,
          false,
        ),
        currentAttendees: deserializeParam(
          data['currentAttendees'],
          ParamType.int,
          false,
        ),
        totalTicketTypes: deserializeParam(
          data['totalTicketTypes'],
          ParamType.int,
          false,
        ),
        totalCapacity: deserializeParam(
          data['totalCapacity'],
          ParamType.int,
          false,
        ),
        totalSold: deserializeParam(
          data['totalSold'],
          ParamType.int,
          false,
        ),
        totalAvailable: deserializeParam(
          data['totalAvailable'],
          ParamType.int,
          false,
        ),
        totalRevenue: deserializeParam(
          data['totalRevenue'],
          ParamType.int,
          false,
        ),
        totalSeatingZones: deserializeParam(
          data['totalSeatingZones'],
          ParamType.int,
          false,
        ),
        totalRegistrations: deserializeParam(
          data['totalRegistrations'],
          ParamType.int,
          false,
        ),
        overallOccupancyRate: deserializeParam(
          data['overallOccupancyRate'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'EventTicketingSummaryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventTicketingSummaryStruct &&
        eventId == other.eventId &&
        title == other.title &&
        startDate == other.startDate &&
        status == other.status &&
        maxAttendees == other.maxAttendees &&
        currentAttendees == other.currentAttendees &&
        totalTicketTypes == other.totalTicketTypes &&
        totalCapacity == other.totalCapacity &&
        totalSold == other.totalSold &&
        totalAvailable == other.totalAvailable &&
        totalRevenue == other.totalRevenue &&
        totalSeatingZones == other.totalSeatingZones &&
        totalRegistrations == other.totalRegistrations &&
        overallOccupancyRate == other.overallOccupancyRate;
  }

  @override
  int get hashCode => const ListEquality().hash([
        eventId,
        title,
        startDate,
        status,
        maxAttendees,
        currentAttendees,
        totalTicketTypes,
        totalCapacity,
        totalSold,
        totalAvailable,
        totalRevenue,
        totalSeatingZones,
        totalRegistrations,
        overallOccupancyRate
      ]);
}

EventTicketingSummaryStruct createEventTicketingSummaryStruct({
  String? eventId,
  String? title,
  String? startDate,
  String? status,
  int? maxAttendees,
  int? currentAttendees,
  int? totalTicketTypes,
  int? totalCapacity,
  int? totalSold,
  int? totalAvailable,
  int? totalRevenue,
  int? totalSeatingZones,
  int? totalRegistrations,
  double? overallOccupancyRate,
}) =>
    EventTicketingSummaryStruct(
      eventId: eventId,
      title: title,
      startDate: startDate,
      status: status,
      maxAttendees: maxAttendees,
      currentAttendees: currentAttendees,
      totalTicketTypes: totalTicketTypes,
      totalCapacity: totalCapacity,
      totalSold: totalSold,
      totalAvailable: totalAvailable,
      totalRevenue: totalRevenue,
      totalSeatingZones: totalSeatingZones,
      totalRegistrations: totalRegistrations,
      overallOccupancyRate: overallOccupancyRate,
    );
