import 'package:chat_app/views/login_view.dart';
import 'package:chat_app/views/register_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        'LoginView': (context) => LoginView(),
        RegisterView.id: (context) => RegisterView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: 'LoginView',
    );
  }
}
