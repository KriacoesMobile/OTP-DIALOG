import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const String RESEND_CODE_DEFAULT_LABEL = "Resend the code";
const String DEFAULT_BUTTON_LABEL = "Confirmer";

const int DEFAULT_OTP_LENGTH = 5;

final BoxDecoration DEFAULT_INPUT_DECORATION = BoxDecoration(
    border: Border.all(width: .5, color: Colors.lightBlue),
    borderRadius: BorderRadius.circular(5));

const int MAX_TEXT_LENGTH = 1;

const TextStyle DEFAULT_TITLE_STYLE =
    const TextStyle(fontWeight: FontWeight.bold);
const TextStyle DEFAULT_DESCRIPTION_STYLE = const TextStyle();
const TextStyle DEFAULT_TEXT_STYLE =
    const TextStyle(decoration: TextDecoration.underline);
