import '../database.dart';

class VDtOrganizatorsTable extends SupabaseTable<VDtOrganizatorsRow> {
  @override
  String get tableName => 'v_dt_organizators';

  @override
  VDtOrganizatorsRow createRow(Map<String, dynamic> data) =>
      VDtOrganizatorsRow(data);
}

class VDtOrganizatorsRow extends SupabaseDataRow {
  VDtOrganizatorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtOrganizatorsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get followers => getField<String>('followers');
  set followers(String? value) => setField<String>('followers', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  bool? get isOrganizer => getField<bool>('is_organizer');
  set isOrganizer(bool? value) => setField<bool>('is_organizer', value);

  String? get organizerDescription => getField<String>('organizer_description');
  set organizerDescription(String? value) =>
      setField<String>('organizer_description', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
