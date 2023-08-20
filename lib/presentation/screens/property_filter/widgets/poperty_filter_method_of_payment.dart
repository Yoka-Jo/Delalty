part of 'widgets.dart';

class PropertyFilterMethodOfPayment extends StatelessWidget {
  const PropertyFilterMethodOfPayment({
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
              AppStrings.methodOfPayment,
              textStyle: TextStyleEnum.poppinsRegular,
              fontSize: 13.sp,
            ),
            SizedBox(height: 20.h),
            Wrap(
              spacing: 7.w,
              runSpacing: 7.h,
              children: cubit.methodOfPayments
                  .map(
                    (method) => BuildOptionButton(
                      isSelected: cubit.methodOfPayment == method,
                      title: method,
                      onPressed: () => cubit.changeMethodOfPayment(method),
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
