import 'package:flutter/material.dart';
import 'package:buttton_and_navigation/models/todo.dart';

class TodoListScreen extends StatefulWidget {
  final List<Todo> todos;
  const TodoListScreen({Key? key, this.todos = const []}) : super(key: key);

  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  late List<Todo> todos;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todos = List.from(widget.todos);
  }

  void addTodo(Todo todo) {
    setState(() {
      widget.todos.add(todo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "todos!",
          style: TextStyle(color: Colors.black12, fontSize: 20),
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int idx) {
          final todo = widget.todos[idx];
          return Card(
            child: Column(
              children: [
                Text(todo.title),
                Text(todo.category),
                Text(todo.priority),
                CompletedToggle(
                  isCompleted: todo.isCompleted,
                  onToggle: () {
                    setState(() {
                      todo.isCompleted = !todo.isCompleted;
                    });
                  },
                ),
              ],
            ),
          );
        },
        itemCount: widget.todos.length,
      ),
    );
  }
}

class CompletedToggle extends StatefulWidget {
  final bool isCompleted;
  final VoidCallback onToggle;

  CompletedToggle({Key? key, required this.isCompleted, required this.onToggle})
    : super(key: key);

  @override
  State<CompletedToggle> createState() => _completedToggleState();
}

class _completedToggleState extends State<CompletedToggle> {
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        print("완료 상태 변경!");
      },
      child: widget.isCompleted == true ? Icon(Icons.check) : Icon(Icons.close),
      style: OutlinedButton.styleFrom(
        elevation: 5,
        // elevation: MaterialStateProperty.all(5.0),
        padding: EdgeInsets.all(10),
        backgroundColor: widget.isCompleted == true ? Colors.blue : Colors.red,
        foregroundColor: widget.isCompleted == true
            ? Colors.black
            : Colors.green,
      ),
    );
  }
}

class priorityButton extends StatefulWidget {
  String priority;
  priorityButton({super.key, required this.priority});

  @override
  State<priorityButton> createState() => _priorityButtonState();
}

class _priorityButtonState extends State<priorityButton> {
  final String top = "top";

  final String medium = "medium";

  final String low = "low";

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                widget.priority = top;
              });
            },
            child: Text(data),
          ),
        ],
      ),
    );
  }
}
