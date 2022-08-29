import 'package:flutter/material.dart';
import 'package:todo_list/pages/drawer/app_drawer.dart';
import 'package:todo_list/widgets/tasks_list.dart';

import '../../blocs/bloc_exports.dart';

class RecycleBinPage extends StatelessWidget {
  const RecycleBinPage({Key? key}) : super(key: key);
  static const id = 'recycle_bin_page';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Recycle Bin'),
            centerTitle: true,
            actions: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    child: TextButton.icon(
                      onPressed: null,
                      icon: const Icon(
                        Icons.delete_forever,
                      ),
                      label: const Text('Delete all Tasks'),
                    ),
                    onTap: () => context.read<TasksBloc>().add(
                          DeleteAllTasks(),
                        ),
                  )
                ],
              ),
            ],
          ),
          drawer: const AppDrawer(),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(label: Text('${state.removedTasks.length} Tasks')),
              ),
              TasksList(tasksList: state.removedTasks),
            ],
          ),
        );
      },
    );
  }
}
