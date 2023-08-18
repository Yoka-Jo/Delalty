// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackIconWidget extends StatelessWidget {
  final Color? iconColor;
  const BackIconWidget({
    Key? key,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.router.pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: iconColor,
        size: 20.h,
      ),
    );
  }
}
