import '../database.dart';

class VNotificationsTable extends SupabaseTable<VNotificationsRow> {
  @override
  String get tableName => 'v_notifications';

  @override
  VNotificationsRow createRow(Map<String, dynamic> data) =>
      VNotificationsRow(data);
}

class VNotificationsRow extends SupabaseDataRow {
  VNotificationsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VNotificationsTable();

  String? get id => getField<String>('id');
  set id(String? value) => setField<String>('id', value);

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get type => getField<String>('type');
  set type(String? value) => setField<String>('type', value);

  String? get title => getField<String>('title');
  set title(String? value) => setField<String>('title', value);

  String? get message => getField<String>('message');
  set message(String? value) => setField<String>('message', value);

  bool? get isRead => getField<bool>('is_read');
  set isRead(bool? value) => setField<bool>('is_read', value);

  DateTime? get createdAt => getField<DateTime>('created_at');
  set createdAt(DateTime? value) => setField<DateTime>('created_at', value);

  DateTime? get readAt => getField<DateTime>('read_at');
  set readAt(DateTime? value) => setField<DateTime>('read_at', value);

  String? get actionUrl => getField<String>('action_url');
  set actionUrl(String? value) => setField<String>('action_url', value);

  dynamic get metadata => getField<dynamic>('metadata');
  set metadata(dynamic value) => setField<dynamic>('metadata', value);

  String? get eventId => getField<String>('event_id');
  set eventId(String? value) => setField<String>('event_id', value);

  String? get eventTitle => getField<String>('event_title');
  set eventTitle(String? value) => setField<String>('event_title', value);

  DateTime? get eventDate => getField<DateTime>('event_date');
  set eventDate(DateTime? value) => setField<DateTime>('event_date', value);

  String? get eventImage => getField<String>('event_image');
  set eventImage(String? value) => setField<String>('event_image', value);

  String? get relatedUserName => getField<String>('related_user_name');
  set relatedUserName(String? value) =>
      setField<String>('related_user_name', value);

  String? get timeDisplay => getField<String>('time_display');
  set timeDisplay(String? value) => setField<String>('time_display', value);
}
