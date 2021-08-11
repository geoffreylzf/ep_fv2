import 'package:ep_fv2/db/db.dart';
import 'package:moor/moor.dart';

class LogDao extends DatabaseAccessor<Db> {
  LogDao(Db db) : super(db);

  $LogTbTable get logTb => attachedDatabase.logTb;

  Future<int> insert(LogTbCompanion entry) {
    return into(logTb).insert(entry);
  }

  Stream<List<Log>> watchAll() {
    return (select(logTb)..orderBy([(t) => OrderingTerm.desc(t.timestamp)])).watch();
  }
}
