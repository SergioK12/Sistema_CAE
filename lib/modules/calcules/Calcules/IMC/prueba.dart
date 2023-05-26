import 'package:flutter/services.dart';

class MyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String data = newValue.text;
    StringBuffer buffer = StringBuffer();

    for (int i = 0; i < data.length; i++) {
      buffer.write(data[i]);
      int index = i + 1;
      if (index == 1 && data.length != index) {
        buffer.write(".");
      }
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}
