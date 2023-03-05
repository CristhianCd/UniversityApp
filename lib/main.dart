import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tarea/handler.dart';
import 'package:tarea/pages/todo.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'model.dart';

void main() => runApp(TabPage());

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);


  @override
  _TabPageState createState() => _TabPageState();

}

class _TabPageState extends State<TabPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const Center(
      child: WebView(
        initialUrl: "http://34.95.139.153:8080",
        javascriptMode: JavascriptMode.unrestricted,
      )),
    const MaterialApp(
      home: ToDoPage()
    ),
    const Center(
      child: Text('Hola')
    )
  ];

  DBHelper? dbHelper;
  late Future<List<TodoModel>> dataList;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();
    loadData();
  }

  loadData() async {
    dataList = dbHelper!.getDataList();
  }

  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(15.0),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
        backgroundColor: Colors.grey[200],
        body: pages[selectedIndex],
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: GNav(
                  backgroundColor: Colors.black12,
                  color: Colors.white,
                  activeColor: Colors.white,
                  tabBackgroundColor: Colors.grey[900]!,
                  gap: 10,
                  padding: const EdgeInsets.all(16),
                  onTabChange: (index) {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  tabs: const [
                    GButton(icon: Icons.archive_sharp, text: 'Archivos'),
                    GButton(icon: Icons.list_alt, text: 'Tareas'),
                    GButton(icon: Icons.help_center, text: 'Otros')
                  ]),
            ),
          )),
    );
  }

  changeScreen(int index) {
    final List<Widget> pages = [
      const Center(
        child: Text('Hello', style: TextStyle(fontSize: 50)),
      ),
      const Center(child: Text('Second', style: TextStyle(fontSize: 50)))
    ];
  }
}
