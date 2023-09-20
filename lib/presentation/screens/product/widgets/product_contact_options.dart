part of 'widgets.dart';

class ProductContactOptions extends StatelessWidget {
  const ProductContactOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        final cubit = ProductCubit.get(context);
        final seller = cubit.product.seller;
        return Row(
          children: [
            Expanded(
              child: MyElevatedButton(
                title: AppStrings.chat.tr(context: context),
                icon: ImageAssets.message,
                onPressed: () async =>
                    cubit.createChat(CreateChatTypes.PRODUCT),
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
