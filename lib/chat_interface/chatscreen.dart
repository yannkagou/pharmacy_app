import 'package:flutter/material.dart';
import 'package:pharnacy/chat_interface/chat_params.dart';

import 'chat.dart';

class ChatScreen extends StatelessWidget {
  final ChatParams chatParams;

  const ChatScreen({Key? key, required this.chatParams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          elevation: 0.0,
          title: Text('Chat with ' + chatParams.peerName)),
      body: Chat(chatParams: chatParams),
    );
  }
}
