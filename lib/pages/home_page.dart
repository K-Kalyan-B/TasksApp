import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tasks/data/taskdatabase.dart';
import 'package:tasks/util/dialog_box.dart';
import 'package:tasks/util/task_tile.dart';

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  final box = Hive.box('tasksBox');
  Tasksdatabase db = Tasksdatabase();

  // List box.box.tasks = [["Learn Flutter",false]];

  @override
  void initState() {
    // TODO: implement initState
    if(box.get("TASKS") == null){
      db.initData();
    }else{
      db.getData();
    }
    super.initState();
  }

  TextEditingController mycontroller = TextEditingController();

  void onChange(bool? value,int index){
    setState(() {
      db.tasks[index][1] = !db.tasks[index][1];
    });
    db.updateData();
  }

  void onAdd(){
    setState(() {
      db.tasks.add([mycontroller.text,false]);
    });
    mycontroller.clear();
    Navigator.of(context).pop();
    db.updateData();
  }

  void createTask(){
    showDialog(
      context: context, 
      builder:(context) {
        return DialogBox(mycontroller: mycontroller, onAdd: onAdd, onCancel: () => Navigator.of(context).pop());
      },
    );
  }

  void deleteTask(int index){
    setState(() {
      db.tasks.removeAt(index);
    });
    db.updateData();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    db.tasks.sort((a,b) => a[1] == b[1] ? 0 : (a[1] ? 1 : -1));
    return Scaffold(
        appBar: AppBar(title: Text("My db.tasks"),backgroundColor: Colors.yellow,centerTitle: true,),
        backgroundColor: Colors.yellow[300],
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add,color: Colors.black,),
        ),
        body: ListView.builder(
          itemCount: db.tasks.length,
          padding: EdgeInsets.all(12.0),
          itemBuilder: (context, index) {
            return TaskTile(taskName: db.tasks[index][0], taskDone: db.tasks[index][1], onChange: (value)=>onChange(value, index),deleteTask: () => deleteTask(index),);
          },
        )
      
      );
  }
}