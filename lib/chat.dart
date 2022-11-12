import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

String randomString() {
  final random = Random.secure();
  final values = List<int>.generate(16, (i) => random.nextInt(255));
  return base64UrlEncode(values);
}

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key}) : super(key: key);

  @override
  ChatRoomState createState() => ChatRoomState();
}

class ChatRoomState extends State<ChatRoom> {
  final List<types.Message> _messages = [];
  final _user = const types.User(id: '82091008-a484-4a89-ae75-a22bf8d6f3ac');


  // 追加
  final _other1 = const types.User(
      id: 'other1user',
      //firstName: "テスト",
      lastName: "たろう",
      imageUrl:
          "http://illustrain.com/img/work/2016/illustrain02-kotatsu01.png");

  final _other2 = const types.User(
      id: 'other2user',
      //firstName: "テスト",
      lastName: "こうへい",
      imageUrl:
          "https://1.bp.blogspot.com/-2icHJ4zioLs/YHDkG_fwSII/AAAAAAABdkg/x6TzbjTM8U874CDTB1JpMKid3XU_kN94wCNcBGAsYHQ/s400/cat_kotatsu_neko.png");

  // 追加
  @override
  void initState() {
    super.initState();
    _addMessage(types.TextMessage(
      author: _other1,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "たろうさんは目標を達成しました",
    ));
    _addMessage(types.TextMessage(
      author: _other2,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "すごい！！",
    ));
  }
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
      title: const Text('グループトーク'),
      ),
      backgroundColor: Colors.white,
        body: Chat(
          user: _user,
          messages: _messages,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 20, right:20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: (){
                  _button1Pressed();
                },
                child: const Text('すごい！！')
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: (){
                  _button2Pressed();
                },
                child: const Text('いいね！')
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                ),
                onPressed: (){
                  _button3Pressed();
                },
                child: const Text('私も頑張る。')
              ),
              // InkWell(
              //   onTap: (){},
              //   child: const Icon(
              //     Icons.keyboard
              //     )
              //   )
            ],
          ),
        ),
      );

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: message.text,
    );

    _addMessage(textMessage);
  }

    void _button1Pressed() {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: 'すごい！！',
    );

    _addMessage(textMessage);
  }

  void _button2Pressed() {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: 'いいね！',
    );

    _addMessage(textMessage);
  }

  void _button3Pressed() {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: '私も頑張る。',
    );

    _addMessage(textMessage);
  }
}