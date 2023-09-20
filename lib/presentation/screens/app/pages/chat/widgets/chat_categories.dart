part of 'widgets.dart';

class ChatCategories extends StatelessWidget {
  const ChatCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = ChatCubit.get(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ChatCategory(
          title: AppStrings.all.tr(context: context),
          image: ImageAssets.allOutlined,
          type: ChatsType.all,
          onTap: () {
            cubit.filterForAll(context);
          },
        ),
        ChatCategory(
          title: AppStrings.buy.tr(context: context),
          image: ImageAssets.bag,
          type: ChatsType.buy,
          onTap: () {
            cubit.filterForBuy(context);
          },
        ),
        ChatCategory(
          title: AppStrings.sale.tr(context: context),
          image: ImageAssets.shop,
          type: ChatsType.sale,
          onTap: () {
            cubit.filterForSale(context);
          },
        ),
      ],
    );
  }
}
