import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitRoutineImg")
class BroFa2VisitRoutineImgTb extends Table {
  String get tableName => 'bro_fa2_visit_routine_img';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit_routine')
  IntColumn get broFa2VisitRoutineId => integer()();

  TextColumn get path => text()();

  /// This field is use to store the id of picture upload,
  /// after that upload to server by using this id
  @JsonKey('bro_fa2_visit_img_path')
  IntColumn get serverId => integer().nullable()();
}
