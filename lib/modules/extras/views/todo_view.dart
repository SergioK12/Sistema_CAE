import 'package:cae/modules/extras/services/hive_service.dart';
import 'package:cae/modules/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final hive = HiveDB();

    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Provider.of<ThemeProvider>(context).temaactual.primaryColor,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.11,
                child:
                    TextButton(onPressed: () {},
                     child: const Text("Agregar")),
              ),
              Container(
                color: Colors.red,
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.89,
                child: FutureBuilder(
                  future: hive.getListTAsk(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Task> lis = snapshot.data as List<Task>;
                      return ListView.builder(
                        itemCount: lis.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            title: Text(lis[index].description.toString()),
                            trailing: Checkbox(
                              value: lis[index].completed,
                              onChanged: (value) => !value!,
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("Vacio"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              onPressed: () {
                Task untask =
                    Task(description: "Prueba", completed: true, date: "123");
                HiveDB().guardarTask(untask);
              },
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: ()  {
                
              },
              child: const Icon(Icons.precision_manufacturing_outlined),
            ),
          ],
        ));
  }
}
