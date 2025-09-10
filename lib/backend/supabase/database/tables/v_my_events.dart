import '../database.dart';

class VMyEventsTable extends SupabaseTable<VMyEventsRow> {
  @override
  String get tableName => 'v_my_events';

  @override
  VMyEventsRow createRow(Map<String, dynamic> data) => VMyEventsRow(data);
}

class VMyEventsRow extends SupabaseDataRow {
  VMyEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VMyEventsTable();

  String? get registrationId => getField<String>('registration_id');
  set registrationId(String? value) =>
      setField<String>('registration_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  DateTime? get registeredAt => getField<DateTime>('registered_at');
  set registeredAt(DateTime? value) =>
      setField<DateTime>('registered_at', value);

  String? get registrationStatus => getField<String>('registration_status');
  set registrationStatus(String? value) =>
      setField<String>('registration_status', value);

  String? get confirmationCode => getField<String>('confirmation_code');
  set confirmationCode(String? value) =>
      setField<String>('confirmation_code', value);

  DateTime? get checkedInAt => getField<DateTime>('checked_in_at');
  set checkedInAt(DateTime? value) =>
      setField<DateTime>('checked_in_at', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  DateTime? get endDate => getField<DateTime>('end_date');
  set endDate(DateTime? value) => setField<DateTime>('end_date', value);

  String? get eventStatus => getField<String>('event_status');
  set eventStatus(String? value) => setField<String>('event_status', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

  String? get venueName => getField<String>('venue_name');
  set venueName(String? value) => setField<String>('venue_name', value);

  String? get venueAddress => getField<String>('venue_address');
  set venueAddress(String? value) => setField<String>('venue_address', value);

  String? get city => getField<String>('city');
  set city(String? value) => setField<String>('city', value);

  String? get categoryName => getField<String>('category_name');
  set categoryName(String? value) => setField<String>('category_name', value);

  String? get categoryIcon => getField<String>('category_icon');
  set categoryIcon(String? value) => setField<String>('category_icon', value);

  String? get paymentId => getField<String>('payment_id');
  set paymentId(String? value) => setField<String>('payment_id', value);

  double? get paymentAmount => getField<double>('payment_amount');
  set paymentAmount(double? value) => setField<double>('payment_amount', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  dynamic get tickets => getField<dynamic>('tickets');
  set tickets(dynamic value) => setField<dynamic>('tickets', value);

  String? get eventTiming => getField<String>('event_timing');
  set eventTiming(String? value) => setField<String>('event_timing', value);

  String? get attendanceStatus => getField<String>('attendance_status');
  set attendanceStatus(String? value) =>
      setField<String>('attendance_status', value);
}
