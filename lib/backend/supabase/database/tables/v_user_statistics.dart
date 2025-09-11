import '../database.dart';

class VUserStatisticsTable extends SupabaseTable<VUserStatisticsRow> {
  @override
  String get tableName => 'v_user_statistics';

  @override
  VUserStatisticsRow createRow(Map<String, dynamic> data) =>
      VUserStatisticsRow(data);
}

class VUserStatisticsRow extends SupabaseDataRow {
  VUserStatisticsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => VUserStatisticsTable();

  String? get userId => getField<String>('user_id');
  set userId(String? value) => setField<String>('user_id', value);

  String? get displayName => getField<String>('display_name');
  set displayName(String? value) => setField<String>('display_name', value);

  int? get eventsRegistered => getField<int>('events_registered');
  set eventsRegistered(int? value) => setField<int>('events_registered', value);

  int? get eventsFavorited => getField<int>('events_favorited');
  set eventsFavorited(int? value) => setField<int>('events_favorited', value);

  int? get eventsAttended => getField<int>('events_attended');
  set eventsAttended(int? value) => setField<int>('events_attended', value);
}
