import '../database.dart';

class UserFollowsTable extends SupabaseTable<UserFollowsRow> {
  @override
  String get tableName => 'user_follows';

  @override
  UserFollowsRow createRow(Map<String, dynamic> data) => UserFollowsRow(data);
}

class UserFollowsRow extends SupabaseDataRow {
  UserFollowsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserFollowsTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get followerId => getField<String>('follower_id');
  set followerId(String? value) => setField<String>('follower_id', value);

  String? get followingId => getField<String>('following_id');
  set followingId(String? value) => setField<String>('following_id', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
