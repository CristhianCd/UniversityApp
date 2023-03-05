import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoItems extends StatelessWidget {
  final String taskName;
  final String imagePath;

  const ToDoItems({
    super.key,
    required this.taskName,
    required this.imagePath
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: _taskCompleted, icon: Icons.check_circle, backgroundColor: Colors.green[200]!, borderRadius: BorderRadius.circular(10))
          ],
        ),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(onPressed: _deleteTask, icon: Icons.delete, backgroundColor: Colors.red[200]!, borderRadius: BorderRadius.circular(10)),
          ],
        ),
        child: listTile(),
      )
    );
  }

  Widget listTile() => Container(
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10)
    ),
    child: Row(
      children: [
        Image.asset(imagePath, width: 20),
        const SizedBox(width: 20),
        Text(taskName, style: const TextStyle(fontSize: 15))
      ],
    )
  );

  void _deleteTask(BuildContext context) {
    print("deleted");
  }

  void _taskCompleted(BuildContext context) {
    print("Completed");
  }

}