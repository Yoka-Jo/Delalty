// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProductInfo extends StatelessWidget {
  final String title;
  final String price;
  final String location;
  const ProductInfo({
    Key? key,
    required this.title,
    required this.price,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6.h),
        SizedBox(
          width: 170.w,
          child: SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsMedium,
            fontSize: 13.sp,
          ),
        ),
        SizedBox(height: 10.h),
        SimpleText(
          'EGP $price',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 12.sp,
        ),
        SizedBox(height: 10.h),
        SimpleText(
          'location : $location',
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 11.sp,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
