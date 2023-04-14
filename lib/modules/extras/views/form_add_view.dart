import 'package:flutter/material.dart';

class FormAddTask extends StatelessWidget {
  const FormAddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.1),
      height: MediaQuery.of(context).size.height * 0.4,
      margin: const EdgeInsets.all(9),
      //color: Colors.grey,
      child: Column(
        children: [
          const TextField(
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          InkWell(
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: const Text("Guardar"),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
