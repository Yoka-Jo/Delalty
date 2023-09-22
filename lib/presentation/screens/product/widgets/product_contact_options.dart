part of 'widgets.dart';

class ProductContactOptions extends StatelessWidget {
  const ProductContactOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final createChatCubit = CreateChatCubit.get(context);
        final productCubit = ProductCubit.get(context);
        return Row(
          children: [
            Expanded(
              child: MyElevatedButton(
                title: AppStrings.chat.tr(context: context),
                icon: ImageAssets.message,
                onPressed: () async => createChatCubit.createChat(
                  CreateChatTypes.PRODUCT,
                  context,
                  participantId: productCubit.product.seller!.id,
                  productId: productCubit.product.id,
                ),
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: MyElevatedButton(
                title: AppStrings.contact.tr(context: context),
                icon: ImageAssets.call,
                onPressed: () async {
                  launchContact(phoneNumber: '01020913878');
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
