// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RegistrationDetailStruct extends BaseStruct {
  RegistrationDetailStruct({
    String? id,
    String? userId,
    String? eventId,
    String? status,
    String? paymentStatus,
    int? totalAmount,
    int? discountAmount,
    int? finalAmount,
    String? qrCode,
    String? confirmationCode,
    String? userName,
    String? userEmail,
    String? eventTitle,
    String? eventDate,
    String? eventLocation,
    List<TicketDetailsStruct>? ticketDetails,
    int? totalTicketTypes,
    int? totalTickets,
    String? createdAt,
    String? checkedInAt,
  })  : _id = id,
        _userId = userId,
        _eventId = eventId,
        _status = status,
        _paymentStatus = paymentStatus,
        _totalAmount = totalAmount,
        _discountAmount = discountAmount,
        _finalAmount = finalAmount,
        _qrCode = qrCode,
        _confirmationCode = confirmationCode,
        _userName = userName,
        _userEmail = userEmail,
        _eventTitle = eventTitle,
        _eventDate = eventDate,
        _eventLocation = eventLocation,
        _ticketDetails = ticketDetails,
        _totalTicketTypes = totalTicketTypes,
        _totalTickets = totalTickets,
        _createdAt = createdAt,
        _checkedInAt = checkedInAt;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  set userId(String? val) => _userId = val;

  bool hasUserId() => _userId != null;

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;

  bool hasEventId() => _eventId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  // "paymentStatus" field.
  String? _paymentStatus;
  String get paymentStatus => _paymentStatus ?? '';
  set paymentStatus(String? val) => _paymentStatus = val;

  bool hasPaymentStatus() => _paymentStatus != null;

  // "totalAmount" field.
  int? _totalAmount;
  int get totalAmount => _totalAmount ?? 0;
  set totalAmount(int? val) => _totalAmount = val;

  void incrementTotalAmount(int amount) => totalAmount = totalAmount + amount;

  bool hasTotalAmount() => _totalAmount != null;

  // "discountAmount" field.
  int? _discountAmount;
  int get discountAmount => _discountAmount ?? 0;
  set discountAmount(int? val) => _discountAmount = val;

  void incrementDiscountAmount(int amount) =>
      discountAmount = discountAmount + amount;

  bool hasDiscountAmount() => _discountAmount != null;

  // "finalAmount" field.
  int? _finalAmount;
  int get finalAmount => _finalAmount ?? 0;
  set finalAmount(int? val) => _finalAmount = val;

  void incrementFinalAmount(int amount) => finalAmount = finalAmount + amount;

  bool hasFinalAmount() => _finalAmount != null;

  // "qrCode" field.
  String? _qrCode;
  String get qrCode => _qrCode ?? '';
  set qrCode(String? val) => _qrCode = val;

  bool hasQrCode() => _qrCode != null;

  // "confirmationCode" field.
  String? _confirmationCode;
  String get confirmationCode => _confirmationCode ?? '';
  set confirmationCode(String? val) => _confirmationCode = val;

  bool hasConfirmationCode() => _confirmationCode != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  set userName(String? val) => _userName = val;

  bool hasUserName() => _userName != null;

  // "userEmail" field.
  String? _userEmail;
  String get userEmail => _userEmail ?? '';
  set userEmail(String? val) => _userEmail = val;

  bool hasUserEmail() => _userEmail != null;

  // "eventTitle" field.
  String? _eventTitle;
  String get eventTitle => _eventTitle ?? '';
  set eventTitle(String? val) => _eventTitle = val;

  bool hasEventTitle() => _eventTitle != null;

  // "eventDate" field.
  String? _eventDate;
  String get eventDate => _eventDate ?? '';
  set eventDate(String? val) => _eventDate = val;

  bool hasEventDate() => _eventDate != null;

  // "eventLocation" field.
  String? _eventLocation;
  String get eventLocation => _eventLocation ?? '';
  set eventLocation(String? val) => _eventLocation = val;

  bool hasEventLocation() => _eventLocation != null;

  // "ticketDetails" field.
  List<TicketDetailsStruct>? _ticketDetails;
  List<TicketDetailsStruct> get ticketDetails => _ticketDetails ?? const [];
  set ticketDetails(List<TicketDetailsStruct>? val) => _ticketDetails = val;

  void updateTicketDetails(Function(List<TicketDetailsStruct>) updateFn) {
    updateFn(_ticketDetails ??= []);
  }

  bool hasTicketDetails() => _ticketDetails != null;

  // "totalTicketTypes" field.
  int? _totalTicketTypes;
  int get totalTicketTypes => _totalTicketTypes ?? 0;
  set totalTicketTypes(int? val) => _totalTicketTypes = val;

  void incrementTotalTicketTypes(int amount) =>
      totalTicketTypes = totalTicketTypes + amount;

  bool hasTotalTicketTypes() => _totalTicketTypes != null;

  // "totalTickets" field.
  int? _totalTickets;
  int get totalTickets => _totalTickets ?? 0;
  set totalTickets(int? val) => _totalTickets = val;

  void incrementTotalTickets(int amount) =>
      totalTickets = totalTickets + amount;

  bool hasTotalTickets() => _totalTickets != null;

  // "createdAt" field.
  String? _createdAt;
  String get createdAt => _createdAt ?? '';
  set createdAt(String? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "checkedInAt" field.
  String? _checkedInAt;
  String get checkedInAt => _checkedInAt ?? '';
  set checkedInAt(String? val) => _checkedInAt = val;

  bool hasCheckedInAt() => _checkedInAt != null;

  static RegistrationDetailStruct fromMap(Map<String, dynamic> data) =>
      RegistrationDetailStruct(
        id: data['id'] as String?,
        userId: data['userId'] as String?,
        eventId: data['eventId'] as String?,
        status: data['status'] as String?,
        paymentStatus: data['paymentStatus'] as String?,
        totalAmount: castToType<int>(data['totalAmount']),
        discountAmount: castToType<int>(data['discountAmount']),
        finalAmount: castToType<int>(data['finalAmount']),
        qrCode: data['qrCode'] as String?,
        confirmationCode: data['confirmationCode'] as String?,
        userName: data['userName'] as String?,
        userEmail: data['userEmail'] as String?,
        eventTitle: data['eventTitle'] as String?,
        eventDate: data['eventDate'] as String?,
        eventLocation: data['eventLocation'] as String?,
        ticketDetails: getStructList(
          data['ticketDetails'],
          TicketDetailsStruct.fromMap,
        ),
        totalTicketTypes: castToType<int>(data['totalTicketTypes']),
        totalTickets: castToType<int>(data['totalTickets']),
        createdAt: data['createdAt'] as String?,
        checkedInAt: data['checkedInAt'] as String?,
      );

  static RegistrationDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? RegistrationDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'userId': _userId,
        'eventId': _eventId,
        'status': _status,
        'paymentStatus': _paymentStatus,
        'totalAmount': _totalAmount,
        'discountAmount': _discountAmount,
        'finalAmount': _finalAmount,
        'qrCode': _qrCode,
        'confirmationCode': _confirmationCode,
        'userName': _userName,
        'userEmail': _userEmail,
        'eventTitle': _eventTitle,
        'eventDate': _eventDate,
        'eventLocation': _eventLocation,
        'ticketDetails': _ticketDetails?.map((e) => e.toMap()).toList(),
        'totalTicketTypes': _totalTicketTypes,
        'totalTickets': _totalTickets,
        'createdAt': _createdAt,
        'checkedInAt': _checkedInAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'userId': serializeParam(
          _userId,
          ParamType.String,
        ),
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
        'paymentStatus': serializeParam(
          _paymentStatus,
          ParamType.String,
        ),
        'totalAmount': serializeParam(
          _totalAmount,
          ParamType.int,
        ),
        'discountAmount': serializeParam(
          _discountAmount,
          ParamType.int,
        ),
        'finalAmount': serializeParam(
          _finalAmount,
          ParamType.int,
        ),
        'qrCode': serializeParam(
          _qrCode,
          ParamType.String,
        ),
        'confirmationCode': serializeParam(
          _confirmationCode,
          ParamType.String,
        ),
        'userName': serializeParam(
          _userName,
          ParamType.String,
        ),
        'userEmail': serializeParam(
          _userEmail,
          ParamType.String,
        ),
        'eventTitle': serializeParam(
          _eventTitle,
          ParamType.String,
        ),
        'eventDate': serializeParam(
          _eventDate,
          ParamType.String,
        ),
        'eventLocation': serializeParam(
          _eventLocation,
          ParamType.String,
        ),
        'ticketDetails': serializeParam(
          _ticketDetails,
          ParamType.DataStruct,
          isList: true,
        ),
        'totalTicketTypes': serializeParam(
          _totalTicketTypes,
          ParamType.int,
        ),
        'totalTickets': serializeParam(
          _totalTickets,
          ParamType.int,
        ),
        'createdAt': serializeParam(
          _createdAt,
          ParamType.String,
        ),
        'checkedInAt': serializeParam(
          _checkedInAt,
          ParamType.String,
        ),
      }.withoutNulls;

  static RegistrationDetailStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      RegistrationDetailStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        userId: deserializeParam(
          data['userId'],
          ParamType.String,
          false,
        ),
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
        paymentStatus: deserializeParam(
          data['paymentStatus'],
          ParamType.String,
          false,
        ),
        totalAmount: deserializeParam(
          data['totalAmount'],
          ParamType.int,
          false,
        ),
        discountAmount: deserializeParam(
          data['discountAmount'],
          ParamType.int,
          false,
        ),
        finalAmount: deserializeParam(
          data['finalAmount'],
          ParamType.int,
          false,
        ),
        qrCode: deserializeParam(
          data['qrCode'],
          ParamType.String,
          false,
        ),
        confirmationCode: deserializeParam(
          data['confirmationCode'],
          ParamType.String,
          false,
        ),
        userName: deserializeParam(
          data['userName'],
          ParamType.String,
          false,
        ),
        userEmail: deserializeParam(
          data['userEmail'],
          ParamType.String,
          false,
        ),
        eventTitle: deserializeParam(
          data['eventTitle'],
          ParamType.String,
          false,
        ),
        eventDate: deserializeParam(
          data['eventDate'],
          ParamType.String,
          false,
        ),
        eventLocation: deserializeParam(
          data['eventLocation'],
          ParamType.String,
          false,
        ),
        ticketDetails: deserializeStructParam<TicketDetailsStruct>(
          data['ticketDetails'],
          ParamType.DataStruct,
          true,
          structBuilder: TicketDetailsStruct.fromSerializableMap,
        ),
        totalTicketTypes: deserializeParam(
          data['totalTicketTypes'],
          ParamType.int,
          false,
        ),
        totalTickets: deserializeParam(
          data['totalTickets'],
          ParamType.int,
          false,
        ),
        createdAt: deserializeParam(
          data['createdAt'],
          ParamType.String,
          false,
        ),
        checkedInAt: deserializeParam(
          data['checkedInAt'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'RegistrationDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is RegistrationDetailStruct &&
        id == other.id &&
        userId == other.userId &&
        eventId == other.eventId &&
        status == other.status &&
        paymentStatus == other.paymentStatus &&
        totalAmount == other.totalAmount &&
        discountAmount == other.discountAmount &&
        finalAmount == other.finalAmount &&
        qrCode == other.qrCode &&
        confirmationCode == other.confirmationCode &&
        userName == other.userName &&
        userEmail == other.userEmail &&
        eventTitle == other.eventTitle &&
        eventDate == other.eventDate &&
        eventLocation == other.eventLocation &&
        listEquality.equals(ticketDetails, other.ticketDetails) &&
        totalTicketTypes == other.totalTicketTypes &&
        totalTickets == other.totalTickets &&
        createdAt == other.createdAt &&
        checkedInAt == other.checkedInAt;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        userId,
        eventId,
        status,
        paymentStatus,
        totalAmount,
        discountAmount,
        finalAmount,
        qrCode,
        confirmationCode,
        userName,
        userEmail,
        eventTitle,
        eventDate,
        eventLocation,
        ticketDetails,
        totalTicketTypes,
        totalTickets,
        createdAt,
        checkedInAt
      ]);
}

RegistrationDetailStruct createRegistrationDetailStruct({
  String? id,
  String? userId,
  String? eventId,
  String? status,
  String? paymentStatus,
  int? totalAmount,
  int? discountAmount,
  int? finalAmount,
  String? qrCode,
  String? confirmationCode,
  String? userName,
  String? userEmail,
  String? eventTitle,
  String? eventDate,
  String? eventLocation,
  int? totalTicketTypes,
  int? totalTickets,
  String? createdAt,
  String? checkedInAt,
}) =>
    RegistrationDetailStruct(
      id: id,
      userId: userId,
      eventId: eventId,
      status: status,
      paymentStatus: paymentStatus,
      totalAmount: totalAmount,
      discountAmount: discountAmount,
      finalAmount: finalAmount,
      qrCode: qrCode,
      confirmationCode: confirmationCode,
      userName: userName,
      userEmail: userEmail,
      eventTitle: eventTitle,
      eventDate: eventDate,
      eventLocation: eventLocation,
      totalTicketTypes: totalTicketTypes,
      totalTickets: totalTickets,
      createdAt: createdAt,
      checkedInAt: checkedInAt,
    );
