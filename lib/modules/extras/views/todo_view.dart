import 'package:cae/generated/l10n.dart';
import 'package:cae/modules/extras/providers/task_provider.dart';
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
                                      id: DateTime.now()
                                          .microsecondsSinceEpoch
                                          .toString(),
                                      description: formprovider.getdescripcion,
                                      completed: false,
                                      date: "XD");
                                  if (formprovider.isValidForm() == true) {
                                    debugPrint("Ta bien");
                                    Navigator.pop(context);
                                    formprovider.guardarTask(latarea);
                                    setState(() {});
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
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.90,
              child: FutureBuilder(
                future: formprovider.getListTAsk(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Task> lis = snapshot.data as List<Task>;
                    if (lis.isEmpty) {
                      return const Center(
                          child: Text(
                        "Vacio",
                        style: TextStyle(color: Colors.black),
                      ));
                    } else {
                      return ListView.builder(
                        itemCount: lis.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            key: Key(lis[index].id),
                            background: Container(
                              color: Colors.red,
                              child: Row(
                                children: const [
                                  Padding(
                                      padding: EdgeInsets.only(left: 9),
                                      child: Text("Eliminar"))
                                ],
                              ),
                            ),
                            secondaryBackground: Container(
                                color: Colors.blue,
                                child: const Padding(
                                    padding: EdgeInsets.only(left: 9),
                                    child: Text("Terminar"))),
                            confirmDismiss: (direction) async {
                              var res = false;
                              if (direction == DismissDirection.startToEnd) {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: const Text(
                                        "¿Quieres borrar esta tarea?",
                                        style: TextStyle(color: Colors.black),
                                      ),
                                      actions: [
                                        Row(
                                          children: [
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.cancel,
                                                    color: Colors.red,
                                                  )),
                                            ),
                                            Expanded(
                                              child: IconButton(
                                                  onPressed: () {
                                                    formprovider.borrarTask(
                                                        lis[index].id);
                                                    res = false;
                                                    Navigator.pop(context);
                                                  },
                                                  icon: const Icon(
                                                    Icons.check,
                                                    color: Colors.blue,
                                                  )),
                                            )
                                          ],
                                        ),
                                      ],
                                    );
                                  },
                                );
                                setState(() {});
                                return res;
                              }

                              if (direction == DismissDirection.endToStart) {
                                formprovider.alternarBoleano( lis[index].id , lis[index].completed);
                                setState(() {});
                              }
                              return res;
                            },
                            child: ListTile(
                              title: 
                              (lis[index].completed == false)?
                              Text(lis[index].description.toString(),
                                  style: mystyle.textTheme.titleSmall)
                                  : 
                                  Text(lis[index].description.toString(),
                                  style: mystyle.textTheme.titleSmall!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: const Color(0xff000000)
                                  )),
                              trailing: Checkbox(
                                
                                value: lis[index].completed,
                                onChanged: (value) {
                                formprovider.alternarBoleano( lis[index].id , lis[index].completed);
                                setState(() {
                                  
                                });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } else {
                    return const Center(
                        child: Text(
                      "Vacio",
                      style: TextStyle(color: Colors.black),
                    ));
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
