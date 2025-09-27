// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketTypeDetailStruct extends BaseStruct {
  TicketTypeDetailStruct({
    String? id,
    String? eventId,
    String? name,
    String? description,
    int? price,
    int? quantity,
    int? soldCount,
    String? color,
    String? icon,
    bool? isActive,
    bool? requiresSeatSelection,
    int? maxPerUser,
    String? seatingZoneId,
    String? seatingZoneName,
    int? zoneCapacity,
    int? zonePriceModifier,
    int? availableQuantity,
    int? soldPercentage,
    String? eventTitle,
    String? eventDate,
    String? eventStatus,
  })  : _id = id,
        _eventId = eventId,
        _name = name,
        _description = description,
        _price = price,
        _quantity = quantity,
        _soldCount = soldCount,
        _color = color,
        _icon = icon,
        _isActive = isActive,
        _requiresSeatSelection = requiresSeatSelection,
        _maxPerUser = maxPerUser,
        _seatingZoneId = seatingZoneId,
        _seatingZoneName = seatingZoneName,
        _zoneCapacity = zoneCapacity,
        _zonePriceModifier = zonePriceModifier,
        _availableQuantity = availableQuantity,
        _soldPercentage = soldPercentage,
        _eventTitle = eventTitle,
        _eventDate = eventDate,
        _eventStatus = eventStatus;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "eventId" field.
  String? _eventId;
  String get eventId => _eventId ?? '';
  set eventId(String? val) => _eventId = val;

  bool hasEventId() => _eventId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "quantity" field.
  int? _quantity;
  int get quantity => _quantity ?? 0;
  set quantity(int? val) => _quantity = val;

  void incrementQuantity(int amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "soldCount" field.
  int? _soldCount;
  int get soldCount => _soldCount ?? 0;
  set soldCount(int? val) => _soldCount = val;

  void incrementSoldCount(int amount) => soldCount = soldCount + amount;

  bool hasSoldCount() => _soldCount != null;

  // "color" field.
  String? _color;
  String get color => _color ?? '';
  set color(String? val) => _color = val;

  bool hasColor() => _color != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  set icon(String? val) => _icon = val;

  bool hasIcon() => _icon != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  set isActive(bool? val) => _isActive = val;

  bool hasIsActive() => _isActive != null;

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

  // "zoneCapacity" field.
  int? _zoneCapacity;
  int get zoneCapacity => _zoneCapacity ?? 0;
  set zoneCapacity(int? val) => _zoneCapacity = val;

  void incrementZoneCapacity(int amount) =>
      zoneCapacity = zoneCapacity + amount;

  bool hasZoneCapacity() => _zoneCapacity != null;

  // "zonePriceModifier" field.
  int? _zonePriceModifier;
  int get zonePriceModifier => _zonePriceModifier ?? 0;
  set zonePriceModifier(int? val) => _zonePriceModifier = val;

  void incrementZonePriceModifier(int amount) =>
      zonePriceModifier = zonePriceModifier + amount;

  bool hasZonePriceModifier() => _zonePriceModifier != null;

  // "availableQuantity" field.
  int? _availableQuantity;
  int get availableQuantity => _availableQuantity ?? 0;
  set availableQuantity(int? val) => _availableQuantity = val;

  void incrementAvailableQuantity(int amount) =>
      availableQuantity = availableQuantity + amount;

  bool hasAvailableQuantity() => _availableQuantity != null;

  // "soldPercentage" field.
  int? _soldPercentage;
  int get soldPercentage => _soldPercentage ?? 0;
  set soldPercentage(int? val) => _soldPercentage = val;

  void incrementSoldPercentage(int amount) =>
      soldPercentage = soldPercentage + amount;

  bool hasSoldPercentage() => _soldPercentage != null;

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

  // "eventStatus" field.
  String? _eventStatus;
  String get eventStatus => _eventStatus ?? '';
  set eventStatus(String? val) => _eventStatus = val;

  bool hasEventStatus() => _eventStatus != null;

  static TicketTypeDetailStruct fromMap(Map<String, dynamic> data) =>
      TicketTypeDetailStruct(
        id: data['id'] as String?,
        eventId: data['eventId'] as String?,
        name: data['name'] as String?,
        description: data['description'] as String?,
        price: castToType<int>(data['price']),
        quantity: castToType<int>(data['quantity']),
        soldCount: castToType<int>(data['soldCount']),
        color: data['color'] as String?,
        icon: data['icon'] as String?,
        isActive: data['isActive'] as bool?,
        requiresSeatSelection: data['requiresSeatSelection'] as bool?,
        maxPerUser: castToType<int>(data['maxPerUser']),
        seatingZoneId: data['seatingZoneId'] as String?,
        seatingZoneName: data['seatingZoneName'] as String?,
        zoneCapacity: castToType<int>(data['zoneCapacity']),
        zonePriceModifier: castToType<int>(data['zonePriceModifier']),
        availableQuantity: castToType<int>(data['availableQuantity']),
        soldPercentage: castToType<int>(data['soldPercentage']),
        eventTitle: data['eventTitle'] as String?,
        eventDate: data['eventDate'] as String?,
        eventStatus: data['eventStatus'] as String?,
      );

  static TicketTypeDetailStruct? maybeFromMap(dynamic data) => data is Map
      ? TicketTypeDetailStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'eventId': _eventId,
        'name': _name,
        'description': _description,
        'price': _price,
        'quantity': _quantity,
        'soldCount': _soldCount,
        'color': _color,
        'icon': _icon,
        'isActive': _isActive,
        'requiresSeatSelection': _requiresSeatSelection,
        'maxPerUser': _maxPerUser,
        'seatingZoneId': _seatingZoneId,
        'seatingZoneName': _seatingZoneName,
        'zoneCapacity': _zoneCapacity,
        'zonePriceModifier': _zonePriceModifier,
        'availableQuantity': _availableQuantity,
        'soldPercentage': _soldPercentage,
        'eventTitle': _eventTitle,
        'eventDate': _eventDate,
        'eventStatus': _eventStatus,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'eventId': serializeParam(
          _eventId,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.int,
        ),
        'soldCount': serializeParam(
          _soldCount,
          ParamType.int,
        ),
        'color': serializeParam(
          _color,
          ParamType.String,
        ),
        'icon': serializeParam(
          _icon,
          ParamType.String,
        ),
        'isActive': serializeParam(
          _isActive,
          ParamType.bool,
        ),
        'requiresSeatSelection': serializeParam(
          _requiresSeatSelection,
          ParamType.bool,
        ),
        'maxPerUser': serializeParam(
          _maxPerUser,
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
        'zoneCapacity': serializeParam(
          _zoneCapacity,
          ParamType.int,
        ),
        'zonePriceModifier': serializeParam(
          _zonePriceModifier,
          ParamType.int,
        ),
        'availableQuantity': serializeParam(
          _availableQuantity,
          ParamType.int,
        ),
        'soldPercentage': serializeParam(
          _soldPercentage,
          ParamType.int,
        ),
        'eventTitle': serializeParam(
          _eventTitle,
          ParamType.String,
        ),
        'eventDate': serializeParam(
          _eventDate,
          ParamType.String,
        ),
        'eventStatus': serializeParam(
          _eventStatus,
          ParamType.String,
        ),
      }.withoutNulls;

  static TicketTypeDetailStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TicketTypeDetailStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        eventId: deserializeParam(
          data['eventId'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.int,
          false,
        ),
        soldCount: deserializeParam(
          data['soldCount'],
          ParamType.int,
          false,
        ),
        color: deserializeParam(
          data['color'],
          ParamType.String,
          false,
        ),
        icon: deserializeParam(
          data['icon'],
          ParamType.String,
          false,
        ),
        isActive: deserializeParam(
          data['isActive'],
          ParamType.bool,
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
        zoneCapacity: deserializeParam(
          data['zoneCapacity'],
          ParamType.int,
          false,
        ),
        zonePriceModifier: deserializeParam(
          data['zonePriceModifier'],
          ParamType.int,
          false,
        ),
        availableQuantity: deserializeParam(
          data['availableQuantity'],
          ParamType.int,
          false,
        ),
        soldPercentage: deserializeParam(
          data['soldPercentage'],
          ParamType.int,
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
        eventStatus: deserializeParam(
          data['eventStatus'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TicketTypeDetailStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TicketTypeDetailStruct &&
        id == other.id &&
        eventId == other.eventId &&
        name == other.name &&
        description == other.description &&
        price == other.price &&
        quantity == other.quantity &&
        soldCount == other.soldCount &&
        color == other.color &&
        icon == other.icon &&
        isActive == other.isActive &&
        requiresSeatSelection == other.requiresSeatSelection &&
        maxPerUser == other.maxPerUser &&
        seatingZoneId == other.seatingZoneId &&
        seatingZoneName == other.seatingZoneName &&
        zoneCapacity == other.zoneCapacity &&
        zonePriceModifier == other.zonePriceModifier &&
        availableQuantity == other.availableQuantity &&
        soldPercentage == other.soldPercentage &&
        eventTitle == other.eventTitle &&
        eventDate == other.eventDate &&
        eventStatus == other.eventStatus;
  }

  @override
  int get hashCode => const ListEquality().hash([
        id,
        eventId,
        name,
        description,
        price,
        quantity,
        soldCount,
        color,
        icon,
        isActive,
        requiresSeatSelection,
        maxPerUser,
        seatingZoneId,
        seatingZoneName,
        zoneCapacity,
        zonePriceModifier,
        availableQuantity,
        soldPercentage,
        eventTitle,
        eventDate,
        eventStatus
      ]);
}

TicketTypeDetailStruct createTicketTypeDetailStruct({
  String? id,
  String? eventId,
  String? name,
  String? description,
  int? price,
  int? quantity,
  int? soldCount,
  String? color,
  String? icon,
  bool? isActive,
  bool? requiresSeatSelection,
  int? maxPerUser,
  String? seatingZoneId,
  String? seatingZoneName,
  int? zoneCapacity,
  int? zonePriceModifier,
  int? availableQuantity,
  int? soldPercentage,
  String? eventTitle,
  String? eventDate,
  String? eventStatus,
}) =>
    TicketTypeDetailStruct(
      id: id,
      eventId: eventId,
      name: name,
      description: description,
      price: price,
      quantity: quantity,
      soldCount: soldCount,
      color: color,
      icon: icon,
      isActive: isActive,
      requiresSeatSelection: requiresSeatSelection,
      maxPerUser: maxPerUser,
      seatingZoneId: seatingZoneId,
      seatingZoneName: seatingZoneName,
      zoneCapacity: zoneCapacity,
      zonePriceModifier: zonePriceModifier,
      availableQuantity: availableQuantity,
      soldPercentage: soldPercentage,
      eventTitle: eventTitle,
      eventDate: eventDate,
      eventStatus: eventStatus,
    );
