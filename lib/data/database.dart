import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase{
  List todoList = [];
  final _myBox = Hive.box("mybox");

  void createInitialData(){
    todoList = [
      ["Make tutorial",false], 
      ["Nhan dep trai", true]
    ];
  }
  void loadDate(){
     todoList = _myBox.get("TODOLIST");
  }

  void updateData(){
    _myBox.put("TODOLIST",todoList);   
  }
}