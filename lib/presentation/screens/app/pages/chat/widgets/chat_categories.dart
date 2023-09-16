part of 'widgets.dart';

class ChatCategories extends StatelessWidget {
  const ChatCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChatCategory(
          title: AppStrings.all.tr(context: context),
          image: ImageAssets.allOutlined,
          onTap: () {},
        ),
        ChatCategory(
          title: AppStrings.buy.tr(context: context),
          image: ImageAssets.bag,
          onTap: () {},
        ),
        ChatCategory(
          title: AppStrings.sale.tr(context: context),
          image: ImageAssets.shop,
          onTap: () {},
        ),
      ],
    );
  }
}
