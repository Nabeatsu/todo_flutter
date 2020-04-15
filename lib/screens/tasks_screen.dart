import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/models/task_data.dart';
import 'package:todoflutter/widgets/task_list.dart';

import 'add_task_screen.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  'ToDo List',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.title.color,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Theme.of(context).textTheme.caption.color,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  )),
              child: taskListIeNeeded(context),
            ),
          )
        ],
      ),
    );
  }
}

Widget taskListIeNeeded(@required BuildContext context) {
  if (Provider.of<TaskData>(context).taskCount == 0) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'タスクはありません。',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Theme.of(context).textTheme.display1.color,
            ),
          ),
        ),
      ],
    );
  }
  return TaskList();
}
