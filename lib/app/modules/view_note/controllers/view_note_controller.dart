import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';

class ViewNoteController extends GetxController {
  final note = Rx<Note>(Get.arguments["note"] as Note);
  final isUpdate = false.obs;
  @override
  void onInit() {
    super.onInit();
    isUpdate.value = Get.arguments["isUpdate"] ?? false;
  }
}
