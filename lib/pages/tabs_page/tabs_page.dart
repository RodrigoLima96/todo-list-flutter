import 'package:flutter/material.dart';
import 'package:todo_list/pages/completed_tasks/completed_tasks_page.dart';
import 'package:todo_list/pages/drawer/app_drawer.dart';
import 'package:todo_list/pages/favorite_tasks/favorite_tasks_page.dart';
import 'package:todo_list/pages/pending_tasks/pending_tasks_page.dart';
import 'package:todo_list/widgets/add_task_modal.dart';

class TabsPage extends StatefulWidget {
  TabsPage({Key? key}) : super(key: key);

  static const id = 'tabs_page';

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Map<String, dynamic>> _pageDetails = [
    {'pageName': const PendingTasksPage(), 'title': 'Peding Tasks'},
    {'pageName': const CompletedTasksPage(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksPage(), 'title': 'Favorite Tasks'},
  ];

  var _selectedPageIndex = 0;

  void _addTask(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => const SingleChildScrollView(
        child: AddTaskModal(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_pageDetails[_selectedPageIndex]['title']),
        actions: [
          IconButton(
            onPressed: () => _addTask(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _pageDetails[_selectedPageIndex]['pageName'],
      floatingActionButton: _selectedPageIndex == 0
          ? FloatingActionButton(
              onPressed: () => _addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.incomplete_circle_sharp),
            label: 'Peding Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done),
            label: 'Completed Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite Tasks',
          ),
        ],
      ),
    );
  }
}
