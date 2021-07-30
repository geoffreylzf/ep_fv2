import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitHouse")
class BroFa2VisitHouseTb extends Table {
  String get tableName => 'bro_fa2_visit_house';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  @JsonKey('house_no')
  IntColumn get houseNo => integer()();
}
