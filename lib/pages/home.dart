import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rootodo/data/database.dart';
import 'package:rootodo/utils/tile_dialog.dart';
import 'package:rootodo/utils/todo_tile.dart';
import 'package:rootodo/types/todo_type.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // hive box reference
  final _rootodoHiveBox = Hive.box("rootodo");
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    super.initState();

    if (_rootodoHiveBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
  }

  final TextEditingController _controllerTitle = TextEditingController();
  final TextEditingController _controllerDeadline = TextEditingController();
  final TextEditingController _controllerDuration = TextEditingController();

  // add dialog
  void onCreateTaskButtonPress() {
    showDialog(
      context: context,
      builder: (context) {
        return TileDialog(
          controllerTitle: _controllerTitle,
          controllerDeadline: _controllerDeadline,
          controllerDuration: _controllerDuration,
          onLeftButtonClick: () => Navigator.of(context).pop(),
          onRightButtonClick: addNewTask,
          leftButtonTitle: "cancel",
          rightButtonTitle: "add",
        );
      },
    );
  }

  // edit dialog
  void editTask(int index) {
    _controllerTitle.value = TextEditingValue(text: db.toDoList[index].title);
    _controllerDeadline.value = TextEditingValue(text: db.toDoList[index].deadlineToString());
    _controllerDuration.value = TextEditingValue(text: db.toDoList[index].durationToString());

    showDialog(
      context: context,
      builder: (context) {
        return TileDialog(
          controllerTitle: _controllerTitle,
          controllerDeadline: _controllerDeadline,
          controllerDuration: _controllerDuration,
          onLeftButtonClick: () => Navigator.of(context).pop(),
          onRightButtonClick: () => saveTask(index),
          leftButtonTitle: "cancel",
          rightButtonTitle: "save",
        );
      },
    );
  }

  // delete task from list with swipe
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
      db.updateDatabase();
    });
  }

  // checkoff task with swipe
  void checkOff(int index) {
    setState(() {
      db.done.add(db.toDoList.removeAt(index));
      db.updateDatabase();
    });
  }

  // add new task to todo list
  void addNewTask() {
    setState(() {
      db.toDoList.add(ListElement(
        title: _controllerTitle.text.toLowerCase(),
        deadline: DateTime.parse(_controllerDeadline.text),
        durationMinutes: ListElement.durationStringToInt(_controllerDuration.text),
      ));
      db.updateDatabase();

      _controllerTitle.clear();
      _controllerDeadline.clear();
      _controllerDuration.clear();
    });
    Navigator.of(context).pop();
  }

  // save edited task to todolist
  void saveTask(int index) {
    setState(() {
      db.toDoList[index].title = _controllerTitle.text.toLowerCase();
      db.toDoList[index].deadline = DateTime.parse(_controllerDeadline.text);
      db.toDoList[index].durationMinutes = ListElement.durationStringToInt(_controllerDuration.text);
      db.updateDatabase();

      _controllerTitle.clear();
      _controllerDeadline.clear();
      _controllerDuration.clear();
    });
    Navigator.of(context).pop();
  }

  // build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      floatingActionButton: FloatingActionButton(
        onPressed: onCreateTaskButtonPress,
        elevation: 0,
        backgroundColor: Colors.blueGrey[300],
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return TodoTile(
            taskTitle: db.toDoList[index].title,
            deleteFunction: (context) => deleteTask(index),
            checkOffFunction: (context) => checkOff(index),
            editFunction: () => editTask(index),
          );
        },
      ),
    );
  }
}
