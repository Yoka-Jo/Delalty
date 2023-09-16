part of 'widgets.dart';

class ProductStatsBody extends StatelessWidget {
  const ProductStatsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductInfo(),
            SizedBox(height: 25.h),
            const ProductStatsChart(),
            SizedBox(height: 25.h),
            const ProductStatsDetails(),
          ],
        ),
      ),
    );
  }
}
