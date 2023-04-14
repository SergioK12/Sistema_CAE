import 'package:cae/generated/l10n.dart';
import 'package:cae/modules/extras/services/hive_service.dart';
import 'package:cae/modules/extras/views/form_add_view.dart';
import 'package:cae/modules/extras/views/test.dart';
import 'package:cae/modules/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/task_model.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    final mystyle = Provider.of<ThemeProvider>(context).temaactual;

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
                   showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom / 3,
                    ),
                    child: const FormAddTask()
                    ),
                  
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
