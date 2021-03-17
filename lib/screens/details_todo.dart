import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/models/todo.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

class DetailsTodoScreen extends StatelessWidget {
  final Todo todo;

  const DetailsTodoScreen({Key key, @required this.todo}) : super(key: key);

  deleteTodo(String id) {
    print('Deleting $id');
  }

  @override
  Widget build(BuildContext context) {
    print(todo);
    return Scaffold(
      appBar: MyAppBar(
        title: Text(todo.title),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(8),
        child: Card(
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    todo.title,
                    style: TextStyle(fontSize: 20),
                  ),
                  leading: FlutterLogo(
                    size: 32,
                  ),
                ),
                Divider(),
                SizedBox(height: 8),
                ListTile(
                  title: Text(
                    'Description:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(todo.description),
                ),
                ListTile(
                  title: Text(
                    'Time:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(todo.time),
                ),
                ListTile(
                  title: Text(
                    'Created At:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Text(todo.createdAt.toString()),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        Text(
                          'Back',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.delete),
                        Text(
                          'Delete',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    onPressed: () {
                      deleteTodo(todo.id);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
