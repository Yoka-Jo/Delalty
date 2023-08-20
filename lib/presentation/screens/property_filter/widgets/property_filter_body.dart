part of 'widgets.dart';

class PropertyFilterBody extends StatelessWidget {
  const PropertyFilterBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 35.h),
            const PropertyFilterFormField(),
            SizedBox(height: 40.h),
            const PropertyFilterTypeOfProperty(),
            SizedBox(height: 40.h),
            const PropertyFilterSection(),
            SizedBox(height: 40.h),
            const PropertyFilterType(),
            SizedBox(height: 40.h),
            const PropertyFilterPrice(),
            SizedBox(height: 40.h),
            const PropertyFilterMethodOfPayment(),
            SizedBox(height: 40.h),
            const PropertyFilterFinishingType(),
            SizedBox(height: 60.h),
            const PropertyFilterSearchButton(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
