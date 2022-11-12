import 'package:flutter/material.dart';
import 'grouppage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  String username = '';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() => primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('ユーザーネームの入力'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.people),
                    hintText: 'こたっつ',
                    labelText: 'ユーザーネーム',
                  ),
                  onChanged: (String value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GroupPage(username)),
                    );
                  },
                  child: const Text('登録'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}