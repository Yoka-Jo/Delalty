import 'package:auto_route/annotations.dart';
import '../../../core/resources/colors_manager.dart';
import 'cubit/conversation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../di.dart';
import 'widgets/widgets.dart';

@RoutePage()
class ConversationScreen extends StatelessWidget {
  const ConversationScreen({
    super.key,
    required this.chatId,
  });
  final String chatId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ConversationCubit>()..getChat(chatId, context),
      child: const Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: ConversationBody(),
      ),
    );
  }
}
