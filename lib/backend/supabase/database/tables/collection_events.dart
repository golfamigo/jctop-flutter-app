import '../database.dart';

class CollectionEventsTable extends SupabaseTable<CollectionEventsRow> {
  @override
  String get tableName => 'collection_events';

  @override
  CollectionEventsRow createRow(Map<String, dynamic> data) =>
      CollectionEventsRow(data);
}

class CollectionEventsRow extends SupabaseDataRow {
  CollectionEventsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => CollectionEventsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get collectionId => getField<String>('collection_id');
  set collectionId(String? value) => setField<String>('collection_id', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  int? get displayOrder => getField<int>('display_order');
  set displayOrder(int? value) => setField<int>('display_order', value);

  DateTime? get addedAt => getField<DateTime>('added_at');
  set addedAt(DateTime? value) => setField<DateTime>('added_at', value);
}
