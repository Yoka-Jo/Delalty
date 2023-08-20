part of 'widgets.dart';

class PropertyFilterFinishingType extends StatelessWidget {
  const PropertyFilterFinishingType({
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
              AppStrings.finishingType,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 7.w,
              runSpacing: 7.h,
              children: cubit.finishingTypes
                  .map(
                    (finishingType) => BuildOptionButton(
                      isSelected: cubit.finishingType == finishingType,
                      title: finishingType,
                      onPressed: () => cubit.changeFinishingType(finishingType),
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}
