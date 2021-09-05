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
    TextEditingController textEditingController = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width * INPUT_SIZE,
      height: MediaQuery.of(context).size.width * INPUT_SIZE,
      child: CupertinoTextField(
        obscureText: this.obscureText,
        controller: textEditingController,
        decoration: this.inputDecoration == null
            ? DEFAULT_INPUT_DECORATION
            : this.inputDecoration,
        textAlign: TextAlign.center,
        onChanged: (value){
          if(value.length > MAX_TEXT_LENGTH){
            textEditingController.text = value.substring(0,1);
          }
        },
      ),
    );
  }
}
