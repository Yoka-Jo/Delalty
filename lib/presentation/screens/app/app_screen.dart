import 'package:auto_route/annotations.dart';
import 'package:delalty/presentation/screens/app/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ChatPage(),
    );
  }
}
