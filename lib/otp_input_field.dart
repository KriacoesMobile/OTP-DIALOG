import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_dialog/resources/constants.dart';
import 'package:otp_dialog/resources/dimens.dart';

class OTPInputField extends StatelessWidget {
  final BoxDecoration? inputDecoration;
  final bool obscureText;
  final Function(String)? onChange;
  final TextStyle textStyle;
  final TextEditingController textController;
  final FocusNode focusNode;

  OTPInputField(
      {required this.textController,
      required this.focusNode,
      this.inputDecoration,
      this.obscureText = false,
      this.textStyle = const TextStyle(),
      this.onChange});

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();
    return Container(
      width: MediaQuery.of(context).size.width * INPUT_SIZE,
      height: MediaQuery.of(context).size.width * INPUT_SIZE,
      child: CupertinoTextField(
        obscureText: this.obscureText,
        focusNode: this.focusNode,
        controller: textEditingController,
        decoration: this.inputDecoration == null
            ? DEFAULT_INPUT_DECORATION
            : this.inputDecoration,
        textAlign: TextAlign.center,
        onChanged: (value) {
          if (value.length > MAX_TEXT_LENGTH) {
            textEditingController.text = value.substring(0, 1);
          }
          this.onChange?.call(textEditingController.text);
        },
      ),
    );
  }
}
