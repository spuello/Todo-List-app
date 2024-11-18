import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/features/todo/presentation/todo_bloc.dart';

class TodoListScreen extends StatefulWidget {
  static const String routeName = 'todo_list_screen';

  const TodoListScreen();

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<String> _todoList = <String>[];
  final TextEditingController _textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('To-Do List'),
        ),
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            print(state);
            if (state is TodoLoaded) {
              return ListView.builder(
                itemCount: state.todos.length,
                itemBuilder: (BuildContext context, int index) {
                  final todo = state.todos[index];

                  return Dismissible(
                      key: Key(todo.id),
                      onDismissed: (direction) {
                        print("removeing aitem");
                      },
                      child: ListTile(title: Text(todo.content)));
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _displayDialog(() {
            context.read<TodoBloc>().add(AddTodo(_textFieldController.text));
            _textFieldController.clear();
          }),
          tooltip: 'Add Item',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  //Generate a single item widget
  Future<Future> _displayDialog(VoidCallback onAdded) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add a task to your List'),
            content: TextField(
              controller: _textFieldController,
              decoration: const InputDecoration(hintText: 'Enter task here'),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('ADD'),
                onPressed: () {
                  Navigator.of(context).pop();
                  onAdded();
                },
              ),
              TextButton(
                child: const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
