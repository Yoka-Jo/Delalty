import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomePage(),
    );
  }
}
