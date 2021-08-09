import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitMa")
class BroFa2VisitMaTb extends Table {
  String get tableName => 'bro_fa2_visit_ma';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('bro_fa2_ma')
  IntColumn get broFa2MaId => integer()();

  TextColumn get comment => text()();

  TextColumn get action => text()();

  TextColumn get remark => text()();
}
