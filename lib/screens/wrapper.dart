import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secure/models/user.dart';
import 'package:secure/screens/home/home.dart';
import 'package:secure/screens/authenticate/authenticate.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    // Return either Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home(); //Home();
    }
  }
}
