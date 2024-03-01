import '../database.dart';

class ProjectsTable extends SupabaseTable<ProjectsRow> {
  @override
  String get tableName => 'projects';

  @override
  ProjectsRow createRow(Map<String, dynamic> data) => ProjectsRow(data);
}

class ProjectsRow extends SupabaseDataRow {
  ProjectsRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProjectsTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get projectName => getField<String>('project_name')!;
  set projectName(String value) => setField<String>('project_name', value);

  String get projectLocation => getField<String>('project_location')!;
  set projectLocation(String value) =>
      setField<String>('project_location', value);

  String get status => getField<String>('status')!;
  set status(String value) => setField<String>('status', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);
}
