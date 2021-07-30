import 'package:moor/moor.dart';

@DataClassName("BroFa2Do")
class BroFa2DoTb extends Table {
  String get tableName => 'bro_fa2_do';

  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  @JsonKey('std_value')
  TextColumn get stdValue => text()();

  @JsonKey('is_formula')
  BoolColumn get isFormula => boolean()();

  TextColumn get formula => text().nullable()();

  @JsonKey('is_pasgar')
  BoolColumn get isPasgar => boolean()();

  IntColumn get order => integer()();
}
