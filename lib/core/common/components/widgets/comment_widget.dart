// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:delalty/core/common/components/widgets/simple_text.dart';

import '../../../resources/assets_manager.dart';

class CommentWidget extends StatelessWidget {
  final String name;
  final String comment;
  const CommentWidget({
    Key? key,
    required this.name,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 40.r,
          backgroundColor: Colors.transparent,
          backgroundImage: const AssetImage(
            ImageAssets.notifications,
          ),
        ),
        SizedBox(width: 25.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              name,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 14.sp,
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 245.w,
              child: SimpleText(
                comment,
                textStyle: TextStyleEnum.poppinsLight,
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
