import 'package:flutter/material.dart';
import 'home.dart';
import 'login.dart';

class GroupPage extends StatelessWidget {
  const GroupPage( {Key? key}) : super(key: key);

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