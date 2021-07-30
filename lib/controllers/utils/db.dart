import 'package:ep_fv2/db/db.dart';
import 'package:get/get.dart';

class DbController extends GetxController {
  Db _db = Db();

  Db get db => _db;

  @override
  Future<void> onClose() async {
    db.close();
  }
}
