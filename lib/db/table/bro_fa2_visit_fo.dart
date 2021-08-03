import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitFo")
class BroFa2VisitFoTb extends Table {
  String get tableName => 'bro_fa2_visit_fo';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('bro_fa2_fo')
  IntColumn get broFa2FoId => integer()();

  TextColumn get answer => text()();

  @JsonKey('bro_fa2_fo_selection')
  IntColumn get broFa2FoSelectionId => integer().nullable()();

  TextColumn get comment => text()();

  TextColumn get action => text()();

  TextColumn get remark => text()();
}
