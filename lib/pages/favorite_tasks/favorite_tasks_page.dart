import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/widgets/tasks_list.dart';
import '../../blocs/bloc_exports.dart';

class FavoriteTasksPage extends StatelessWidget {
  const FavoriteTasksPage({Key? key}) : super(key: key);
  static const id = 'tasks_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.favoriteTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(label: Text('${tasksList.length} Tasks')),
            ),
            TasksList(tasks: tasksList),
          ],
        );
      },
    );
  }
}
