// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delalty/presentation/screens/app/pages/chat/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import 'widgets/widgets.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit()..getChats(context),
      child: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: SizedBox(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 20.h),
                      const ChatTitle(),
                      SizedBox(height: 20.h),
                      const ChatFormField(),
                      SizedBox(height: 20.h),
                      const ChatCategories(),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
                const ChatContainer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
