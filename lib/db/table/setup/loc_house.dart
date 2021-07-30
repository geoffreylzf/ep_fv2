import 'package:moor/moor.dart';

@DataClassName("LocHouse")
class LocHouseTb extends Table {
  String get tableName => 'loc_house';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('location')
  IntColumn get locationId => integer()();

  @JsonKey('house_no')
  IntColumn get houseNo => integer()();
}
