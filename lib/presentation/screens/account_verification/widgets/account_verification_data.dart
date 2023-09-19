part of 'widgets.dart';

class AccountVerificationData extends StatelessWidget {
  const AccountVerificationData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            const AccountVerificationStepsBars(),
            SizedBox(height: 25.h),
            const AccountVerificationFormFields(),
          ],
        ),
      ),
    );
  }
}
