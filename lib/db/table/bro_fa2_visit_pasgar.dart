import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitPasgar")
class BroFa2VisitPasgarTb extends Table {
  String get tableName => 'bro_fa2_visit_pasgar';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit')
  IntColumn get broFa2VisitId => integer()();

  IntColumn get order => integer()();

  @JsonKey('is_chk_reflex')
  BoolColumn get isChkReflex => boolean().withDefault(const Constant(false))();

  @JsonKey('is_chk_navel')
  BoolColumn get isChkNavel => boolean().withDefault(const Constant(false))();

  @JsonKey('is_chk_legs')
  BoolColumn get isChkLegs => boolean().withDefault(const Constant(false))();

  @JsonKey('is_chk_beak')
  BoolColumn get isChkBeak => boolean().withDefault(const Constant(false))();

  @JsonKey('is_chk_belly')
  BoolColumn get isChkBelly => boolean().withDefault(const Constant(false))();
}
