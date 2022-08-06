import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ListTile(
            title: Text(tasks[index].title),
            trailing: Checkbox(
              value: tasks[index].isDone,
              onChanged: (value) {},
            ),
          );
        },
      ),
    );
  }
}
