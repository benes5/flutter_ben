import 'package:flutter/material.dart';


class TimerPage extends StatelessWidget {
  const TimerPage( {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Timer Page'),
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          'Timer Page',
        ),
      ),
    );
  }
}