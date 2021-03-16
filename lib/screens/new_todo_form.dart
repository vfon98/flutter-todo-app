import 'package:flutter/material.dart';
import 'package:todo_ptn_tech_talks/models/todo.dart';
import 'package:todo_ptn_tech_talks/widgets/app_bar/my_app_bar.dart';

class NewTodoFormScreen extends StatelessWidget {
  const NewTodoFormScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: Text('New Todo'),
      ),
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
  final Todo newTodo = new Todo('', '', '', '');

  TimeOfDay _selectedTime;
  TextEditingController _controllerTime = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerTime.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controllerTime.text = TimeOfDay.now().format(context);
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
                helperText: 'Ex: Learn Flutter',
              ),
              validator: (value) {
                return value.isNotEmpty ? null : 'Title is required';
              },
              onSaved: (value) {
                newTodo.title = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                  helperText: 'Ex: Participate PTN Tech Talks'),
              onSaved: (value) {
                newTodo.description = value;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _controllerTime,
              onTap: () async {
                TimeOfDay result = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now());
                _selectedTime = result;
                _controllerTime.text = result.format(context);
                print(result);
              },
              onSaved: (value) {
                newTodo.time = value;
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
              height: 50,
              child: ElevatedButton(
                child: Text(
                  'Confirm',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save();
                    Navigator.pop(context, newTodo);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
