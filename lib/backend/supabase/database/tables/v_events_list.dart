import '../database.dart';

class VEventsListTable extends SupabaseTable<VEventsListRow> {
  @override
  String get tableName => 'v_events_list';

  @override
  VEventsListRow createRow(Map<String, dynamic> data) => VEventsListRow(data);
}

class VEventsListRow extends SupabaseDataRow {
  VEventsListRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventsListTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  bool? get isFeatured => getField<bool>('is_featured');
  set isFeatured(bool? value) => setField<bool>('is_featured', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get venueName => getField<String>('venue_name');
  set venueName(String? value) => setField<String>('venue_name', value);

  String? get venueAddress => getField<String>('venue_address');
  set venueAddress(String? value) => setField<String>('venue_address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  int? get venueCapacity => getField<int>('venue_capacity');
  set venueCapacity(int? value) => setField<int>('venue_capacity', value);

  String? get organizerName => getField<String>('organizer_name');
  set organizerName(String? value) => setField<String>('organizer_name', value);

  String? get organizerEmail => getField<String>('organizer_email');
  set organizerEmail(String? value) =>
      setField<String>('organizer_email', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get categoryIcon => getField<String>('category_icon');
  set categoryIcon(String? value) => setField<String>('category_icon', value);

  String? get categoryColor => getField<String>('category_color');
  set categoryColor(String? value) => setField<String>('category_color', value);

  double? get minPrice => getField<double>('min_price');
  set minPrice(double? value) => setField<double>('min_price', value);

  double? get maxPrice => getField<double>('max_price');
  set maxPrice(double? value) => setField<double>('max_price', value);

  int? get attendeeCount => getField<int>('attendee_count');
  set attendeeCount(int? value) => setField<int>('attendee_count', value);

  int? get availableSeats => getField<int>('available_seats');
  set availableSeats(int? value) => setField<int>('available_seats', value);

  bool? get isFull => getField<bool>('is_full');
  set isFull(bool? value) => setField<bool>('is_full', value);

  String? get priceRangeDisplay => getField<String>('price_range_display');
  set priceRangeDisplay(String? value) =>
      setField<String>('price_range_display', value);
}
