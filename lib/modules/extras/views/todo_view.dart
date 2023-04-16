import 'package:cae/generated/l10n.dart';
import 'package:cae/modules/extras/providers/task_provider.dart';
import 'package:cae/modules/extras/services/hive_service.dart';
import 'package:cae/modules/extras/views/form_add_view.dart';
import 'package:cae/modules/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';

class TodoView extends StatefulWidget {
  const TodoView({super.key});

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  @override
  Widget build(BuildContext context) {
    final mystyle = Provider.of<ThemeProvider>(context).temaactual;
    final formprovider = Provider.of<TaskFormProvider>(context);

    final hive = HiveDB();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Provider.of<ThemeProvider>(context)
                  .temaactual
                  .primaryColorDark,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.10,
              child: TextButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Agregar tarea",
                            style: mystyle.textTheme.titleSmall,
                          ),
                          content: FormAddTask(keyform: formprovider.formkey),
                          actions: [
                            TextButton(
                                onPressed: () {
                                  final latarea = Task(
                                      description: formprovider.getdescripcion,
                                      completed: false,
                                      date: "XD");
                                  if (formprovider.isValidForm() == true) {
                                    debugPrint("Ta bien");
                                    Navigator.pop(context);
                                    hive.guardarTask(latarea);
                                    setState(() {
                                    });
                                  }
                                },
                                child: const Text("Aceptar")),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text(
                    S.current.Add.toString(),
                    style: mystyle.textTheme.titleSmall,
                  )),
            ),
            Container(
              color: Colors.red,
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.90,
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
    );
  }
}
