import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var mainColor = Colors.red;

  changeTheme({color}) {
    mainColor = color;
    notifyListeners();
  }
}
