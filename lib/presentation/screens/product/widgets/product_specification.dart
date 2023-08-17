part of 'widgets.dart';

class ProductSpecification extends StatelessWidget {
  const ProductSpecification({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        childrenPadding: EdgeInsets.zero,
        tilePadding: EdgeInsets.zero,
        title: SimpleText(
          AppStrings.specification,
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
        ),
        children: [
          Wrap(
            spacing: 30.w,
            runSpacing: 30.w,
            children: List.generate(
              4,
              (index) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.speed,
                    height: 30.w,
                    width: 30.w,
                  ),
                  SizedBox(
                    width: 60.w,
                    child: SimpleText(
                      'Acceleration from 0-100',
                      textStyle: TextStyleEnum.poppinsLight,
                      fontSize: 8.sp,
                      color: AppColors.grey3,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SimpleText(
                    '9.8',
                    textStyle: TextStyleEnum.poppinsMedium,
                    fontSize: 10.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
