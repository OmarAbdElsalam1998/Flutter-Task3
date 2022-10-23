import 'package:addtasks/HomeScreen.dart';
import 'package:addtasks/addTask.dart';
import 'package:addtasks/editTask.dart';
import 'package:addtasks/tasksList.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
         primarySwatch: Colors.deepPurple,
         canvasColor:Color.fromARGB(255, 214, 209, 223)
      ),
      initialRoute: "/",
      routes: {
        "/":(context)=>const HomeScreen(),
        "/list":(context)=>const TasksList(),
        "/add":(context)=>const AddTask(),
        "/edit":(context) => const EditTask()
      },
    );
  }
}
