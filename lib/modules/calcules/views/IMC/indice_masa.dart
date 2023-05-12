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
          
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children:  [
                 const Padding(
                   padding:  EdgeInsets.only(right: 20),
                   child: Text("Peso"),
                 ),
                 const Expanded(
                  flex: 2,
                   child: TextField(
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20))
                       ),
                     ),
                   ),
                 ),
                 Row(
                   children: [
                    const Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child:  Text("Libras"),
                    ),
                     Switch(value: true,
                      onChanged: (value) {
                       debugPrint(value.toString());
                     }, ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, ),
                      child:  Text("KG")),

                   ],
                 ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children:  [
                 const Padding(
                   padding:  EdgeInsets.only(right: 20),
                   child: Text("Altura"),
                 ),
                 const Expanded(
                  flex: 2,
                   child: TextField(
                     decoration: InputDecoration(
                       border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(20))
                       ),
                     ),
                   ),
                 ),
                 Row(
                   children: [
                    const Padding(
                      padding:  EdgeInsets.only(left: 20),
                      child:  Text("Metros"),
                    ),
                     Switch(value: true,
                      onChanged: (value) {
                       debugPrint(value.toString());
                     }, ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20, ),
                      child:  Text("CM")),

                   ],
                 ),
              ],
            ),
          ),

        ],

      ),
    );
  }
}
