import 'package:flutter/cupertino.dart';
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
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Authentification doube facteur",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                textAlign: TextAlign.center),
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
            Text("Renvoyer le code",style: TextStyle(
              decoration: TextDecoration.underline
            ),)
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
      inputFields
          .add(Container(width: 40, height: 40, decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey
            )
          ),child: CupertinoTextField()));
    }
    return inputFields;
  }
}
