import 'package:flutter/material.dart';

class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}

class _TodoAppState extends State<TodoApp> {
  TextEditingController studentNameController = TextEditingController();
  List studentName = ["Hussain", "khiyam"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: TextFormField(controller: studentNameController)),
      body:
          studentName.isEmpty
              ? Center(
                child: Text(
                  'No Student is Registerd Yet!',
                  style: TextStyle(fontSize: 21),
                ),
              )
              : ListView.builder(
                itemCount: studentName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      tileColor: Colors.amber,
                      title: Text(
                        "${studentName[index]}",
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          studentName.removeAt(index);
                          setState(() {});
                        },
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          studentName.add(studentNameController.text);
          studentNameController.clear();
          setState(() {});
        },
        child: Text("Add"),
      ),
    );
  }
}
