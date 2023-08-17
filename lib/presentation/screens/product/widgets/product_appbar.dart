part of 'widgets.dart';

class ProductAppBar extends StatelessWidget {
  const ProductAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 20.h,
              ),
            ),
            Expanded(
              child: Center(
                child: SimpleText(
                  'MGHS2022',
                  textStyle: TextStyleEnum.poppinsSemiBold,
                  fontSize: 17.sp,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              height: 32.w,
              width: 32.w,
              padding: EdgeInsets.all(5.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: FittedBox(
                child: SvgPicture.asset(
                  ImageAssets.favourite,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            SizedBox(width: 12.w),
            Container(
              height: 32.w,
              width: 32.w,
              padding: EdgeInsets.all(5.h),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: FittedBox(
                child: SvgPicture.asset(
                  ImageAssets.share,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
