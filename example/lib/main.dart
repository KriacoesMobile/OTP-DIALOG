import 'package:flutter/material.dart';
import 'package:otp_dialog/otp_dialog.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(body: TestApp()),
    );
  }
}

class TestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            OTPDialog(
              title: "Code verification",
              description: "Enter the code that you received on your phone",
            ).show(context);
          },
          child: Text("Click"),
        ),
      ),
    );
  }
}
