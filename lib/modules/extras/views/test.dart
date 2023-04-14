import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ejemplo'),
      ),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: ElevatedButton(
          child: Text('Mostrar BottomSheet'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (BuildContext context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Column(
                      children: [
                        // Contenido del BottomSheet
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
