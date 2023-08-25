part of 'widgets.dart';

class ProductStatsDetailsColumn extends StatelessWidget {
  final String title;
  final String icon;
  final int number;
  const ProductStatsDetailsColumn({
    Key? key,
    required this.title,
    required this.icon,
    required this.number,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 53.r,
          height: 45.r,
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: AppColors.primaryColor,
          ),
          child: SvgPicture.asset(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 2.h),
        SimpleText(
          "$number",
          textStyle: TextStyleEnum.poppinsSemiBold,
          fontSize: 20.sp,
        ),
        SimpleText(
          title,
          textStyle: TextStyleEnum.poppinsRegular,
          fontSize: 13.sp,
          color: AppColors.grey3,
        ),
      ],
    );
  }
}
