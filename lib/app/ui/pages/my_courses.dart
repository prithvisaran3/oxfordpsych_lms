import 'package:deviraj_lms/app/provider/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (context, provider, child) {
          return MaterialApp(

          );
        },
      ),
    );
  }
}
