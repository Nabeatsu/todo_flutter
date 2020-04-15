import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoflutter/models/task_data.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String _newTaskTitle;

  Color get cornerColor {
    var brightness = MediaQuery.of(context).platformBrightness;
    return (brightness == Brightness.dark)
        ? Colors.transparent
        : Color(0xff757575);
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Container(
      color: cornerColor,
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: themeData.backgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            )),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'タスク追加画面',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 30.0,
                  color: themeData.textTheme.display1.color),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                _newTaskTitle = newText;
                print(_newTaskTitle);
              },
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(color: themeData.textTheme.button.color),
              ),
              color: themeData.primaryColor,
              onPressed: () {
                print('&&&&&&');
                print(_newTaskTitle);
                print('&&&&&&&&');
                Provider.of<TaskData>(context, listen: false)
                    .addTask(_newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
