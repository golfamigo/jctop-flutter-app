import '../database.dart';

class VEventsFullTable extends SupabaseTable<VEventsFullRow> {
  @override
  String get tableName => 'v_events_full';

  @override
  VEventsFullRow createRow(Map<String, dynamic> data) => VEventsFullRow(data);
}

class VEventsFullRow extends SupabaseDataRow {
  VEventsFullRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventsFullTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get organizerId => getField<String>('organizer_id');
  set organizerId(String? value) => setField<String>('organizer_id', value);

  String? get categoryId => getField<String>('category_id');
  set categoryId(String? value) => setField<String>('category_id', value);

  String? get venueId => getField<String>('venue_id');
  set venueId(String? value) => setField<String>('venue_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get bannerUrl => getField<String>('banner_url');
  set bannerUrl(String? value) => setField<String>('banner_url', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  int? get currentAttendees => getField<int>('current_attendees');
  set currentAttendees(int? value) => setField<int>('current_attendees', value);

  List<String> get tags => getListField<String>('tags');
  set tags(List<String>? value) => setListField<String>('tags', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  double? get averageRating => getField<double>('average_rating');
  set averageRating(double? value) => setField<double>('average_rating', value);

  double? get rating => getField<double>('rating');
  set rating(double? value) => setField<double>('rating', value);

  int? get tickets => getField<int>('tickets');
  set tickets(int? value) => setField<int>('tickets', value);

  int? get dayLeft => getField<int>('day_left');
  set dayLeft(int? value) => setField<int>('day_left', value);

  String? get ticketStatus => getField<String>('ticket_status');
  set ticketStatus(String? value) => setField<String>('ticket_status', value);

  int? get totalTickets => getField<int>('total_tickets');
  set totalTickets(int? value) => setField<int>('total_tickets', value);

  int? get ticketsSold => getField<int>('tickets_sold');
  set ticketsSold(int? value) => setField<int>('tickets_sold', value);

  int? get ticketsAvailable => getField<int>('tickets_available');
  set ticketsAvailable(int? value) => setField<int>('tickets_available', value);

  double? get minTicketPrice => getField<double>('min_ticket_price');
  set minTicketPrice(double? value) =>
      setField<double>('min_ticket_price', value);

  double? get maxTicketPrice => getField<double>('max_ticket_price');
  set maxTicketPrice(double? value) =>
      setField<double>('max_ticket_price', value);

  int? get commentCount => getField<int>('comment_count');
  set commentCount(int? value) => setField<int>('comment_count', value);
}
