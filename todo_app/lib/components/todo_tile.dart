import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoTile extends StatelessWidget {
  final String taskname;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteObject;

  ToDoTile({super.key , required this.taskname, required this.taskCompleted, required this.onChanged , required this.deleteObject });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25,),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children:[
            SlidableAction(
              onPressed: deleteObject,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
            )
          ]  ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Row(
            children: [
              Checkbox(value: taskCompleted , onChanged: onChanged,
              activeColor: Colors.black,
              
              ),
              Text(
                taskname,
                style: TextStyle(
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}