part of 'widgets.dart';

class BuildOutlinedButton extends StatelessWidget {
  final String title;
  final String icon;
  final VoidCallback onPressed;
  const BuildOutlinedButton({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        padding: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SimpleText(
              title,
              textStyle: TextStyleEnum.poppinsMedium,
              fontSize: 13.sp,
            ),
            SizedBox(width: 2.w),
            SvgPicture.asset(
              icon,
              height: 20.r,
              width: 20.r,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
