import '../database.dart';

class VOrganizatorsTable extends SupabaseTable<VOrganizatorsRow> {
  @override
  String get tableName => 'v_organizators';

  @override
  VOrganizatorsRow createRow(Map<String, dynamic> data) =>
      VOrganizatorsRow(data);
}

class VOrganizatorsRow extends SupabaseDataRow {
  VOrganizatorsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VOrganizatorsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get img => getField<String>('img');
  set img(String? value) => setField<String>('img', value);

  String? get followers => getField<String>('followers');
  set followers(String? value) => setField<String>('followers', value);

  int? get followerCount => getField<int>('follower_count');
  set followerCount(int? value) => setField<int>('follower_count', value);

  String? get organizerDescription => getField<String>('organizer_description');
  set organizerDescription(String? value) =>
      setField<String>('organizer_description', value);

  String? get email => getField<String>('email');
  set email(String? value) => setField<String>('email', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get updatedAt => getField<DateTime>('updated_at');
  set updatedAt(DateTime? value) => setField<DateTime>('updated_at', value);
}
