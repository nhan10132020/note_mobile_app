import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:learn_note_app/components/dialog_box.dart';
import 'package:learn_note_app/components/todo_list.dart';
import 'package:learn_note_app/data/database.dart';

class HomeScreen extends StatefulWidget {
  
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _myBox = Hive.box("myBox");
  TodoDatabase db = TodoDatabase();
  
  @override
  void initState() {
    if(_myBox.get("TODOLIST")==null){
       db.createInitialData();   
    }else{
      db.loadDate(); 
    }
    super.initState(); 
  }

  void checkboxChange(bool? value, int index) {
    setState(() {
      db.todoList[index][1] = value;
    });
    db.updateData();  
  }
  final _controller = TextEditingController();

  void saveNewTask(){
     setState(() {
        db.todoList.add([_controller.text,false]);
        _controller.clear();
        Navigator.of(context).pop();
     });
     db.updateData();  
  }
  void deleteTask(int index){
      setState(() {
        db.todoList.removeAt(index);
      });
      db.updateData();    
  }


  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }
  void processTodo(int index,TextEditingController controller){
    setState(() {
      db.todoList[index][0] = controller.text;
      Navigator.of(context).pop();
    });
    db.updateData();
  }
  @override
  
  Widget build(BuildContext context) {
    List changeController = List.generate(db.todoList.length, (index) =>TextEditingController(text: db.todoList[index][0]));
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          title: const Text("TO DO"),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            return TodoList( 
              taskName: db.todoList[index][0], 
              taskCompleted: db.todoList[index][1],
              onChanged: (bool? value) {
                checkboxChange(value, index);
              },
              deleteFunction: (context){
                deleteTask(index);
              },
              controller:changeController[index],
              processTodolist: (){
                
                processTodo(index,changeController[index]);
              },
            );
          },
        ));
  }
}
