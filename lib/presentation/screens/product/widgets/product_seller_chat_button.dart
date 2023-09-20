part of 'widgets.dart';

class ProductSellerChatButton extends StatelessWidget {
  const ProductSellerChatButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25.h,
      child: MyElevatedButton(
        borderRadius: 4.r,
        verticalPadding: 4.h,
        horizontalPadding: 10.w,
        title: AppStrings.chat.tr(context: context),
        titleSize: 10.sp,
        hasElevation: false,
        spaceBetweenTextAndIcon: false,
        icon: ImageAssets.message,
        onPressed: () async {
          await ProductCubit.get(context)
              .createChat(CreateChatTypes.DIRECT, context);
        },
      ),
    );
  }
}
