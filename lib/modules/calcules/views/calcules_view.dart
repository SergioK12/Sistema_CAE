import 'package:cae/modules/calcules/views/FR/funcion_renal.dart';
import 'package:cae/modules/calcules/views/IMC/indice_masa.dart';
import 'package:cae/modules/calcules/views/RC/riesgo_cardio.dart';
import 'package:cae/modules/calcules/views/VN/vacunes_ninios.dart';
import 'package:cae/modules/calcules/views/widgets/rectangleofcalculates.dart';
import 'package:flutter/material.dart';

class CalculosView extends StatelessWidget {
  const CalculosView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(children: [
        
        ItemBox(color: Colors.yellow, text: "IMC", icon: const Icon(Icons.boy_outlined), 
          ontap: () {
            Navigator.pushNamed(context, IMCView.routeName);
          },
        ),
        ItemBox(color: Colors.yellow, text: "Vacunes", icon: const Icon(Icons.vaccines_rounded), 
          ontap: () {
            Navigator.pushNamed(context, VacunasNiniosView.routeName);
          },
        ),
        ItemBox(color: Colors.yellow, text: "Funcion Renal", icon: const Icon(Icons.wifi_channel_outlined), 
          ontap: () {
            Navigator.pushNamed(context, FuncionRenalView.routeName);
          },
        ),
        ItemBox(color: Colors.yellow, text: "Riesgo Cardio", icon: const Icon(Icons.heart_broken_outlined), 
          ontap: () {
            Navigator.pushNamed(context, RiesgoCardiovascularView.routeName);
          },
        ),
       
       
      ]),
    );
  }
}
