import 'package:auto_route/annotations.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

@RoutePage()
class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: ConversationBody(),
    );
  }
}
