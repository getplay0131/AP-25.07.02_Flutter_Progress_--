import 'package:buttton_and_navigation/screens/todo_list_screen.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  String category;
  String priority;

  AddTodoScreen({Key? key, required this.category, required this.priority})
    : super(key: key);

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final TextEditingController _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String userInput = _titleController.text;

    return Scaffold(
      body: Form(
        child: Column(
          children: [
            TextFormField(
              controller: _titleController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "할일을 입력해주세요!",
                labelText: "제목",
                border: OutlineInputBorder(),
              ),
            ),
            choiceCategory(
              category: widget.category,
              onPress: (changeCategory) {
                setState(() {
                  widget.category = changeCategory;
                });
                print(widget.category);
              },
            ),
            priorityBtn(
              priority: widget.priority,
              onPress: (newPriority) {
                setState(() {
                  widget.priority = newPriority;
                });
                print(widget.priority);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _titleController.dispose();
  }
}

class choiceCategory extends StatefulWidget {
  String category;

  final Function(String) onPress;
  choiceCategory({Key? key, required this.category, required this.onPress})
    : super(key: key);

  @override
  State<choiceCategory> createState() => _choiceCategoryState();
}

class _choiceCategoryState extends State<choiceCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(eccentricity: 0.8),
            disabledBackgroundColor: Colors.grey,
            backgroundColor: Colors.yellow,
          ),
          onPressed: () {
            print("아침 버튼 클릭 됨");
            setState(() {
              widget.onPress("아침");
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.bed),
              ),
              Text("아침"),
            ],
          ),
        ),
        SizedBox(width: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(eccentricity: 0.8),
            disabledBackgroundColor: Colors.grey,
            backgroundColor: Colors.deepOrange,
          ),
          onPressed: () {
            print("오후 버튼 클릭 됨");
            setState(() {
              widget.onPress("오후");
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.sunny),
              ),
              Text("오후"),
            ],
          ),
        ),
        SizedBox(width: 10),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            shape: CircleBorder(eccentricity: 0.8),
            disabledBackgroundColor: Colors.grey,
            backgroundColor: Colors.black26,
          ),
          onPressed: () {
            print("저녁");
            setState(() {
              widget.onPress("저녁");
            });
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.nightlight),
              ),
              Text("저녁"),
            ],
          ),
        ),
      ],
    );
  }
}

class priorityBtns extends StatefulWidget {
  const priorityBtns({super.key});

  @override
  State<priorityBtns> createState() => _priorityBtnsState();
}

class _priorityBtnsState extends State<priorityBtns> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(height: 10),
        ElevatedButton(
          style: ButtonStyle(shape: MaterialStateProperty.resolveWith()),
          onPressed: () {
            print("우선순위 높음 버튼 클릭 됨");
          },
          child: Text("우선순위 높음!"),
        ),
        SizedBox(width: 8),
        // ElevatedButton(),
        SizedBox(width: 8),

        // ElevatedButton(),
      ],
    );
  }
}

main() {
  runApp(
    MaterialApp(
      home: AddTodoScreen(category: "", priority: "높음"),
    ),
  );
}
