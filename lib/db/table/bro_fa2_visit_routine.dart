import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitRoutine")
class BroFa2VisitRoutineTb extends Table {
  String get tableName => 'bro_fa2_visit_routine';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('bro_fa2_routine')
  IntColumn get broFa2RoutineId => integer()();

  TextColumn get comment => text()();

  TextColumn get action => text()();

  TextColumn get remark => text()();
}
