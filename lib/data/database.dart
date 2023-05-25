import 'package:hive_flutter/hive_flutter.dart';
import 'package:rootodo/types/todo_type.dart';

class ToDoDatabase {
  List<dynamic> toDoList = [];
  List<dynamic> done = [];

  // hive box reference
  final _rootodoHiveBox = Hive.box("rootodo");

  // on first open of app
  void createInitialData() {
    toDoList = [
      ListElement(
        title: "swipe right on a tile to delete it",
        deadline: DateTime.now().add(const Duration(days: 900)),
        durationMinutes: 60,
      ),
      ListElement(
        title: "swipe left on a tile to check it off",
        deadline: DateTime.now().add(const Duration(days: 1000)),
        durationMinutes: 60,
      ),
      ListElement(
        title: "hold tile to edit it",
        deadline: DateTime.now().add(const Duration(days: 1100)),
        durationMinutes: 60,
      ),
      ListElement(
        title: "enjoy",
        deadline: DateTime.now().add(const Duration(days: 1200)),
        durationMinutes: 60,
      ),
    ];
  }

  // load data
  void loadData() {
    toDoList = _rootodoHiveBox.get("TODOLIST");
    print("loaded data from database"); // remove
  }

  // update database
  void updateDatabase() {
    sortToDo();
    _rootodoHiveBox.put("TODOLIST", toDoList);
    print("updated data in database"); // remove
  }

  // sort todo list
  void sortToDo() {
    for (var element in toDoList) {
      element.updateTimeLeft();
    }
    toDoList.sort((a, b) => a.calculatePriority().compareTo(b.calculatePriority()));
  }
}
