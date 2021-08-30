import 'package:flutter/material.dart';

class OTPDialog extends StatefulWidget {
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
      height: 250,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}
