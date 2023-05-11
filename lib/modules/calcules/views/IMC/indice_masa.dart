import 'package:flutter/material.dart';

class IMCView extends StatelessWidget {
  static String routeName = 'IndiceMasaCorporal';
  const IMCView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indice de masa corporal"),
      ),
      body: Column(
        children: [
          Container(
            padding: const  EdgeInsets.all(20),
            color: Colors.yellow,
            width: double.infinity,
            child: const Text("Calcular", textAlign: TextAlign.center),
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child:  TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))
                )
              ),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20),
            child:  TextField(),
          ),
          

        ],

      ),
    );
  }
}
