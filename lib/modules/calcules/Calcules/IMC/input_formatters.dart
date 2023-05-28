import 'package:flutter/services.dart';

class DecimalFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String data = newValue.text;
    StringBuffer buffer = StringBuffer();

    if (data.isEmpty) {
      buffer.write(data);
    } else if (data.length == 1) {
      if (oldValue.text.contains('.')) {
        buffer.clear();
        return newValue;
      }
      data = '$data.';
      buffer.write(data);
    } else if (data.length <= 4) {
      buffer.write(data);
    } else {
      buffer.write(oldValue.text);
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}

class DigitsonlyAndlimit extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    String data = newValue.text;
    StringBuffer buffer = StringBuffer();

    if (data.length <= 3) {
      if (data.contains('.')) {
        data = data.replaceAll('.', '');
      }
      buffer.write(data);
    } else {
      buffer.write(oldValue.text);
    }

    return TextEditingValue(
        text: buffer.toString(),
        selection: TextSelection.collapsed(offset: buffer.toString().length));
  }
}
