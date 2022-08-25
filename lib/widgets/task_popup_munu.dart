import 'package:flutter/material.dart';
import 'package:todo_list/models/task.dart';

class TaskPopupMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback likerOrDislike;

  const TaskPopupMenu({
    Key? key,
    required this.cancelOrDeleteCallback,
    required this.likerOrDislike,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      itemBuilder: task.isDeleted == false
          ? task.isDone == false
              ? (context) => [
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.edit),
                        label: const Text('Edit'),
                      ),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: task.isFavorite == false
                            ? const Icon(Icons.bookmark_add_outlined)
                            : const Icon(Icons.bookmark_remove),
                        label: task.isFavorite == false
                            ? const Text('Add to Bookmarks')
                            : const Text('Remove from Bookmarks'),
                      ),
                      onTap: () {
                        likerOrDislike();
                      },
                    ),
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                      ),
                      onTap: () {
                        cancelOrDeleteCallback();
                      },
                    ),
                  ]
              : (context) => [
                    PopupMenuItem(
                      child: TextButton.icon(
                        onPressed: null,
                        icon: const Icon(Icons.delete),
                        label: const Text('Delete'),
                      ),
                      onTap: () {
                        cancelOrDeleteCallback();
                      },
                    ),
                  ]
          : (context) => [
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.restore_from_trash),
                    label: const Text('Restore'),
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: TextButton.icon(
                    onPressed: null,
                    icon: const Icon(Icons.delete_forever),
                    label: const Text('Delete Forever'),
                  ),
                  onTap: () {
                    cancelOrDeleteCallback();
                  },
                ),
              ],
    );
  }
}
