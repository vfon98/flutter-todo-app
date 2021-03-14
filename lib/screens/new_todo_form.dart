import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/main.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

class NewTodoFormScreen extends StatelessWidget {
  const NewTodoFormScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('New Todo'),
      ),
      // CONTENT
      body: TodoForm(),
    );
  }
}

class TodoForm extends StatefulWidget {
  @override
  _TodoFormState createState() => _TodoFormState();
}

class _TodoFormState extends State<TodoForm> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                  helperText: 'Ex: Learn Flutter'),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  helperText: 'Ex: Participate PTN Tech Talks'),
            ),
            SizedBox(height: 16),
            TextFormField(
              initialValue: TimeOfDay.now().format(context),
              onTap: () async {
                var result = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                print(result);
              },
              readOnly: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.timer),
                  labelText: 'Time',
                  helperText: 'Pick a time'),
            ),
            SizedBox(height: 16),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                child: Text('Confirm'),
                onPressed: () async {
                  var result = await showTimePicker(
                      context: context, initialTime: TimeOfDay.now());
                  print(result);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
