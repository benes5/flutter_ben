import 'package:flutter/material.dart';
import 'bottomtab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,//右上のDEBUGの文字を消す
      title: '机に向かわせるアプリ',
      theme: ThemeData(
        fontFamily: 'NotoSans',
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
      ),
      home: const BottomTabPage(),
      

    );
  }
}