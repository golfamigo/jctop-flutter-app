import '../database.dart';

class UserActivitiesTable extends SupabaseTable<UserActivitiesRow> {
  @override
  String get tableName => 'user_activities';

  @override
  UserActivitiesRow createRow(Map<String, dynamic> data) =>
      UserActivitiesRow(data);
}

class UserActivitiesRow extends SupabaseDataRow {
  UserActivitiesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => UserActivitiesTable();

  String get id => getField<String>('id')!;
  set id(String value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String get activityType => getField<String>('activity_type')!;
  set activityType(String value) => setField<String>('activity_type', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  dynamic? get metadata => getField<dynamic>('metadata');
  set metadata(dynamic? value) => setField<dynamic>('metadata', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);
}
