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
  final _other = const types.User(
      id: 'otheruser',
      //firstName: "テスト",
      lastName: "たろう",
      imageUrl:
          "https://pbs.twimg.com/profile_images/1335856760972689408/Zeyo7jdq_bigger.jpg");

  // 追加
  @override
  void initState() {
    super.initState();
    _addMessage(types.TextMessage(
      author: _other,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      id: randomString(),
      text: "たろうさんは目標を達成しました",
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
                child: const Text('私も頑張ります。')
              ),
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
      text: '私も頑張ります。',
    );

    _addMessage(textMessage);
  }
}