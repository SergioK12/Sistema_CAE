import 'package:flutter/material.dart';

class AddTaskFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  String descripcion = "";
  bool iscompleted = false;
  String date = "";

  
}
