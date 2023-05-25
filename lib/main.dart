import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:rootodo/pages/home.dart';
import 'package:rootodo/types/todo_type.dart';

void main() async {
  // hive init
  await Hive.initFlutter();
  Hive.registerAdapter(ListElementAdapter());

  // open box
  var box = await Hive.openBox("rootodo");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
      theme: ThemeData(
        unselectedWidgetColor: Colors.black,
        colorScheme: const ColorScheme.dark(),
      ),
    );
  }
}
