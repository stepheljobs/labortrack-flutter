import '../database.dart';

class EmployeesTable extends SupabaseTable<EmployeesRow> {
  @override
  String get tableName => 'employees';

  @override
  EmployeesRow createRow(Map<String, dynamic> data) => EmployeesRow(data);
}

class EmployeesRow extends SupabaseDataRow {
  EmployeesRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => EmployeesTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  DateTime get createdAt => getField<DateTime>('created_at')!;
  set createdAt(DateTime value) => setField<DateTime>('created_at', value);

  String get companyCode => getField<String>('company_code')!;
  set companyCode(String value) => setField<String>('company_code', value);

  String get assignProject => getField<String>('assign_project')!;
  set assignProject(String value) => setField<String>('assign_project', value);

  String get firstName => getField<String>('first_name')!;
  set firstName(String value) => setField<String>('first_name', value);

  String get lastName => getField<String>('last_name')!;
  set lastName(String value) => setField<String>('last_name', value);

  String? get gcash => getField<String>('gcash');
  set gcash(String? value) => setField<String>('gcash', value);

  String get position => getField<String>('position')!;
  set position(String value) => setField<String>('position', value);

  int get rate => getField<int>('rate')!;
  set rate(int value) => setField<int>('rate', value);

  String get employeeId => getField<String>('employee_id')!;
  set employeeId(String value) => setField<String>('employee_id', value);
}
