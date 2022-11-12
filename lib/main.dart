//8月4日時点で、画面下部にタブを設定してタブを押したら画面が切り替わるように設定できた。
//現状の課題として、wordlistタブでお気に入り選択した後、1度Newpageタブに切り替えてからwordlistタブに
//戻ってくると選んでいた記録が消えてしまう。（そもそもリストごと再生成している）
//観光地アプリでは、タブを切り替えても途中の結果は保存できるようにしておきたい。
//
//wordlist_page.dart内の「async」「await」の意味を理解したい
//favoritelist_page.dartのbuildメソッドの中に意味不明なままコピペした箇所があるのでそこを理解したい
//bottomtab_page.dartはサイトのコードをほぼコピペしたのであまりいじらない方がよさそう
//（BottomNavigationBarItemの中に「label: '表示したい文字'」を書かないとx
//デバッグしたときにエラーが出てしまうので注意）
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