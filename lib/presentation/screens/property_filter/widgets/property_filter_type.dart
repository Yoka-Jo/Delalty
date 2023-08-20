part of 'widgets.dart';

class PropertyFilterType extends StatelessWidget {
  const PropertyFilterType({
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
              AppStrings.type,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 7.w,
              runSpacing: 7.h,
              children: cubit.types
                  .map(
                    (type) => BuildOptionButton(
                      isSelected: cubit.type == type,
                      title: type,
                      onPressed: () => cubit.changeType(type),
                    ),
                  )
                  .toList(),
            )
          ],
        );
      },
    );
  }
}
