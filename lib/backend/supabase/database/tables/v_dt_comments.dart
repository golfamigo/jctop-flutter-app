import '../database.dart';

class VDtCommentsTable extends SupabaseTable<VDtCommentsRow> {
  @override
  String get tableName => 'v_dt_comments';

  @override
  VDtCommentsRow createRow(Map<String, dynamic> data) => VDtCommentsRow(data);
}

class VDtCommentsRow extends SupabaseDataRow {
  VDtCommentsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtCommentsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get name => getField<String>('name');
  set name(String? value) => setField<String>('name', value);

  DateTime? get date => getField<DateTime>('date');
  set date(DateTime? value) => setField<DateTime>('date', value);

  String? get comment => getField<String>('comment');
  set comment(String? value) => setField<String>('comment', value);

  int? get rating => getField<int>('rating');
  set rating(int? value) => setField<int>('rating', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);
}
