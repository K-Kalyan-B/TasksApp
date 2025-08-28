import 'package:hive_flutter/hive_flutter.dart';

class Tasksdatabase {
  
  final box = Hive.box('tasksBox');
  
  List tasks = [];

  void initData(){
    
      tasks = [['learn Flutter',false]];

  }

  void getData(){
    tasks = box.get("TASKS");
  }

  void updateData(){

    box.put("TASKS", tasks);

  }

}