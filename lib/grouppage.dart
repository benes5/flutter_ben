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
              '$usernameさんのグループは...',
              style: const TextStyle(
                fontSize: 20
                ),
            ),

            SizedBox(
              width: 300,
              height: 200,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                    'http://illustrain.com/img/work/2016/illustrain02-kotatsu01.png',
                    width: 5,
                    height: 5,
                    fit: BoxFit.fill,
                    ),
                  ),                  
                ],)
              ),
            // ClipOval(
            //             child: Image.asset(
            //             'http://illustrain.com/img/work/2016/illustrain02-kotatsu01.png',
            //             width: 5,
            //             height: 5,
            //             fit: BoxFit.fill,
            //           ),
            //           ),
            //         ClipOval(
            //           child: Image.asset(
            //           'http://illustrain.com/img/work/2016/illustrain02-kotatsu01.png',
            //           width: 5,
            //           height: 5,
            //           fit: BoxFit.fill,
            //         ),
            //         ),
            //         ClipOval(
            //           child: Image.asset(
            //           'http://illustrain.com/img/work/2016/illustrain02-kotatsu01.png',
            //           width: 5,
            //           height: 5,
            //           fit: BoxFit.fill,
            //         ),
            //         ),
            //         ClipOval(
            //           child: Image.asset(
            //           'https://vbackground.com/3377/',
            //           width: 5,
            //           height: 5,
            //           fit: BoxFit.fill,
            //         ),
            //         ),
            //         ClipOval(
            //           child: Image.asset(
            //           'https://vbackground.com/3377/',
            //           width: 5,
            //           height: 5,
            //           fit: BoxFit.fill,
            //         ),
            //         ),                   
            //       ],
            //     ),
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