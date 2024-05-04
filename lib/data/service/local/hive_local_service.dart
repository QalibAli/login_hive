import 'package:hive_flutter/hive_flutter.dart';

class HiveLocalService {
  final Box _box;

  HiveLocalService(this._box);

  Future<void> saveState() async {
    await _box.put("home", 1);
  }

  int get getData {
    try {
      int data = _box.get("home");
      return data;
    } catch (e) {
      return 0;
    }
  }
}
