// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:delalty/presentation/screens/app/pages/chat/chat_page.dart';
import 'package:delalty/presentation/screens/app/pages/home/home_page.dart';
import 'package:delalty/presentation/screens/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  int index = 4;
  final List<Widget> screens = [
    const Scaffold(),
    const ChatPage(),
    const Scaffold(),
    Container(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      extendBody: true,
      bottomNavigationBar: BottomNavBarWidget(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        index: index,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2;
          });
        },
        backgroundColor: AppColors.primaryColor,
        child: Container(
          height: 25.r,
          width: 25.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 2,
              color: Colors.white,
            ),
          ),
          child: Center(
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 18.r,
            ),
          ),
        ),
      ),
    );
  }
}
