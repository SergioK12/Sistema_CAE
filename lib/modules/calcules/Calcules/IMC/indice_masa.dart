import 'package:cae/modules/calcules/Calcules/IMC/imc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class IMCView extends StatefulWidget {
  static String routeName = 'IndiceMasaCorporal';
  const IMCView({super.key});

  @override
  State<IMCView> createState() => _IMCViewState();
}

class _IMCViewState extends State<IMCView> {
  final RegExp _regex = RegExp(r'^\d{1,3}(\.\d{0,2})?$');
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final imcprovider = Provider.of<IMCProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Indice de masa corporal"),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Provider.of<IMCProvider>(context, listen: true).elcolor,
            width: double.infinity,
            child: Text('${imcprovider.getstatus()}\n ${imcprovider.getrest()}',
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
                    keyboardType: TextInputType.number,
                    style: const TextStyle(color: Colors.black),
                    onChanged: (value) {
                      imcprovider.setpeso(double.tryParse(value) ?? 0.0);
                      setState(() {
                        imcprovider.calcularimc();
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
                      value: imcprovider.getisInKG(),
                      onChanged: (value) {
                        imcprovider.setisinKG(value);
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
                    controller: _textEditingController,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    style: const TextStyle(color: Colors.black),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(_regex),
                    ],
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    onChanged: (valuex) {
                      final maches = _regex.allMatches(valuex);
                      if(maches.isEmpty){
                        _textEditingController.value = _textEditingController.value.copyWith(text: '',
                        selection: const TextSelection.collapsed(offset: 0),);
                      }
                      imcprovider.setAltura(double.tryParse(valuex) ?? 0.0);
                      setState(() {
                        imcprovider.calcularimc();
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
                      value: imcprovider.getisInCm(),
                      onChanged: (value) {
                        imcprovider.setisinCm(value);
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
