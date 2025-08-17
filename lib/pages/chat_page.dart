import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key, required this.receiverEmail});
static final String routName = 'ChatPage';
final String receiverEmail;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
    );
  }
}