import 'package:flutter/material.dart';
import 'package:learn_note_app/pages/home_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox("mybox"); 
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
    );
  }
}
