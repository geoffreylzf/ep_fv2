import 'package:moor/moor.dart';

@DataClassName("BroProdSchedule")
class BroProdScheduleTb extends Table {
  String get tableName => 'bro_prod_schedule';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bre_type')
  IntColumn get breType => integer()();

  @JsonKey('bre_type_code')
  TextColumn get breTypeCode => text()();

  @JsonKey('bre_type_name')
  TextColumn get breTypeName => text()();
}
