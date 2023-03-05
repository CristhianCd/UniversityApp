import 'package:flutter/material.dart';
import 'package:tarea/pages/addTask.dart';
import '../items/todo_items.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({Key? key}) : super(key: key);

  @override
  ToDoPageState createState() => ToDoPageState();
}

class ToDoPageState extends State<ToDoPage> {
  List<ToDoItems> itemsList = [];
  final _controller = TextEditingController();


  void addItem() {
    setState(() {
      itemsList.add(ToDoItems(taskName: _controller.text, imagePath: "images/other.png"));
      _controller.clear();
    });
  }

  void createTask() {
    setState(() {
      showDialog(
          context: context,
          builder: (context) {
            return AddTaskDialog(controller: _controller, onAdd: addItem);
          });
    });
  }

  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        autofocus: false,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              prefixIcon: const Icon(Icons.search,
                  color: Colors.black, size: 20),
              prefixIconConstraints:
              const BoxConstraints(maxHeight: 20, minWidth: 25),
              border: InputBorder.none,
              hintText: 'Buscar',
              hintStyle: TextStyle(color: Colors.grey[900]))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            Padding(padding: const EdgeInsets.only(top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: MediaQuery.of(context).size.width/10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )
                  ),
                  icon: const Icon(Icons.pending_actions),
                  label: const Text('Pendiente'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[900],
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: MediaQuery.of(context).size.width/10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35),
                      )
                  ),
                  icon: const Icon(Icons.lock_clock),
                  label: const Text('Terminado'),
                )
              ],
            )),
            Expanded(
                child: ListView(children: itemsList)
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: createTask,
          label: const Text('Agregar Tarea'),
          icon: const Icon(Icons.add_task),
        backgroundColor: Colors.grey[900],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
    );
  }
}
