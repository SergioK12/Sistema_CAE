import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

class PresionArterial extends StatefulWidget {
  const PresionArterial({super.key});

  @override
  State<PresionArterial> createState() => _PresionArterialState();
}

class _PresionArterialState extends State<PresionArterial> {
  double pad = 0.0;
  double pas = 0.0;
  double resultado = 0.00;
  

  final myControllerPAS = TextEditingController();
  final myControllerPAD = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true, title: const Text("Presion arterial")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children:  [
                const Text("Presion Arterial Sistólica PAS:    ",
                 style: TextStyle(fontSize: 18),
                 ),
                     Expanded(
                     child: TextField(
                      controller: myControllerPAS,
                      textAlign: TextAlign.center,
                      onChanged: (value) {
                      setState(() {
                      pas = double.tryParse(myControllerPAS.text) ?? 0.00;
                      resultado = calcular(pas, pad);
                    });
                  }))
                
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children:  [
                const Text("Presion Arterial Diastólica PAD:  ",
                style: TextStyle(fontSize: 18),
                ),
                Expanded(
                    child: TextField(
                      controller: myControllerPAD,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                    setState(() {
                       pad = double.tryParse(myControllerPAD.text) ?? 0.00;
                       resultado = calcular(pas, pad);
                    });
                  }
                )),
              ],
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(25) 
                      ),
                        
                        child:  Text(
                          "$resultado",
                          style: const TextStyle(fontSize: 30),
                          textAlign: TextAlign.center,
                          
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
  
  double calcular(double pas, double pad) {
     double val = 0.0;
     double eldo = pad * 2;

    val = (pas + eldo)/3;
    print(val);

    return val;
  }
}
