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
          AppStrings.specification.tr(context: context),
          textStyle: TextStyleEnum.poppinsMedium,
          fontSize: 15.sp,
          textAlign: TextAlign.start,
        ),
        children: [
          Wrap(
            spacing: 30.w,
            runSpacing: 30.w,
            children: List.generate(
              ProductCubit.get(context).product.values.length,
              (index) {
                final value = ProductCubit.get(context).product.values[index];
                log(value.value.toString());
                return Column(
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
                      '${value.value}',
                      textStyle: TextStyleEnum.poppinsMedium,
                      fontSize: 10.sp,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
