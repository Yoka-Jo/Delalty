import 'package:url_launcher/url_launcher.dart';
import '../../../resources/assets_manager.dart';
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
            // SocialAuth socialAuth = SocialAuth();
            // await socialAuth.signInWithGoogle();
            launchUrl(
              Uri.parse(
                  'https://accounts.google.com/signin/oauth/error/v2?authError=Cg9pbnZhbGlkX3JlcXVlc3QS3gEKWW91IGNhbid0IHNpZ24gaW4gdG8gdGhpcyBhcHAgYmVjYXVzZSBpdCBkb2Vzbid0IGNvbXBseSB3aXRoIEdvb2dsZSdzIE9BdXRoIDIuMCBwb2xpY3kgZm9yIGtlZXBpbmcgYXBwcyBzZWN1cmUuCgpZb3UgY2FuIGxldCB0aGUgYXBwIGRldmVsb3BlciBrbm93IHRoYXQgdGhpcyBhcHAgZG9lc24ndCBjb21wbHkgd2l0aCBvbmUgb3IgbW9yZSBHb29nbGUgdmFsaWRhdGlvbiBydWxlcy4KICAaWWh0dHBzOi8vZGV2ZWxvcGVycy5nb29nbGUuY29tL2lkZW50aXR5L3Byb3RvY29scy9vYXV0aDIvcG9saWNpZXMjc2VjdXJlLXJlc3BvbnNlLWhhbmRsaW5nIJADKjwKDHJlZGlyZWN0X3VyaRIsaHR0cHM6L25vZGUuZGVsYWx0eS5jb20vYXV0aC9nb29nbGUvcmVkaXJlY3Q%3D&client_id=418588579485-nvf3rqvhe118202l711q5sbko3dve2eq.apps.googleusercontent.com'),
            );
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
            // SocialAuth socialAuth = SocialAuth();
            // await socialAuth.signInWithFacebook();
            launchUrl(
              Uri.parse(
                  'https://www.facebook.com/v3.2/dialog/oauth?response_type=code&redirect_uri=https%3A%2Fnode.delalty.com%2Fauth%2Ffacebook%2Fredirect&scope=email&client_id=1307573963487618'),
            );
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
          onTap: () {
            launchUrl(
              Uri.parse(
                  'https://appleid.apple.com/auth/authorize?response_type=code&response_mode=query&client_id=com.react.apple.login&redirect_uri=http%3A%2F%2Flocalhost%3A3000%2Flogin'),
            );
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
              child: SvgPicture.asset(ImageAssets.apple),
            ),
          ),
        )
      ],
    );
  }
}
