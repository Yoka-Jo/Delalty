part of 'widgets.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: SingleChildScrollView(
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const ProfileUserSituation(),
            SizedBox(height: 25.h),
            const ProfileUserLocation(),
            SizedBox(height: 32.h),
            const ProfileUserDateOfAccession(),
            SizedBox(height: 34.h),
            const ProfileUserPhoneNumber(),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
