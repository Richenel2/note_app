import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:note_app/app/core/utils/keys.dart';

class StorageService extends GetxService {
  late GetStorage _box;

  Future<StorageService> init() async {
    _box = GetStorage();
    await _box.writeIfNull(AppKeys.notes, []);
    await _box.writeIfNull(AppKeys.language, ["en","US"]);
    await _box.writeIfNull(AppKeys.theme, 0);
    return this;
  }

  T read<T>(String key) {
    return _box.read(key);
  }

  void write(String key, dynamic value) async {
    await _box.write(key, value);
  }
}
