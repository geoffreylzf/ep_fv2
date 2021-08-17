import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitWeight")
class BroFa2VisitWeightTb extends Table {
  String get tableName => 'bro_fa2_visit_weight';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('house_no')
  IntColumn get houseNo => integer()();

  IntColumn get section => integer()();

  IntColumn get weight => integer()();

  IntColumn get qty => integer()();

  TextColumn get gender => text()();
}
