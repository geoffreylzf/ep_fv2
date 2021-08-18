abstract class DaoSetupBasic<T> {
  Stream<int> watchCountAll();

  Future<int> deleteAll();

  Future<void> insertAllFromJson(dynamic data);
}
