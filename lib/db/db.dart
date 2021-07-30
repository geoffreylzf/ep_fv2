import 'dart:io';

import 'package:ep_fv2/db/dao/setup/bro_fa2_do.dart';
import 'package:ep_fv2/db/dao/setup/bro_fa2_fo.dart';
import 'package:ep_fv2/db/dao/setup/bro_fa2_fo_selection.dart';
import 'package:ep_fv2/db/dao/setup/bro_fa2_ma.dart';
import 'package:ep_fv2/db/dao/setup/bro_fa2_pm.dart';
import 'package:ep_fv2/db/dao/setup/bro_fa2_routine.dart';
import 'package:ep_fv2/db/dao/setup/company.dart';
import 'package:ep_fv2/db/dao/setup/loc_house.dart';
import 'package:ep_fv2/db/dao/setup/location.dart';
import 'package:ep_fv2/db/table/bro_fa2_visit.dart';
import 'package:ep_fv2/db/table/bro_fa2_visit_house.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_do.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_fo.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_fo_selection.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_ma.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_pm.dart';
import 'package:ep_fv2/db/table/setup/bro_fa2_routine.dart';
import 'package:ep_fv2/db/table/setup/company.dart';
import 'package:ep_fv2/db/table/setup/loc_house.dart';
import 'package:ep_fv2/db/table/setup/location.dart';
import 'package:intl/intl.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:uuid/uuid.dart';

part 'db.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return VmDatabase(file);
  });
}

@UseMoor(
  tables: [
    CompanyTb,
    LocationTb,
    LocHouseTb,
    BroFa2DoTb,
    BroFa2FoTb,
    BroFa2FoSelectionTb,
    BroFa2MaTb,
    BroFa2PmTb,
    BroFa2RoutineTb,
    BroFa2VisitTb,
    BroFa2VisitHouseTb,
  ],
  daos: [
    CompanyDao,
    LocationDao,
    LocHouseDao,
    BroFa2DoDao,
    BroFa2FoDao,
    BroFa2FoSelectionDao,
    BroFa2MaDao,
    BroFa2PmDao,
    BroFa2RoutineDao,
  ],
)
class Db extends _$Db {
  Db() : super(_openConnection());

  int get schemaVersion => 1;

  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (Migrator m) {
          return m.createAll();
        },
        onUpgrade: (Migrator m, int from, int to) async {
          if (to <= 1) {}
          if (to <= 2) {}
        },
      );
}
