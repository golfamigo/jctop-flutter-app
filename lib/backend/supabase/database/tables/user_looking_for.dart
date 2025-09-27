import '../database.dart';

class UserLookingForTable extends SupabaseTable<UserLookingForRow> {
  @override
  String get tableName => 'user_looking_for';

  @override
  UserLookingForRow createRow(Map<String, dynamic> data) =>
      UserLookingForRow(data);
}

class UserLookingForRow extends SupabaseDataRow {
  UserLookingForRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserLookingForTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get lookingForKey => getField<String>('looking_for_key')!;
  set lookingForKey(String value) => setField<String>('looking_for_key', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
