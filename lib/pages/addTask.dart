import 'package:flutter/material.dart';

class AddTaskDialog extends StatefulWidget {
  final controller;
  VoidCallback onAdd;

  AddTaskDialog({super.key, required this.controller, required this.onAdd});

  @override
  _AddTaskDialogState createState() => _AddTaskDialogState(controller, onAdd);

}

class _AddTaskDialogState extends State<AddTaskDialog> {
  late final controller;
  late VoidCallback onAdd;

  _AddTaskDialogState(this.controller, this.onAdd);

  @override
  Widget build(BuildContext context) {
    return _AllDialog(controller, onAdd);
  }
}

class _AllDialog extends StatefulWidget {
  late final controller;
  late VoidCallback onAdd;

  _AllDialog(this.controller, this.onAdd);

  @override
  _AllDialogState createState() => _AllDialogState(controller, onAdd);
}

class _AllDialogState extends State<_AllDialog> {
  late final controller;
  late VoidCallback onAdd;

  _AllDialogState(this.controller, this.onAdd);

  List<String> courses = [
    "Mat. Discreta",
    "Geometría A.",
    "Filosofía       ",
    "Intro. a la Ing.",
    "Ciudad. Inter.",
    "Metódos Est.",
    "Accesibilidad",
    "Lenguaje      ",
    "Actividades   ",
    "Otras tareas "];

  List<String> imagesPaths = [
    "images/mate.png",
    "images/geometry.png",
    "images/filo.png",
    "images/intro.png",
    "images/ciudad.png",
    "images/metods.png",
    "images/diseño.png",
    "images/lenguaje.png",
    "images/fut.png",
    "images/other.png"];

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      backgroundColor: Colors.white,
      content: Container(
        height: 600,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.add_alarm_outlined,
                          color: Colors.black, size: 20),
                      hintText: 'Título',
                      hintStyle:
                      const TextStyle(color: Colors.black, fontSize: 14),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Padding(
                        padding: EdgeInsets.only(bottom: 40),
                        child: Icon(Icons.add_alarm_outlined,
                            color: Colors.black, size: 20)
                    ),
                    hintText: 'Descripción',
                    hintStyle:
                    const TextStyle(color: Colors.black, fontSize: 14),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
                maxLines: 3,
              ),
            ),
            Wrap(
              // direction: Axis.horizontal,
              children: List.generate(10, (index) {
                return InkWell(
                    onTap: () {},
                    child: Container(
                        width: 131,
                        margin: const EdgeInsets.only(right: 10, bottom: 10),
                        child: ElevatedButton.icon(
                            onPressed: () {
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: selectedIndex==index?Colors.grey[900]: Colors.grey[600],
                                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                            icon: Image.asset(imagesPaths[index], width: 15, alignment: Alignment.topLeft),
                            label: Text(courses[index])
                        )
                    )
                );
              }),
            ),
            Wrap(
              direction: Axis.horizontal,
              children: [
                Container(
                  width: 131,
                  margin: const EdgeInsets.only(right: 10, bottom: 10, top: 13),
                  child: ElevatedButton.icon(
                    onPressed: (){
                      // Navigator.pop(context);
                    },
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancelar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red[400],
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                ),
                Container(
                  width: 131,
                  margin: const EdgeInsets.only(right: 10, bottom: 10, top: 13),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      onAdd();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.add_circle),
                    label: const Text('Agregar'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[400],
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


