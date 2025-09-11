import '../database.dart';

class UsersTable extends SupabaseTable<UsersRow> {
  @override
  String get tableName => 'users';

  @override
  UsersRow createRow(Map<String, dynamic> data) => UsersRow(data);
}

class UsersRow extends SupabaseDataRow {
  UsersRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UsersTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String get email => getField<String>('email')!;
  set email(String value) => setField<String>('email', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  String? get phone => getField<String>('phone');
  set phone(String? value) => setField<String>('phone', value);

  String? get googleId => getField<String>('google_id');
  set googleId(String? value) => setField<String>('google_id', value);

  String? get authProvider => getField<String>('auth_provider');
  set authProvider(String? value) => setField<String>('auth_provider', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);

  String? get avatarUrl => getField<String>('avatar_url');
  set avatarUrl(String? value) => setField<String>('avatar_url', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  DateTime? get birthday => getField<DateTime>('birthday');
  set birthday(DateTime? value) => setField<DateTime>('birthday', value);

  String? get gender => getField<String>('gender');
  set gender(String? value) => setField<String>('gender', value);

  String? get location => getField<String>('location');
  set location(String? value) => setField<String>('location', value);

  String? get bio => getField<String>('bio');
  set bio(String? value) => setField<String>('bio', value);

  dynamic? get preferences => getField<dynamic>('preferences');
  set preferences(dynamic? value) => setField<dynamic>('preferences', value);

  String? get language => getField<String>('language');
  set language(String? value) => setField<String>('language', value);
}
