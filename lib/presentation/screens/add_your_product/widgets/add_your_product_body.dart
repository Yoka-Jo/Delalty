part of 'widgets.dart';

class AddYourProductBody extends StatelessWidget {
  const AddYourProductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddYourProductAppBar(),
            SizedBox(height: 36.h),
            const AddYourProductProgress(),
            SizedBox(height: 65.h),
            const AddYourProductAddImages()
          ],
        ),
      ),
    );
  }
}
