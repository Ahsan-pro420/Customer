import 'package:flutter/material.dart';
import 'package:customerapp/views/pages/chatScreens/ChatPage.dart';
import 'package:customerapp/views/widgets/r_tab_bar_view.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({Key? key}) : super(key: key);

  @override
  _ChatMainScreenState createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ChatPage());
  }
}
