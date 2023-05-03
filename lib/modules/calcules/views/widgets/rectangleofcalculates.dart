import 'package:flutter/material.dart';
class ItemBox extends StatelessWidget {
  final Color color;
  final String text;
  final Icon icon;
  final VoidCallback ontap;
  const ItemBox(
      {super.key, required this.color, required this.text, required this.icon, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: color,
          child: Column(
            children: [
              icon,
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
