import '../database.dart';

class VRegistrationDetailsTable extends SupabaseTable<VRegistrationDetailsRow> {
  @override
  String get tableName => 'v_registration_details';

  @override
  VRegistrationDetailsRow createRow(Map<String, dynamic> data) =>
      VRegistrationDetailsRow(data);
}

class VRegistrationDetailsRow extends SupabaseDataRow {
  VRegistrationDetailsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VRegistrationDetailsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get status => getField<String>('status');
  set status(String? value) => setField<String>('status', value);

  String? get paymentStatus => getField<String>('payment_status');
  set paymentStatus(String? value) => setField<String>('payment_status', value);

  double? get totalAmount => getField<double>('total_amount');
  set totalAmount(double? value) => setField<double>('total_amount', value);

  double? get discountAmount => getField<double>('discount_amount');
  set discountAmount(double? value) =>
      setField<double>('discount_amount', value);

  double? get finalAmount => getField<double>('final_amount');
  set finalAmount(double? value) => setField<double>('final_amount', value);

  String? get qrCode => getField<String>('qr_code');
  set qrCode(String? value) => setField<String>('qr_code', value);

  dynamic? get ticketSelections => getField<dynamic>('ticket_selections');
  set ticketSelections(dynamic? value) =>
      setField<dynamic>('ticket_selections', value);

  dynamic? get customFieldValues => getField<dynamic>('custom_field_values');
  set customFieldValues(dynamic? value) =>
      setField<dynamic>('custom_field_values', value);

  DateTime? get checkedInAt => getField<DateTime>('checked_in_at');
  set checkedInAt(DateTime? value) =>
      setField<DateTime>('checked_in_at', value);

  String? get confirmationCode => getField<String>('confirmation_code');
  set confirmationCode(String? value) =>
      setField<String>('confirmation_code', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get userName => getField<String>('user_name');
  set userName(String? value) => setField<String>('user_name', value);

  String? get userEmail => getField<String>('user_email');
  set userEmail(String? value) => setField<String>('user_email', value);

  String? get eventTitle => getField<String>('event_title');
  set eventTitle(String? value) => setField<String>('event_title', value);

  DateTime? get eventDate => getField<DateTime>('event_date');
  set eventDate(DateTime? value) => setField<DateTime>('event_date', value);

  String? get eventLocation => getField<String>('event_location');
  set eventLocation(String? value) => setField<String>('event_location', value);

  dynamic? get ticketDetails => getField<dynamic>('ticket_details');
  set ticketDetails(dynamic? value) =>
      setField<dynamic>('ticket_details', value);

  int? get totalTicketTypes => getField<int>('total_ticket_types');
  set totalTicketTypes(int? value) =>
      setField<int>('total_ticket_types', value);

  int? get totalTickets => getField<int>('total_tickets');
  set totalTickets(int? value) => setField<int>('total_tickets', value);
}
