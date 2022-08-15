import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/widgets/tasks_list.dart';
import '../../blocs/bloc_exports.dart';

class PendingTasksPage extends StatelessWidget {
  const PendingTasksPage({Key? key}) : super(key: key);
  static const id = 'tasks_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.pendingTasks;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasksList.length} Pending | ${state.completedTasks.length} Completed',
                ),
              ),
            ),
            TasksList(tasks: tasksList),
          ],
        );
      },
    );
  }
}
