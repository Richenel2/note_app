import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/data/providers/note_provider.dart';

class HomeController extends GetxController {
  final notes = <Note>[].obs;

  
  @override
  void onInit() {
    super.onInit();
    notes.assignAll(NoteProvider.instance.readNotes);
    ever(notes, (_) => NoteProvider.instance.writeNote(notes));
  }
}
