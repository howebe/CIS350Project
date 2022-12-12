import 'package:flutter/material.dart';

/*
Constant used to decorate all input boxes
from the user. Shortens UI design code.
*/

const textInputDecoration = InputDecoration(
fillColor: Colors.white,
filled: true,
enabledBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.blue, width: 2.0)),
focusedBorder: OutlineInputBorder(
borderSide: BorderSide(color: Colors.black, width: 2.0)),
);

