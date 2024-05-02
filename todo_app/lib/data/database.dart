import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List toDoList = [];

  //reference the hive box
  final _myBox = Hive.box("myBox");

  //loads data from database
  void loadData(){
    toDoList = _myBox.get("TODOLIST" , defaultValue: []);
  }

  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}