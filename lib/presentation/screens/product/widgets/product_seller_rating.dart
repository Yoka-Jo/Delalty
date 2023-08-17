part of 'widgets.dart';

class ProductSellerRating extends StatelessWidget {
  const ProductSellerRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => SvgPicture.asset(
            ImageAssets.star,
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 10.w,
            vertical: 3.h,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: Colors.black.withOpacity(0.22)),
          child: SimpleText(
            '5.0',
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 8.sp,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
