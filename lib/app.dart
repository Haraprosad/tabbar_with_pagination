import 'package:flutter/material.dart';
import 'package:tabbar_with_pagination/features/tabbar/presentation/pages/tabbar_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabbarPage(),
    );
  }
}
