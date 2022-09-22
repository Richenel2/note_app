import 'package:get/get.dart';
import 'package:note_app/app/core/utils/keys.dart';

import '../models/note_model.dart';
import '../services/storage/services.dart';

class NoteProvider {
  final StorageService _storage = Get.find<StorageService>();
  NoteProvider._();
  static final _instance = NoteProvider._();
  static NoteProvider get instance => _instance;

  List<Note> get readNotes => (_storage.read(AppKeys.notes) as List)
      .map((e) => Note.fromJson(e))
      .toList();
  void writeNote(List<Note> notes) {
    _storage.write(AppKeys.notes, notes);
  }
}
