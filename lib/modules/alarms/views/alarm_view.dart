import 'package:flutter/material.dart';
import 'package:flutter_alarm_clock/flutter_alarm_clock.dart';

class AlarmsView extends StatefulWidget {
  const AlarmsView({super.key});

  @override
  State<AlarmsView> createState() => _AlarmsViewState();
}

class _AlarmsViewState extends State<AlarmsView> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: (){
              FlutterAlarmClock.createAlarm(20, 16);

            }, 
            child: const Text("Presiona"))
        ],
      ),
    );
  }
}