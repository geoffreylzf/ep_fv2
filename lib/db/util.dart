import 'package:moor/moor.dart';

abstract class DaoSetupBasic<T> {
  Stream<int> watchCountAll();

  Future<int> deleteAll();

  Future<void> insertAllFromJson(dynamic data);
}

class MyValueSerializer extends ValueSerializer {
  const MyValueSerializer();

  @override
  T fromJson<T>(dynamic json) {
    if (T == bool && json is int) {
      return (json == 1) as T;
    }
    return const ValueSerializer.defaults().fromJson(json);
  }

  @override
  dynamic toJson<T>(T value) {
    return const ValueSerializer.defaults().toJson(value);
  }
}
