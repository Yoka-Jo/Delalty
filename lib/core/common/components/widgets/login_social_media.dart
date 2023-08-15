import 'package:delalty/core/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSocailMedia extends StatelessWidget {
  const LoginSocailMedia({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 16.w, bottom: 30.h),
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.black.withOpacity(0.18), width: 0.5),
            ),
            child: Center(
              child: Image.asset(ImageAssets.google),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 16.w, bottom: 30.h),
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.black.withOpacity(0.18), width: 0.5),
            ),
            child: Center(
              child: Image.asset(ImageAssets.facebook),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            margin: EdgeInsets.only(right: 16.w, bottom: 30.h),
            height: 48.w,
            width: 48.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border:
                  Border.all(color: Colors.black.withOpacity(0.18), width: 0.5),
            ),
            child: Center(
              child: Image.asset(ImageAssets.apple),
            ),
          ),
        )
      ],
    );
  }
}
