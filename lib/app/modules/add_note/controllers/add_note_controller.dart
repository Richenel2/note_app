import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_app/app/data/models/note_model.dart';
import 'package:note_app/app/modules/home/controllers/home_controller.dart';
import 'package:note_app/app/modules/view_note/controllers/view_note_controller.dart';

class AddNoteController extends GetxController {
  Note? lastNote;
  final newNote = Rx<Note>(Note.empty());
  final isUpdate = false.obs;

  final formKey = GlobalKey<FormState>();
  final titleCtrl = TextEditingController();
  final containCtrl = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    try {
      lastNote = Get.arguments["note"];
      newNote.value = lastNote!.copy();
      containCtrl.text = lastNote!.contain!;
      titleCtrl.text = lastNote!.title!;
      isUpdate.value = true;
    } on NoSuchMethodError {}
  }

  save() {
    if (formKey.currentState!.validate()) {
      final ctrl = Get.find<HomeController>();
      if (newNote.value != Note.empty()) {
        if (lastNote == null) {
          lastNote = newNote.value.copy();
          ctrl.notes.add(lastNote!);
          ctrl.notes.refresh();
        } else {
          final index = ctrl.notes.indexOf(lastNote);
          lastNote = newNote.value.copy();
          ctrl.notes[index] = lastNote!;
          ctrl.notes.refresh();
          final viewCrtl = Get.find<ViewNoteController>();
          viewCrtl.note.value = lastNote!;
          viewCrtl.refresh();
        }
      }
    }
  }

  changeTitle() {
    newNote.value.title = titleCtrl.text;
    newNote.refresh();
  }

  changeContain() {
    newNote.value.contain = containCtrl.text;
    newNote.refresh();
  }

  changeColor(String color) {
    newNote.value.title = color;
    newNote.refresh();
  }

  changeFont(String font) {
    newNote.value.title = font;
    newNote.refresh();
  }

  bool get isSame => lastNote == null
      ? Note.empty() == newNote.value
      : lastNote == newNote.value;

  clear() {
    newNote.value = Note.empty();
    containCtrl.text = "";
    titleCtrl.text = "";
  }
}
