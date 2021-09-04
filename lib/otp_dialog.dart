import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_dialog/otp_input_field.dart';
import 'package:otp_dialog/resources/constants.dart';

class OTPDialog extends StatefulWidget {
  final String title;
  final String description;
  final String resendCodeText;
  final String buttonText;
  final TextStyle titleStyle;
  final TextStyle descriptionStyle;
  final TextStyle resendCodeStyle;
  final Color buttonColor;
  final int codeLength;
  final bool displayResendCodeText;
  final Function? onResendCodePressed;
  final bool displayButton;
  final bool dismissable;
  final Function? onButtonPressed;
  final Function? onLastInputChanged;
  final TextInputType inputType;
  final Color barrierColor;
  final bool obscureText;

  OTPDialog(
      {required this.title,
      required this.description,
      this.resendCodeText = RESEND_CODE_DEFAULT_LABEL,
      this.buttonText = DEFAULT_BUTTON_LABEL,
      this.titleStyle = const TextStyle(fontWeight: FontWeight.bold),
      this.descriptionStyle = const TextStyle(),
      this.buttonColor = Colors.blue,
      this.resendCodeStyle = const TextStyle(),
      this.codeLength = DEFAULT_OTP_LENGTH,
      this.displayResendCodeText = true,
      this.displayButton = true,
      this.onResendCodePressed,
      this.onButtonPressed,
      this.dismissable = false,
      this.onLastInputChanged,
      this.inputType = TextInputType.number,
      this.barrierColor = Colors.transparent,
      this.obscureText = false});

  @override
  _OTPDialogState createState() => _OTPDialogState();

  show(context) {
    return showDialog(
      context: context,
      barrierDismissible: this.dismissable,
      builder: (context) {
        return AlertDialog(
          content: this,
          contentPadding: EdgeInsets.all(0),
        );
      },
    );
  }
}

class _OTPDialogState extends State<OTPDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.widget.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(this.widget.description, textAlign: TextAlign.center),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _renderOTPInputFields(5),
            ),
            Visibility(
              visible: this.widget.displayButton,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 100,
                      child: ElevatedButton(
                          onPressed: () {}, child: Text("Verify"))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            this.widget.displayResendCodeText
                ? Text(this.widget.resendCodeText,
                    style: TextStyle(decoration: TextDecoration.underline))
                : Container()
          ],
        ),
      ),
    );
  }

  _renderOTPInputFields(int inputFieldsCount) {
    List<Widget> inputFields = [];
    for (var i = 0; i < inputFieldsCount; i++) {
      if (i != 0) {
        inputFields.add(SizedBox(
          width: 10,
        ));
      }
      inputFields.add(OTPInputField());
    }
    return inputFields;
  }
}
