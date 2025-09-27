import '../database.dart';

class CollectionsTable extends SupabaseTable<CollectionsRow> {
  @override
  String get tableName => 'collections';

  @override
  CollectionsRow createRow(Map<String, dynamic> data) => CollectionsRow(data);
}

class CollectionsRow extends SupabaseDataRow {
  CollectionsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CollectionsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get title => getField<String>('title')!;
  set title(String value) => setField<String>('title', value);

  String? get description => getField<String>('description');
  set description(String? value) => setField<String>('description', value);

  String? get imageUrl => getField<String>('image_url');
  set imageUrl(String? value) => setField<String>('image_url', value);

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
