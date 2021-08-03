import 'package:moor/moor.dart';

@DataClassName("BroFa2VisitFoImg")
class BroFa2VisitFoImgTb extends Table {
  String get tableName => 'bro_fa2_visit_fo_img';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('bro_fa2_visit_fo')
  IntColumn get broFa2VisitFoId => integer()();

  TextColumn get path => text()();

  /// This field is use to store the id of picture upload,
  /// after that upload to server by using this id
  @JsonKey('bro_fa2_visit_img_path')
  IntColumn get serverId => integer().nullable()();
}
