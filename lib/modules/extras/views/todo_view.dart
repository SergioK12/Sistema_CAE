import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(
            title: Text("Data numero: $index"),
            trailing: Checkbox(value: false, onChanged: (value) {}),
            onTap: () {
              debugPrint(index.toString());
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ));
  }
}
