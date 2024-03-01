import '../database.dart';

class PunchlistTable extends SupabaseTable<PunchlistRow> {
  @override
  String get tableName => 'punchlist';

  @override
  PunchlistRow createRow(Map<String, dynamic> data) => PunchlistRow(data);
}

class PunchlistRow extends SupabaseDataRow {
  PunchlistRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PunchlistTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  List<String> get photoUrl => getListField<String>('photo_url')!;
  set photoUrl(List<String> value) => setListField<String>('photo_url', value);

  String get postedBy => getField<String>('posted_by')!;
  set postedBy(String value) => setField<String>('posted_by', value);

  String? get notes => getField<String>('notes');
  set notes(String? value) => setField<String>('notes', value);

  String get date => getField<String>('date')!;
  set date(String value) => setField<String>('date', value);
}
