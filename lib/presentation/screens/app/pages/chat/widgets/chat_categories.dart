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
          title: AppStrings.all,
          image: ImageAssets.allOutlined,
          onTap: () {},
        ),
        ChatCategory(
          title: AppStrings.buy,
          image: ImageAssets.bag,
          onTap: () {},
        ),
        ChatCategory(
          title: AppStrings.sale,
          image: ImageAssets.shop,
          onTap: () {},
        ),
      ],
    );
  }
}
