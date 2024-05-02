import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/components/dialog_box.dart';
import 'package:todo_app/components/todo_tile.dart';
import 'package:todo_app/data/database.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the hive box
  final _myBox = Hive.box("myBox");


  //List of ToDo tasks :: Now instanciating the database class
  ToDoDatabase db = ToDoDatabase();

  //when the app starts
  @override
  void initState() {
    // TODO: implement initState
    db.loadData();

    super.initState();
  }
  

  //OnChanged method

  void checkboxChange(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //Accessing what's being written in the textfield
  final mycontroller = TextEditingController();

  //Method for save
  void saveNewTask(){
    setState(() {
      db.toDoList.add([mycontroller.text , false]);
      mycontroller.clear();
    });
      db.updateData();
      Navigator.of(context).pop();
  }
  void cancelTask(){
    setState(() {
      mycontroller.clear();
    });
      Navigator.of(context).pop();
  }


  //Creating new task when the floating action button is pressed
  void createNewTask (){
    showDialog(
      context: context, 
      builder: (context) {
        return DialogBox(
          controller: mycontroller,
          onSave: saveNewTask,
          onCancel: cancelTask,
        );
      },);
  }

  void deleteTask (int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("TO DO"),
        centerTitle: true,
      ) ,
      body: db.toDoList.isEmpty ?  
      const Center(
        child: Text("Hooray! You have nothing to do!",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w400
        ),
        ),
      ) : ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
          taskname: db.toDoList[index][0],
          taskCompleted: db.toDoList[index][1],
          onChanged: (value) => checkboxChange(value, index) ,
          deleteObject: (context) => deleteTask(index),
          );

        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: createNewTask,
        child: Icon(Icons.add),
      )
      
      );
     
  }
}