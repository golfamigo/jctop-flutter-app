import '../database.dart';

class VTicketTypesDetailTable extends SupabaseTable<VTicketTypesDetailRow> {
  @override
  String get tableName => 'v_ticket_types_detail';

  @override
  VTicketTypesDetailRow createRow(Map<String, dynamic> data) =>
      VTicketTypesDetailRow(data);
}

class VTicketTypesDetailRow extends SupabaseDataRow {
  VTicketTypesDetailRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VTicketTypesDetailTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  double? get price => getField<double>('price');
  set price(double? value) => setField<double>('price', value);

  int? get quantity => getField<int>('quantity');
  set quantity(int? value) => setField<int>('quantity', value);

  int? get soldCount => getField<int>('sold_count');
  set soldCount(int? value) => setField<int>('sold_count', value);

  String? get color => getField<String>('color');
  set color(String? value) => setField<String>('color', value);

  String? get icon => getField<String>('icon');
  set icon(String? value) => setField<String>('icon', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  int? get maxPerUser => getField<int>('max_per_user');
  set maxPerUser(int? value) => setField<int>('max_per_user', value);

  String? get seatingZoneId => getField<String>('seating_zone_id');
  set seatingZoneId(String? value) =>
      setField<String>('seating_zone_id', value);

  bool? get requiresSeatSelection => getField<bool>('requires_seat_selection');
  set requiresSeatSelection(bool? value) =>
      setField<bool>('requires_seat_selection', value);

  String? get eventTitle => getField<String>('event_title');
  set eventTitle(String? value) => setField<String>('event_title', value);

  DateTime? get eventDate => getField<DateTime>('event_date');
  set eventDate(DateTime? value) => setField<DateTime>('event_date', value);

  String? get eventStatus => getField<String>('event_status');
  set eventStatus(String? value) => setField<String>('event_status', value);

  String? get seatingZoneName => getField<String>('seating_zone_name');
  set seatingZoneName(String? value) =>
      setField<String>('seating_zone_name', value);

  int? get zoneCapacity => getField<int>('zone_capacity');
  set zoneCapacity(int? value) => setField<int>('zone_capacity', value);

  double? get zonePriceModifier => getField<double>('zone_price_modifier');
  set zonePriceModifier(double? value) =>
      setField<double>('zone_price_modifier', value);

  int? get availableQuantity => getField<int>('available_quantity');
  set availableQuantity(int? value) =>
      setField<int>('available_quantity', value);

  double? get soldPercentage => getField<double>('sold_percentage');
  set soldPercentage(double? value) =>
      setField<double>('sold_percentage', value);
}
