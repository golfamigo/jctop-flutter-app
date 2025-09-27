// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsStruct extends BaseStruct {
  EventsStruct({
    String? location,
    String? title,
    DateTime? date,
    double? rating,
    String? tag,
    String? img,
    String? descr,
    int? tickets,
    int? dayleft,
    String? ticketStatus,
    DateTime? createdAt,
    int? startHour,
    double? minPrice,
    double? maxPrice,
    double? avgPrice,
    bool? isFavorite,
    String? id,
  })  : _location = location,
        _title = title,
        _date = date,
        _rating = rating,
        _tag = tag,
        _img = img,
        _descr = descr,
        _tickets = tickets,
        _dayleft = dayleft,
        _ticketStatus = ticketStatus,
        _createdAt = createdAt,
        _startHour = startHour,
        _minPrice = minPrice,
        _maxPrice = maxPrice,
        _avgPrice = avgPrice,
        _isFavorite = isFavorite,
        _id = id;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;

  bool hasDate() => _date != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  set rating(double? val) => _rating = val;

  void incrementRating(double amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "tag" field.
  String? _tag;
  String get tag => _tag ?? '';
  set tag(String? val) => _tag = val;

  bool hasTag() => _tag != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "descr" field.
  String? _descr;
  String get descr => _descr ?? '';
  set descr(String? val) => _descr = val;

  bool hasDescr() => _descr != null;

  // "tickets" field.
  int? _tickets;
  int get tickets => _tickets ?? 0;
  set tickets(int? val) => _tickets = val;

  void incrementTickets(int amount) => tickets = tickets + amount;

  bool hasTickets() => _tickets != null;

  // "dayleft" field.
  int? _dayleft;
  int get dayleft => _dayleft ?? 0;
  set dayleft(int? val) => _dayleft = val;

  void incrementDayleft(int amount) => dayleft = dayleft + amount;

  bool hasDayleft() => _dayleft != null;

  // "ticketStatus" field.
  String? _ticketStatus;
  String get ticketStatus => _ticketStatus ?? '';
  set ticketStatus(String? val) => _ticketStatus = val;

  bool hasTicketStatus() => _ticketStatus != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  set createdAt(DateTime? val) => _createdAt = val;

  bool hasCreatedAt() => _createdAt != null;

  // "startHour" field.
  int? _startHour;
  int get startHour => _startHour ?? 0;
  set startHour(int? val) => _startHour = val;

  void incrementStartHour(int amount) => startHour = startHour + amount;

  bool hasStartHour() => _startHour != null;

  // "minPrice" field.
  double? _minPrice;
  double get minPrice => _minPrice ?? 0.0;
  set minPrice(double? val) => _minPrice = val;

  void incrementMinPrice(double amount) => minPrice = minPrice + amount;

  bool hasMinPrice() => _minPrice != null;

  // "maxPrice" field.
  double? _maxPrice;
  double get maxPrice => _maxPrice ?? 0.0;
  set maxPrice(double? val) => _maxPrice = val;

  void incrementMaxPrice(double amount) => maxPrice = maxPrice + amount;

  bool hasMaxPrice() => _maxPrice != null;

  // "avgPrice" field.
  double? _avgPrice;
  double get avgPrice => _avgPrice ?? 0.0;
  set avgPrice(double? val) => _avgPrice = val;

  void incrementAvgPrice(double amount) => avgPrice = avgPrice + amount;

  bool hasAvgPrice() => _avgPrice != null;

  // "isFavorite" field.
  bool? _isFavorite;
  bool get isFavorite => _isFavorite ?? false;
  set isFavorite(bool? val) => _isFavorite = val;

  bool hasIsFavorite() => _isFavorite != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
        location: data['location'] as String?,
        title: data['title'] as String?,
        date: data['date'] as DateTime?,
        rating: castToType<double>(data['rating']),
        tag: data['tag'] as String?,
        img: data['img'] as String?,
        descr: data['descr'] as String?,
        tickets: castToType<int>(data['tickets']),
        dayleft: castToType<int>(data['dayleft']),
        ticketStatus: data['ticketStatus'] as String?,
        createdAt: data['created_at'] as DateTime?,
        startHour: castToType<int>(data['startHour']),
        minPrice: castToType<double>(data['minPrice']),
        maxPrice: castToType<double>(data['maxPrice']),
        avgPrice: castToType<double>(data['avgPrice']),
        isFavorite: data['isFavorite'] as bool?,
        id: data['id'] as String?,
      );

  static EventsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'location': _location,
        'title': _title,
        'date': _date,
        'rating': _rating,
        'tag': _tag,
        'img': _img,
        'descr': _descr,
        'tickets': _tickets,
        'dayleft': _dayleft,
        'ticketStatus': _ticketStatus,
        'created_at': _createdAt,
        'startHour': _startHour,
        'minPrice': _minPrice,
        'maxPrice': _maxPrice,
        'avgPrice': _avgPrice,
        'isFavorite': _isFavorite,
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'location': serializeParam(
          _location,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.double,
        ),
        'tag': serializeParam(
          _tag,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'descr': serializeParam(
          _descr,
          ParamType.String,
        ),
        'tickets': serializeParam(
          _tickets,
          ParamType.int,
        ),
        'dayleft': serializeParam(
          _dayleft,
          ParamType.int,
        ),
        'ticketStatus': serializeParam(
          _ticketStatus,
          ParamType.String,
        ),
        'created_at': serializeParam(
          _createdAt,
          ParamType.DateTime,
        ),
        'startHour': serializeParam(
          _startHour,
          ParamType.int,
        ),
        'minPrice': serializeParam(
          _minPrice,
          ParamType.double,
        ),
        'maxPrice': serializeParam(
          _maxPrice,
          ParamType.double,
        ),
        'avgPrice': serializeParam(
          _avgPrice,
          ParamType.double,
        ),
        'isFavorite': serializeParam(
          _isFavorite,
          ParamType.bool,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static EventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventsStruct(
        location: deserializeParam(
          data['location'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.double,
          false,
        ),
        tag: deserializeParam(
          data['tag'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        descr: deserializeParam(
          data['descr'],
          ParamType.String,
          false,
        ),
        tickets: deserializeParam(
          data['tickets'],
          ParamType.int,
          false,
        ),
        dayleft: deserializeParam(
          data['dayleft'],
          ParamType.int,
          false,
        ),
        ticketStatus: deserializeParam(
          data['ticketStatus'],
          ParamType.String,
          false,
        ),
        createdAt: deserializeParam(
          data['created_at'],
          ParamType.DateTime,
          false,
        ),
        startHour: deserializeParam(
          data['startHour'],
          ParamType.int,
          false,
        ),
        minPrice: deserializeParam(
          data['minPrice'],
          ParamType.double,
          false,
        ),
        maxPrice: deserializeParam(
          data['maxPrice'],
          ParamType.double,
          false,
        ),
        avgPrice: deserializeParam(
          data['avgPrice'],
          ParamType.double,
          false,
        ),
        isFavorite: deserializeParam(
          data['isFavorite'],
          ParamType.bool,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'EventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventsStruct &&
        location == other.location &&
        title == other.title &&
        date == other.date &&
        rating == other.rating &&
        tag == other.tag &&
        img == other.img &&
        descr == other.descr &&
        tickets == other.tickets &&
        dayleft == other.dayleft &&
        ticketStatus == other.ticketStatus &&
        createdAt == other.createdAt &&
        startHour == other.startHour &&
        minPrice == other.minPrice &&
        maxPrice == other.maxPrice &&
        avgPrice == other.avgPrice &&
        isFavorite == other.isFavorite &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([
        location,
        title,
        date,
        rating,
        tag,
        img,
        descr,
        tickets,
        dayleft,
        ticketStatus,
        createdAt,
        startHour,
        minPrice,
        maxPrice,
        avgPrice,
        isFavorite,
        id
      ]);
}

EventsStruct createEventsStruct({
  String? location,
  String? title,
  DateTime? date,
  double? rating,
  String? tag,
  String? img,
  String? descr,
  int? tickets,
  int? dayleft,
  String? ticketStatus,
  DateTime? createdAt,
  int? startHour,
  double? minPrice,
  double? maxPrice,
  double? avgPrice,
  bool? isFavorite,
  String? id,
}) =>
    EventsStruct(
      location: location,
      title: title,
      date: date,
      rating: rating,
      tag: tag,
      img: img,
      descr: descr,
      tickets: tickets,
      dayleft: dayleft,
      ticketStatus: ticketStatus,
      createdAt: createdAt,
      startHour: startHour,
      minPrice: minPrice,
      maxPrice: maxPrice,
      avgPrice: avgPrice,
      isFavorite: isFavorite,
      id: id,
    );
