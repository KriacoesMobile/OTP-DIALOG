import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_dialog/resources/constants.dart';
import 'package:otp_dialog/resources/dimens.dart';

class OTPInputField extends StatelessWidget {

  final BoxDecoration? inputDecoration;
  final bool obscureText;

  OTPInputField({this.inputDecoration, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * INPUT_SIZE,
      height: MediaQuery.of(context).size.width * INPUT_SIZE,
      child: CupertinoTextField(
        obscureText: this.obscureText,
        decoration: this.inputDecoration == null
            ? DEFAULT_INPUT_DECORATION
            : this.inputDecoration,
        textAlign: TextAlign.center,
      ),
    );
  }
}
