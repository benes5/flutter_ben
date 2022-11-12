import 'package:flutter/material.dart';

class RankingPage extends StatelessWidget {
  const RankingPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Ranking Page'),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          'Ranking Page',
        ),
      ),
    );
  }
}