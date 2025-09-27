import '../database.dart';

class VDtCollectionsTable extends SupabaseTable<VDtCollectionsRow> {
  @override
  String get tableName => 'v_dt_collections';

  @override
  VDtCollectionsRow createRow(Map<String, dynamic> data) =>
      VDtCollectionsRow(data);
}

class VDtCollectionsRow extends SupabaseDataRow {
  VDtCollectionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VDtCollectionsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get descr => getField<String>('descr');
  set descr(String? value) => setField<String>('descr', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  int? get eventCount => getField<int>('event_count');
  set eventCount(int? value) => setField<int>('event_count', value);

  bool? get isActive => getField<bool>('is_active');
  set isActive(bool? value) => setField<bool>('is_active', value);

  String? get createdBy => getField<String>('created_by');
  set createdBy(String? value) => setField<String>('created_by', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
