import 'package:flutter/material.dart';
import 'package:jaesysz_recipe_app/screens/screens.dart';
import 'package:jaesysz_recipe_app/theme.dart';
//import 'package:jaesysz_recipe_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jaesyz Recipe App',
      // Theme 1
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      // Theme by Me
      // theme: AppThemeNew.lightTheme(),
      // darkTheme: AppThemeNew.darkTheme(),
      themeMode: ThemeMode.dark,
      home:  HomeScreen(),
      //debugShowCheckedModeBanner: false,
    );
  }
}
