import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.taskTitle,
    required this.deleteFunction,
    required this.checkOffFunction,
    required this.editFunction,
  });

  final String taskTitle;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? checkOffFunction;
  final Function()? editFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      child: Slidable(
        startActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.grey.shade900,
              borderRadius: BorderRadius.circular(15),
              autoClose: true,
            ),
          ],
        ),
        endActionPane: ActionPane(
          extentRatio: 0.25,
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: checkOffFunction,
              icon: Icons.check,
              backgroundColor: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(15),
            ),
          ],
        ),
        child: InkWell(
          onLongPress: editFunction,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
            decoration: BoxDecoration(
              color: Colors.blueGrey[300],
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: 40,
              width: double.infinity,
              child: Center(
                child: Text(
                  taskTitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
