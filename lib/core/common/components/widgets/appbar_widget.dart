// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import 'back_icon_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color iconColor;
  const AppBarWidget({
    Key? key,
    required this.title,
    this.iconColor = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: SimpleText(
        title,
        textStyle: TextStyleEnum.poppinsMedium,
        fontSize: 17.sp,
      ),
      leading: BackIconWidget(
        iconColor: iconColor,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}
