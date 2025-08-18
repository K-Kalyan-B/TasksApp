import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget{
  final taskName;
  final taskDone;
  Function(bool?)? onChange;
  TaskTile({super.key,required this.taskName,required this.taskDone,required this.onChange});

  @override
  Widget build(BuildContext context) {

    return Padding(
          padding: EdgeInsets.all(12.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(10.0)
            ),
            child: Row(
              children: [
                Checkbox(value: taskDone, onChanged: onChange),
                Text(taskName,style: TextStyle(decoration: taskDone ? TextDecoration.lineThrough : TextDecoration.none),)
              ],
            ),
          )
      );
  }
}