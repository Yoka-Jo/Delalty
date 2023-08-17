part of 'widgets.dart';

class ProductSellerChatButton extends StatelessWidget {
  const ProductSellerChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 2.h),
        ),
        onPressed: () {},
        child: MyElevatedButton(
          borderRadius: 4.r,
          verticalPadding: 2.h,
          horizontalPadding: 10.w,
          title: AppStrings.chat,
          titleSize: 10.sp,
          hasElevation: false,
          spaceBetweenTextAndIcon: false,
          icon: ImageAssets.message,
          onPressed: () {},
        ),
      ),
    );
  }
}
