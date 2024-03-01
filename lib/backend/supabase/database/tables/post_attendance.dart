import '../database.dart';

class PostAttendanceTable extends SupabaseTable<PostAttendanceRow> {
  @override
  String get tableName => 'post_attendance';

  @override
  PostAttendanceRow createRow(Map<String, dynamic> data) =>
      PostAttendanceRow(data);
}

class PostAttendanceRow extends SupabaseDataRow {
  PostAttendanceRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PostAttendanceTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);

  String get photoUrl => getField<String>('photo_url')!;
  set photoUrl(String value) => setField<String>('photo_url', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  String get location => getField<String>('location')!;
  set location(String value) => setField<String>('location', value);

  String get postedBy => getField<String>('posted_by')!;
  set postedBy(String value) => setField<String>('posted_by', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  List<String> get laborers => getListField<String>('laborers')!;
  set laborers(List<String> value) => setListField<String>('laborers', value);

  String get date => getField<String>('date')!;
  set date(String value) => setField<String>('date', value);
}
