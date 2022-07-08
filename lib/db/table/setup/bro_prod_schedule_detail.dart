import 'package:moor/moor.dart';

@DataClassName("BroProdScheduleDetail")
class BroProdScheduleDetailTb extends Table {
  String get tableName => 'bro_prod_schedule_detail';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_prod_schedule')
  IntColumn get broProdSchedule => integer()();

  @JsonKey('day_no')
  IntColumn get dayNo => integer()();

  @JsonKey('ah_body_wgt')
  RealColumn get ahBodyWgt => real()();

  @JsonKey('female_body_wgt')
  RealColumn get femaleBodyWgt => real()();

  @JsonKey('male_body_wgt')
  RealColumn get maleBodyWgt => real()();
}
