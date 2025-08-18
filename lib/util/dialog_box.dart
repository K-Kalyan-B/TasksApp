import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget{
  final mycontroller;
  VoidCallback onAdd;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.mycontroller,
    required this.onAdd,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AlertDialog(
      content: TextField(
        decoration: InputDecoration(hintText: "add new task"),
        controller: mycontroller,
      ),
      actions: [
        TextButton(onPressed: onAdd, child: Text("Add")),
        TextButton(onPressed: onCancel, child: Text("Cancel"))
      ],
      backgroundColor: Colors.yellow[400]
    );
  }
}