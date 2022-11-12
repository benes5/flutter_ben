import 'package:flutter/material.dart';
import 'bottomtab.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//右上のDEBUGの文字を消す
      title: '観光地アプリ',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 49, 56, 147),//岡大カラー
          foregroundColor: Colors.white,
        ),
      ),
      home: const BottomTabPage(),
      

    );
  }
}