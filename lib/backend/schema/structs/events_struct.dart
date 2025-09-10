// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EventsStruct extends BaseStruct {
  EventsStruct({
    String? location,
    String? title,
    String? date,
    String? price,
    String? rating,
    String? tag,
    String? img,
    String? descr,
  })  : _location = location,
        _title = title,
        _date = date,
        _price = price,
        _rating = rating,
        _tag = tag,
        _img = img,
        _descr = descr;

  // "Location" field.
  String? _location;
  String get location => _location ?? '';
  set location(String? val) => _location = val;

  bool hasLocation() => _location != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "Date" field.
  String? _date;
  String get date => _date ?? '';
  set date(String? val) => _date = val;

  bool hasDate() => _date != null;

  // "Price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;

  bool hasPrice() => _price != null;

  // "Rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  set rating(String? val) => _rating = val;

  bool hasRating() => _rating != null;

  // "Tag" field.
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

  static EventsStruct fromMap(Map<String, dynamic> data) => EventsStruct(
        location: data['Location'] as String?,
        title: data['Title'] as String?,
        date: data['Date'] as String?,
        price: data['Price'] as String?,
        rating: data['Rating'] as String?,
        tag: data['Tag'] as String?,
        img: data['img'] as String?,
        descr: data['descr'] as String?,
      );

  static EventsStruct? maybeFromMap(dynamic data) =>
      data is Map ? EventsStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'Location': _location,
        'Title': _title,
        'Date': _date,
        'Price': _price,
        'Rating': _rating,
        'Tag': _tag,
        'img': _img,
        'descr': _descr,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'Location': serializeParam(
          _location,
          ParamType.String,
        ),
        'Title': serializeParam(
          _title,
          ParamType.String,
        ),
        'Date': serializeParam(
          _date,
          ParamType.String,
        ),
        'Price': serializeParam(
          _price,
          ParamType.String,
        ),
        'Rating': serializeParam(
          _rating,
          ParamType.String,
        ),
        'Tag': serializeParam(
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
      }.withoutNulls;

  static EventsStruct fromSerializableMap(Map<String, dynamic> data) =>
      EventsStruct(
        location: deserializeParam(
          data['Location'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['Title'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['Date'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['Price'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['Rating'],
          ParamType.String,
          false,
        ),
        tag: deserializeParam(
          data['Tag'],
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
      );

  @override
  String toString() => 'EventsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EventsStruct &&
        location == other.location &&
        title == other.title &&
        date == other.date &&
        price == other.price &&
        rating == other.rating &&
        tag == other.tag &&
        img == other.img &&
        descr == other.descr;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([location, title, date, price, rating, tag, img, descr]);
}

EventsStruct createEventsStruct({
  String? location,
  String? title,
  String? date,
  String? price,
  String? rating,
  String? tag,
  String? img,
  String? descr,
}) =>
    EventsStruct(
      location: location,
      title: title,
      date: date,
      price: price,
      rating: rating,
      tag: tag,
      img: img,
      descr: descr,
    );
