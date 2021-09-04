import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OTPInputField extends StatelessWidget {
  const OTPInputField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: CupertinoTextField(
        decoration:
              BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
        textAlign: TextAlign.center,
      ),
    );
  }
}