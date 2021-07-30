import 'package:moor/moor.dart';

@DataClassName("Company")
class CompanyTb extends Table {
  String get tableName => 'company';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('company_code')
  TextColumn get companyCode => text()();

  @JsonKey('company_name')
  TextColumn get companyName => text()();
}
