import '../database.dart';

class VEventTicketingSummaryTable
    extends SupabaseTable<VEventTicketingSummaryRow> {
  @override
  String get tableName => 'v_event_ticketing_summary';

  @override
  VEventTicketingSummaryRow createRow(Map<String, dynamic> data) =>
      VEventTicketingSummaryRow(data);
}

class VEventTicketingSummaryRow extends SupabaseDataRow {
  VEventTicketingSummaryRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VEventTicketingSummaryTable();

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  DateTime? get startDate => getField<DateTime>('start_date');
  set startDate(DateTime? value) => setField<DateTime>('start_date', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  int? get maxAttendees => getField<int>('max_attendees');
  set maxAttendees(int? value) => setField<int>('max_attendees', value);

  int? get currentAttendees => getField<int>('current_attendees');
  set currentAttendees(int? value) => setField<int>('current_attendees', value);

  int? get totalTicketTypes => getField<int>('total_ticket_types');
  set totalTicketTypes(int? value) =>
      setField<int>('total_ticket_types', value);

  int? get totalCapacity => getField<int>('total_capacity');
  set totalCapacity(int? value) => setField<int>('total_capacity', value);

  int? get totalSold => getField<int>('total_sold');
  set totalSold(int? value) => setField<int>('total_sold', value);

  int? get totalAvailable => getField<int>('total_available');
  set totalAvailable(int? value) => setField<int>('total_available', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);

  int? get totalSeatingZones => getField<int>('total_seating_zones');
  set totalSeatingZones(int? value) =>
      setField<int>('total_seating_zones', value);

  int? get totalRegistrations => getField<int>('total_registrations');
  set totalRegistrations(int? value) =>
      setField<int>('total_registrations', value);

  double? get overallOccupancyRate =>
      getField<double>('overall_occupancy_rate');
  set overallOccupancyRate(double? value) =>
      setField<double>('overall_occupancy_rate', value);
}
