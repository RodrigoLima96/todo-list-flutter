import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Task> tasks = [
      Task(title: 'task1'),
      Task(title: 'task2'),
      Task(title: 'task3'),
      Task(title: 'task4'),
      Task(title: 'task5'),
    ];
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks App'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Chip(label: Text('tasks:')),
          ),
          Expanded(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
