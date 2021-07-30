import 'package:moor/moor.dart';

@DataClassName("Location")
class LocationTb extends Table {
  String get tableName => 'location';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('location_code')
  TextColumn get locationCode => text()();

  @JsonKey('location_name')
  TextColumn get locationName => text()();

  @JsonKey('company')
  IntColumn get companyId => integer()();
}
