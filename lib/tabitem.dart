import 'package:flutter/material.dart';
import 'package:frontend/chat.dart';
import 'timer.dart';
import 'ranking.dart';

enum TabItem {
  timer(
    title: 'timer',
    icon: Icons.timer,
    page: TimerPage(),
  ),

  chat(
    title: 'chat',
    icon: Icons.chat,
    page: ChatRoom(),
  ),

  ranking(
    title: 'ranking',
    icon: Icons.grade,
    page: RankingPage(),
  );

  const TabItem({
    required this.title,
    required this.icon,
    required this.page,
  });

  /// タイトル
  final String title;

  /// アイコン
  final IconData icon;

  /// 画面
  final Widget page;
}