import 'package:cae/modules/calcules/Calcules/IMC/imc_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IMCView extends StatefulWidget {
  static String routeName = 'IndiceMasaCorporal';
  const IMCView({super.key});

  @override
  State<IMCView> createState() => _IMCViewState();
}

class _IMCViewState extends State<IMCView> {
  @override
  Widget build(BuildContext context) {
    final imcprovider = Provider.of<IMCProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indice de masa corporal"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.yellow,
            width: double.infinity,
            child: Text(imcprovider.getpeso()+ imcprovider.getAltura(),
                textAlign: TextAlign.center),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text("Peso"),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      setState(() {
                      Provider.of<IMCProvider>(context, listen: false).peso = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Libras"),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {
                        debugPrint(value.toString());
                      },
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text("KG")),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text("Altura"),
                ),
                Expanded(
                  flex: 2,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    
                    style: const TextStyle(color: Colors.black),
                    decoration: const InputDecoration(
                      
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onChanged: (value) {
                      setState(() {
                      Provider.of<IMCProvider>(context, listen: false).altura = value;
                      });
                    },
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text("Metros"),
                    ),
                    Switch(
                      value: true,
                      onChanged: (value) {
                        debugPrint(value.toString());
                      },
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text("CM")),
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
