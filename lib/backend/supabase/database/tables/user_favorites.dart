import '../database.dart';

class UserFavoritesTable extends SupabaseTable<UserFavoritesRow> {
  @override
  String get tableName => 'user_favorites';

  @override
  UserFavoritesRow createRow(Map<String, dynamic> data) =>
      UserFavoritesRow(data);
}

class UserFavoritesRow extends SupabaseDataRow {
  UserFavoritesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFavoritesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get eventId => getField<String>('event_id')!;
  set eventId(String value) => setField<String>('event_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
