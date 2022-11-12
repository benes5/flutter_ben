import 'package:flutter/material.dart';
import 'home.dart';

class GroupPage extends StatelessWidget {
  GroupPage(this.username, {Key? key}) : super(key: key);
  String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ユーザーネームの入力'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              username.toString(),
              style: const TextStyle(
                fontSize: 20
                ),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage()),
                );
              }, 
              child: const Text('はじめる')
              )
          ],
        ),
      ),
    );
  }
}