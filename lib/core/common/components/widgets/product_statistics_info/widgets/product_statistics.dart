// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class ProductStatistics extends StatelessWidget {
  final int numberOfViews;
  final int numberOfFavorites;
  final int numberOfMessages;
  const ProductStatistics({
    Key? key,
    required this.numberOfViews,
    required this.numberOfFavorites,
    required this.numberOfMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _ProductStatisticDataWidget(
            icon: ImageAssets.eye,
            title: AppStrings.views,
            data: "$numberOfViews",
          ),
          _ProductStatisticDataWidget(
            icon: ImageAssets.favorite,
            title: AppStrings.favorite,
            data: "$numberOfFavorites",
          ),
          _ProductStatisticDataWidget(
            icon: ImageAssets.chat,
            title: AppStrings.chat,
            data: "$numberOfMessages",
          ),
        ],
      ),
    );
  }
}

class _ProductStatisticDataWidget extends StatelessWidget {
  final String title;
  final String icon;
  final String data;
  const _ProductStatisticDataWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          color: AppColors.grey3,
          height: 16.r,
          width: 16.r,
        ),
        SizedBox(width: 5.w),
        RichText(
          text: TextSpan(
            text: "$title : ",
            style: getSemiBoldStyle(
              fontSize: 13.sp,
              family: FontFamilies.poppins,
              color: AppColors.grey3,
            ),
            children: [
              TextSpan(
                text: data,
                style: getSemiBoldStyle(
                  fontSize: 11.sp,
                  family: FontFamilies.poppins,
                  color: AppColors.grey3,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
