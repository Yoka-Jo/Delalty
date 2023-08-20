// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class PropertyFilterSection extends StatelessWidget {
  const PropertyFilterSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PropertyFilterCubit, PropertyFilterState>(
      builder: (context, state) {
        final cubit = PropertyFilterCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SimpleText(
              AppStrings.section,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                _SectionButton(
                  title: AppStrings.forSale,
                  onPressed: () => cubit.changeSaleOption(AppStrings.forSale),
                  isSelected: cubit.saleOption == AppStrings.forSale,
                ),
                SizedBox(width: 30.w),
                _SectionButton(
                  title: AppStrings.forRent,
                  onPressed: () => cubit.changeSaleOption(AppStrings.forRent),
                  isSelected: cubit.saleOption == AppStrings.forRent,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class _SectionButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final bool isSelected;
  const _SectionButton({
    Key? key,
    required this.title,
    required this.onPressed,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isSelected ? AppColors.primaryColor : null,
          side: const BorderSide(color: AppColors.primaryColor, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.h,
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: SimpleText(
            title,
            textStyle: TextStyleEnum.poppinsRegular,
            fontSize: 13.sp,
            color: isSelected ? Colors.white : AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
