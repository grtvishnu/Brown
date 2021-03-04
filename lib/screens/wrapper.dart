import 'package:airweather/models/user.dart';
import 'package:airweather/screens/authenticate/authenticate.dart';
import 'package:airweather/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // return either home or authenticate widgets
    if (user == null){
      return Authenticate();
    }else{
      return Home();
    }
  }
}
