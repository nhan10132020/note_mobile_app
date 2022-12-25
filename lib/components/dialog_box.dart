import 'package:flutter/material.dart';
import 'package:learn_note_app/components/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  Function() onSave;
  VoidCallback onCancel; 

  DialogBox({super.key,required this.controller,required this.onSave,required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 125,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly ,
          children:  [
            Padding(
              padding: const EdgeInsets.only(bottom:15.0),
              child: TextField(
                controller: controller ,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder:const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  hintText: "Add a new task",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                 MyButton(text: "Save", onPressed:onSave),
                 
                 MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
