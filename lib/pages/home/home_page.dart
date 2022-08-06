import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';
import 'package:todo_list/pages/home/widgets/add_task_modal.dart';
import 'package:todo_list/widgets/tasks_list.dart';

import '../../blocs/bloc_exports.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const SingleChildScrollView(
        child: AddTaskModal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Center(
                child: Chip(label: Text('tasks:')),
              ),
              TasksList(tasks: tasksList),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add Task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
