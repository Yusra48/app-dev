import 'package:flutter/material.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  var todoController = TextEditingController();
  List<String> todoList = [];
  bool isAdd = true;
  int selectedIndex = 0;

  addTodo() {
    todoList.add(todoController.text);
    todoController.clear();
    setState(() {});
  }

  editTodoSave() {
    todoList[selectedIndex] = todoController.text;
    todoController.clear();
    isAdd = true;
    setState(() {});
  }

  showValue(index) {
    todoController.text = todoList[index];
    isAdd = false;
    selectedIndex = index;
    setState(() {});
  }

  deleteTodo(index) {
    setState(() {});
    todoList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: TextField(
          controller: todoController,
          obscureText: false,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'type todo.....',
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              isAdd ? addTodo() : editTodoSave();
            },
            icon: const Icon(Icons.check),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: Colors.white,
            title: Text(todoList[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showValue(index);
                    }),
                IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      deleteTodo(index);
                    }),
              ],
            ),
          );
        },
      ),
    );
  }
}
