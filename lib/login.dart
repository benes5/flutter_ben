import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('New Page'),
      ),
      backgroundColor: Colors.orange,
      body: const Center(
        child: Text(
          "New Page",
          style: TextStyle(
            fontSize: 20
          ),
        ),
      ),
    );
  }
}