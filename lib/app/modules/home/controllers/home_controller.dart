import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/data/providers/note_provider.dart';

class HomeController extends GetxController {
  final notes = <Note>[].obs;
  final searchNotes = <Note>[].obs;
  final searchEmpty = true.obs;

  final searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    notes.assignAll(NoteProvider.instance.readNotes);
    ever(notes, (_) => NoteProvider.instance.writeNote(notes));
  }

  deleteNote(Note note) {
    notes.remove(note);
  }

  searchTitle(String title) {
    if (title.isEmpty) {
      searchEmpty.value = true;
      searchNotes.clear();
    } else {
      searchEmpty.value = false;
      searchNotes.assignAll(notes.where(
        (p0) => p0.title!.toLowerCase().contains(title.toLowerCase()),
      ));
    }
  }
}
