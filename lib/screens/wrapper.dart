import 'package:airweather/screens/authenticate/authenticate.dart';
import 'package:airweather/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either home or authenticate widgets
    return Authenticate();
  }
}
