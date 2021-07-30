import 'package:intl/intl.dart';
import 'package:moor/moor.dart';
import 'package:uuid/uuid.dart';

@DataClassName("BroFa2Visit")
class BroFa2VisitTb extends Table {
  String get tableName => 'bro_fa2_visit';

  IntColumn get id => integer().autoIncrement()();

  @JsonKey('company')
  IntColumn get companyId => integer()();

  @JsonKey('location')
  IntColumn get locationId => integer()();

  @JsonKey('visit_date')
  TextColumn get visitDate => text()();

  @JsonKey('age')
  IntColumn get age => integer()();

  @JsonKey('doc_observation_bird_qty')
  IntColumn get docObservationBirdQty => integer().nullable()();

  @JsonKey('post_mortem_bird_qty')
  IntColumn get postMortemBirdQty => integer().nullable()();

  @JsonKey('timestamp')
  TextColumn get timestamp => text().clientDefault(
        () => DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      )();

  @JsonKey('uuid')
  TextColumn get uuid => text().clientDefault(() => Uuid().v4().replaceAll('-', ''))();

  @JsonKey('is_delete')
  BoolColumn get isDelete => boolean().withDefault(const Constant(false))();

  @JsonKey('is_upload')
  BoolColumn get isUpload => boolean().withDefault(const Constant(false))();
}
