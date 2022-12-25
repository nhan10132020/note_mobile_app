import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:learn_note_app/components/dialog_box_change.dart';

class TodoList extends StatefulWidget {
  late String taskName;
  final bool taskCompleted;
  Function(bool?) onChanged;
  Function() processTodolist;
  Function(BuildContext) deleteFunction;
  late final controller;
  TodoList(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction,
      required this.processTodolist,
      required this.controller,
      });

  @override
  State<TodoList> createState() => _TodoListState();
}
class _TodoListState extends State<TodoList> {
   
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.deleteFunction ,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10.0),
            )
          ],
        ),
        child: Container(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 7, bottom: 7),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: widget.taskCompleted,
                onChanged: widget.onChanged,
                activeColor: Colors.black,
              ),
              Flexible(
                child: GestureDetector(
                  onDoubleTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DialogBoxChange(
                          controller:widget.controller ,
                          onCancel: () => Navigator.of(context).pop(),
                          onSave: widget.processTodolist,
                        );
                      },
                    );
                  },
                  child: Text(
                    widget.taskName,
                    style: widget.taskCompleted
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                          )
                        : const TextStyle(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
