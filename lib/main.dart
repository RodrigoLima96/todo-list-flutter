import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home/home_page.dart';
import 'blocs/bloc_exports.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TasksBloc()..add(AddTask(task: Task(title: 'Task 1'))),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo List',
        home: HomePage(),
      ),
    );
  }
}
