import '../database.dart';

class VUserRolesTable extends SupabaseTable<VUserRolesRow> {
  @override
  String get tableName => 'v_user_roles';

  @override
  VUserRolesRow createRow(Map<String, dynamic> data) => VUserRolesRow(data);
}

class VUserRolesRow extends SupabaseDataRow {
  VUserRolesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VUserRolesTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  String? get fullName => getField<String>('full_name');
  set fullName(String? value) => setField<String>('full_name', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  bool? get isOrganizer => getField<bool>('is_organizer');
  set isOrganizer(bool? value) => setField<bool>('is_organizer', value);

  bool? get isAttendee => getField<bool>('is_attendee');
  set isAttendee(bool? value) => setField<bool>('is_attendee', value);

  int? get eventsOrganized => getField<int>('events_organized');
  set eventsOrganized(int? value) => setField<int>('events_organized', value);

  int? get eventsAttended => getField<int>('events_attended');
  set eventsAttended(int? value) => setField<int>('events_attended', value);

  String? get userType => getField<String>('user_type');
  set userType(String? value) => setField<String>('user_type', value);

  double? get totalSpent => getField<double>('total_spent');
  set totalSpent(double? value) => setField<double>('total_spent', value);

  double? get totalRevenue => getField<double>('total_revenue');
  set totalRevenue(double? value) => setField<double>('total_revenue', value);
}
