part of 'widgets.dart';

class ProductContactOptions extends StatelessWidget {
  const ProductContactOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MyElevatedButton(
            title: AppStrings.chat,
            icon: ImageAssets.message,
            onPressed: () {},
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: MyElevatedButton(
            title: AppStrings.contact,
            icon: ImageAssets.call,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
