import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_dialog/resources/constants.dart';

class OTPInputField extends StatelessWidget {
  final BoxDecoration? inputDecoration;

  OTPInputField({this.inputDecoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CupertinoTextField(
        decoration: this.inputDecoration == null
            ? DEFAULT_INPUT_DECORATION
            : this.inputDecoration,
        textAlign: TextAlign.center,
      ),
    );
  }
}
