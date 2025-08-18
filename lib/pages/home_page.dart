import 'package:flutter/material.dart';
import 'package:tasks/util/dialog_box.dart';
import 'package:tasks/util/task_tile.dart';

class HomePage extends StatefulWidget{

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List tasks = [["Learn Flutter",false]];
  TextEditingController mycontroller = TextEditingController();

  void onChange(bool? value,int index){
    setState(() {
      tasks[index][1] = !tasks[index][1];
    });
  }

  void onAdd(){
    setState(() {
      tasks.add([mycontroller.text,false]);
    });
    mycontroller.clear();
    Navigator.of(context).pop();
  }

  void createTask(){
    showDialog(
      context: context, 
      builder:(context) {
        return DialogBox(mycontroller: mycontroller, onAdd: onAdd, onCancel: () => Navigator.of(context).pop());
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(title: Text("My Tasks"),backgroundColor: Colors.yellow,centerTitle: true,),
        backgroundColor: Colors.yellow[300],
        floatingActionButton: FloatingActionButton(
          onPressed: createTask,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TaskTile(taskName: tasks[index][0], taskDone: tasks[index][1], onChange: (value)=>onChange(value, index));
          },
        )
      
      );
  }
}