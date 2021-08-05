import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitPm")
class BroFa2VisitPmTb extends Table {
  String get tableName => 'bro_fa2_visit_pm';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('bro_fa2_pm')
  IntColumn get broFa2PmId => integer()();

  TextColumn get comment => text()();

  TextColumn get action => text()();

  TextColumn get remark => text()();
}
