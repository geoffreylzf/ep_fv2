import 'package:moor/moor.dart';

@DataClassName("BroFa2FoSelection")
class BroFa2FoSelectionTb extends Table {
  String get tableName => 'bro_fa2_fo_selection';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_fo')
  IntColumn get broFa2FoId => integer()();

  TextColumn get name => text()();

  IntColumn get order => integer()();
}
