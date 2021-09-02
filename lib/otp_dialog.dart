import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPDialog extends StatefulWidget {
  String title;
  String description;
  String resendCodeText;
  String buttonText;
  TextStyle titleStyle;
  TextStyle descriptionStyle;
  TextStyle resendCodeStyle;
  Color buttonColor;
  int codeLength;
  bool displayResendCodeText;
  Function? onResendCodePressed;
  bool displayButton;
  bool dismissable;
  Function? onButtonPressed;
  Function? onLastInputChanged;
  TextInputType inputType;

  OTPDialog(
      {required this.title,
      required this.description,
      this.resendCodeText = "",
      this.buttonText = "Confirmer",
      this.titleStyle = const TextStyle(fontWeight: FontWeight.bold),
      this.descriptionStyle = const TextStyle(),
      this.buttonColor = Colors.blue,
      this.resendCodeStyle = const TextStyle(),
      this.codeLength = 5,
      this.displayResendCodeText = true,
      this.displayButton = true,
      this.onResendCodePressed,
      this.onButtonPressed,
      this.dismissable = false,
      this.onLastInputChanged,
      this.inputType = TextInputType.number});

  @override
  _OTPDialogState createState() => _OTPDialogState();

  show(context) {
    return showDialog(
      context: context,
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
            SizedBox(
              height: 20,
            ),
            Container(
                width: 100,
                child: ElevatedButton(onPressed: () {}, child: Text("Verify"))),
            SizedBox(
              height: 20,
            ),
            this.widget.resendCodeText != null
                ? Text(this.widget.resendCodeText!,
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
      inputFields.add(Container(
          width: 40,
          height: 40,
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
          child: CupertinoTextField(
            textAlign: TextAlign.center,
          )));
    }
    return inputFields;
  }
}
