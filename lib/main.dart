import 'package:flutter/material.dart';
import 'package:tasks/pages/home_page.dart';

void main(){
  runApp(const TaskApp());
}

class TaskApp extends StatelessWidget{

  const TaskApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "My Tasks",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}