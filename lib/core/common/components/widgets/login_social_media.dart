import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/services/social_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
          onTap: () async {
            SocialAuth socialAuth = SocialAuth();
            await socialAuth.signInWithGoogle();
          },
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
              child: SvgPicture.asset(ImageAssets.google),
            ),
          ),
        ),
        InkWell(
          onTap: () async {
            SocialAuth socialAuth = SocialAuth();
            await socialAuth.signInWithFacebook();
          },
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
              child: SvgPicture.asset(ImageAssets.facebook),
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
              child: SvgPicture.asset(ImageAssets.apple),
            ),
          ),
        )
      ],
    );
  }
}
