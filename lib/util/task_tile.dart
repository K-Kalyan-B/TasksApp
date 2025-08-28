import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TaskTile extends StatelessWidget{
  final taskName;
  final taskDone;
  Function(bool?)? onChange;
  final VoidCallback? deleteTask;
  TaskTile({super.key,required this.taskName,required this.taskDone,required this.onChange,required this.deleteTask});

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: EdgeInsets.all(12.0),
          child: Slidable(
            endActionPane: ActionPane(
              motion: StretchMotion(),
              
              children: [
                SlidableAction(
                  onPressed: (context) {
                    deleteTask!();
                  },
                  backgroundColor: Colors.red,
                  icon: Icons.delete,
                  label: 'Delete',
                  borderRadius: BorderRadius.circular(12.0),

                )
              ]
              ),
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(10.0)
              ),
              child: Row(
                children: [
                  Checkbox(value: taskDone, onChanged: onChange,activeColor: Colors.black,),
                  Text(taskName,style: TextStyle(fontSize: 17.0,decoration : taskDone ? TextDecoration.lineThrough : TextDecoration.none),)
                ],
              ),
            ),
          )
      );
  }
}