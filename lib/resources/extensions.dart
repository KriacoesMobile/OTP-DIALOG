import 'package:flutter/cupertino.dart';

extension ExtOnTextStyle on TextStyle {
  TextStyle clone(double size) {
    return TextStyle(
        fontWeight: this.fontWeight,
        fontSize: size,
        decoration: this.decoration);
  }
}
