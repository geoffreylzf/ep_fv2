import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitDo")
class BroFa2VisitDoTb extends Table {
  String get tableName => 'bro_fa2_visit_do';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('bro_fa2_do')
  IntColumn get broFa2DoId => integer()();

  TextColumn get answer => text()();

  TextColumn get comment => text()();

  TextColumn get action => text()();

  TextColumn get remark => text()();
}
