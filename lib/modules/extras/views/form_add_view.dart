

import 'package:cae/modules/extras/providers/task_provider.dart';
import 'package:cae/modules/settings/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FormAddTask extends StatelessWidget {
   const FormAddTask({super.key, required this.keyform});
   final Key keyform;
  @override
  Widget build(BuildContext context) {
    final taskprovider = Provider.of<TaskFormProvider>(context);
    final themeprovider = Provider.of<ThemeProvider>(context);
    return Form(
      key: keyform,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            style: themeprovider.temaactual.textTheme.titleSmall
            ,
            autofocus: true,
            validator: (value) {
              if (value.toString().isEmpty) {
                return "No puedes dejarlo vacio";
              }
              return null;
            },
            onChanged: (value) => taskprovider.setdescription(value),
          )
        ],
      ),
    );
  }
}

