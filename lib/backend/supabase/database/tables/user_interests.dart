import '../database.dart';

class UserInterestsTable extends SupabaseTable<UserInterestsRow> {
  @override
  String get tableName => 'user_interests';

  @override
  UserInterestsRow createRow(Map<String, dynamic> data) =>
      UserInterestsRow(data);
}

class UserInterestsRow extends SupabaseDataRow {
  UserInterestsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserInterestsTable();

  String get userId => getField<String>('user_id')!;
  set userId(String value) => setField<String>('user_id', value);

  String get interestKey => getField<String>('interest_key')!;
  set interestKey(String value) => setField<String>('interest_key', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
