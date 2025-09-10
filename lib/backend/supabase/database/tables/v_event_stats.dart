import '../database.dart';

class VEventStatsTable extends SupabaseTable<VEventStatsRow> {
  @override
  String get tableName => 'v_event_stats';

  @override
  VEventStatsRow createRow(Map<String, dynamic> data) => VEventStatsRow(data);
}

class VEventStatsRow extends SupabaseDataRow {
  VEventStatsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventStatsTable();

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get organizerId => getField<String>('organizer_id');
  set organizerId(String? value) => setField<String>('organizer_id', value);

  int? get totalRegistrations => getField<int>('total_registrations');
  set totalRegistrations(int? value) =>
      setField<int>('total_registrations', value);

  int? get confirmedRegistrations => getField<int>('confirmed_registrations');
  set confirmedRegistrations(int? value) =>
      setField<int>('confirmed_registrations', value);

  int? get checkedInCount => getField<int>('checked_in_count');
  set checkedInCount(int? value) => setField<int>('checked_in_count', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);

  double? get confirmedRevenue => getField<double>('confirmed_revenue');
  set confirmedRevenue(double? value) =>
      setField<double>('confirmed_revenue', value);

  double? get averageTicketPrice => getField<double>('average_ticket_price');
  set averageTicketPrice(double? value) =>
      setField<double>('average_ticket_price', value);

  dynamic? get ticketBreakdown => getField<dynamic>('ticket_breakdown');
  set ticketBreakdown(dynamic? value) =>
      setField<dynamic>('ticket_breakdown', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  int? get availableSeats => getField<int>('available_seats');
  set availableSeats(int? value) => setField<int>('available_seats', value);

  double? get occupancyRate => getField<double>('occupancy_rate');
  set occupancyRate(double? value) => setField<double>('occupancy_rate', value);
}
