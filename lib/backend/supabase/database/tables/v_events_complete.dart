import '../database.dart';

class VEventsCompleteTable extends SupabaseTable<VEventsCompleteRow> {
  @override
  String get tableName => 'v_events_complete';

  @override
  VEventsCompleteRow createRow(Map<String, dynamic> data) =>
      VEventsCompleteRow(data);
}

class VEventsCompleteRow extends SupabaseDataRow {
  VEventsCompleteRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventsCompleteTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get descr => getField<String>('descr');
  set descr(String? value) => setField<String>('descr', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get tag => getField<String>('tag');
  set tag(String? value) => setField<String>('tag', value);

  String? get price => getField<String>('price');
  set price(String? value) => setField<String>('price', value);

  String? get rating => getField<String>('rating');
  set rating(String? value) => setField<String>('rating', value);

  String? get tickets => getField<String>('tickets');
  set tickets(String? value) => setField<String>('tickets', value);

  String? get dayLeft => getField<String>('dayLeft');
  set dayLeft(String? value) => setField<String>('dayLeft', value);

  String? get ticketStatus => getField<String>('ticketStatus');
  set ticketStatus(String? value) => setField<String>('ticketStatus', value);

  String? get organizerId => getField<String>('organizer_id');
  set organizerId(String? value) => setField<String>('organizer_id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get venueId => getField<String>('venue_id');
  set venueId(String? value) => setField<String>('venue_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  int? get currentAttendees => getField<int>('current_attendees');
  set currentAttendees(int? value) => setField<int>('current_attendees', value);

  double? get minTicketPrice => getField<double>('min_ticket_price');
  set minTicketPrice(double? value) =>
      setField<double>('min_ticket_price', value);

  double? get maxTicketPrice => getField<double>('max_ticket_price');
  set maxTicketPrice(double? value) =>
      setField<double>('max_ticket_price', value);

  int? get ticketsAvailable => getField<int>('tickets_available');
  set ticketsAvailable(int? value) => setField<int>('tickets_available', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
