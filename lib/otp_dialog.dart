import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_dialog/otp_input_field.dart';
import 'package:otp_dialog/resources/constants.dart';
import 'package:otp_dialog/resources/dimens.dart';
import 'package:otp_dialog/resources/extensions.dart';

class OTPDialog extends StatefulWidget {
  final String title;
  final String description;
  final String resendCodeText;
  final String buttonText;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;
  final TextStyle? resendCodeStyle;
  final Color buttonColor;
  final int codeLength;
  final bool displayResendCodeText;
  final Function? onResendCodePressed;
  final bool displayButton;
  final bool dismissable;
  final Function? onButtonPressed;
  final Function? onLastInputChanged;
  final TextInputType inputType;
  final Color? barrierColor;
  final bool obscureText;
  final BoxDecoration? inputDecoration;
  final double? height;
  final double? buttonSize;

  OTPDialog(
      {required this.title,
      required this.description,
      this.resendCodeText = RESEND_CODE_DEFAULT_LABEL,
      this.buttonText = DEFAULT_BUTTON_LABEL,
      this.titleStyle,
      this.descriptionStyle,
      this.buttonColor = Colors.blue,
      this.resendCodeStyle,
      this.codeLength = DEFAULT_OTP_LENGTH,
      this.displayResendCodeText = true,
      this.displayButton = true,
      this.onResendCodePressed,
      this.onButtonPressed,
      this.dismissable = false,
      this.onLastInputChanged,
      this.inputType = TextInputType.number,
      this.barrierColor = Colors.transparent,
      this.obscureText = false,
      this.inputDecoration,
      this.height,
      this.buttonSize});

  @override
  _OTPDialogState createState() => _OTPDialogState();

  show(context) {
    return showDialog(
      context: context,
      barrierDismissible: this.dismissable,
      barrierColor: this.barrierColor,
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
  List<TextEditingController> textControllers = [];
  List<FocusNode> listFocusNode = [];

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < this.widget.codeLength; i++) {
      textControllers.add(TextEditingController());
      listFocusNode.add(FocusNode());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.widget.height == null
          ? MediaQuery.of(context).size.height * DEFAULT_HEIGHT_SIZE
          : this.widget.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              this.widget.title,
              style: this.widget.titleStyle == null
                  ? DEFAULT_TITLE_STYLE
                      .clone(MediaQuery.of(context).size.width * 0.04)
                  : this.widget.titleStyle,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * PADDING_10,
            ),
            Text(this.widget.description,
                textAlign: TextAlign.center,
                style: this.widget.descriptionStyle == null
                    ? DEFAULT_DESCRIPTION_STYLE
                        .clone(MediaQuery.of(context).size.width * 0.025)
                    : this.widget.descriptionStyle),
            SizedBox(
              height: MediaQuery.of(context).size.height * PADDING_20,
            ),
            Container(
              height: MediaQuery.of(context).size.width * INPUT_SIZE,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _renderOTPInputFields(),
              ),
            ),
            Visibility(
              visible: this.widget.displayButton,
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * PADDING_20,
                  ),
                  Container(
                      width: this.widget.buttonSize == null
                          ? MediaQuery.of(context).size.width * BUTTON_SIZE
                          : this.widget.buttonSize,
                      height: MediaQuery.of(context).size.height * BUTTON_HEIGHT,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Text(this.widget.buttonText, style: DEFAULT_DESCRIPTION_STYLE
                        .clone(MediaQuery.of(context).size.width * 0.022),))),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * PADDING_20,
            ),
            this.widget.displayResendCodeText
                ? Text(this.widget.resendCodeText,
                    style: this.widget.descriptionStyle == null
                        ? DEFAULT_TEXT_STYLE
                            .clone(MediaQuery.of(context).size.width * 0.025)
                        : this.widget.descriptionStyle)
                : Container()
          ],
        ),
      ),
    );
  }

  _renderOTPInputFields() {
    List<Widget> inputFields = [];
    for (var index = 0; index < this.widget.codeLength; index++) {
      if (index != 0) {
        inputFields.add(SizedBox(
          width: MediaQuery.of(context).size.width * PADDING_20,
        ));
      }
      inputFields.add(OTPInputField(
        inputDecoration: this.widget.inputDecoration,
        obscureText: this.widget.obscureText,
        textController: textControllers[index],
        focusNode: listFocusNode[index],
        onChange: (value) {
          if (value.isEmpty) {
            if (index > 0) {
              listFocusNode[index - 1].requestFocus();
            }
          } else {
            if (index < this.widget.codeLength - 1) {
              listFocusNode[index + 1].requestFocus();
            }
          }
        },
      ));
    }
    return inputFields;
  }
}
