part of 'widgets.dart';

class ProductBody extends StatefulWidget {
  const ProductBody({
    super.key,
    required this.productId,
  });
  final String productId;

  @override
  State<ProductBody> createState() => _ProductBodyState();
}

class _ProductBodyState extends State<ProductBody> {
  @override
  void initState() {
    super.initState();
    ProductCubit.get(context).getProduct(widget.productId);
  }

  Future<void> showDialogForAddingFriend(BuildContext parentcontext) async {
    showAdaptiveDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: SimpleText(
          AppStrings.sendFriedRequest.tr(context: context),
          textStyle: TextStyleEnum.montserratBold,
          fontSize: 18.sp,
        ),
        content: SimpleText(
          AppStrings.doYouWantToAddThisUserAsFriend.tr(context: context),
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await ProductCubit.get(parentcontext).addFriend();
              if (context.mounted) {
                context.router.pop();
              }
            },
            child: SimpleText(
              AppStrings.yes.tr(context: context),
              textStyle: TextStyleEnum.montserratBold,
              color: AppColors.primaryColor,
              fontSize: 18.sp,
            ),
          ),
          TextButton(
            onPressed: () => context.router.pop(),
            child: SimpleText(
              AppStrings.no.tr(context: context),
              textStyle: TextStyleEnum.montserratBold,
              color: AppColors.red,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is CreateChatSuccess) {
          context.router.push(ConversationRoute(chatId: state.chatId));
        }
        log(state.toString());
        if (state is AddSellerFriendSuccess) {
          SimpleToast.showSimpleToast(
            msg: AppStrings.sentAddFriendRequest.tr(context: context),
            state: ToastStates.success,
          );
        }

        if (state is CreateChatFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
            toastLength: Toast.LENGTH_LONG,
          );
        }
        if (state is CreateChatFailureNotFriends) {
          showDialogForAddingFriend(context);
        }

        if (state is AddSellerFriendFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
          );
        }

        if (state is GetProductFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
          );
        }
      },
      builder: (context, state) {
        if (state is GetProductLoading) {
          return SafeArea(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  Align(
                    alignment: ChangeLanguageCubit.get(context).isEnglish
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: const BackIconWidget(
                      iconColor: Colors.black,
                    ),
                  ),
                  const Expanded(
                    child: CenteredCircularProgressIndicaotr(),
                  ),
                ],
              ),
            ),
          );
        }
        return const SingleChildScrollView(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              ProductImages(),
              ProductAppBar(),
              ProductContainer(),
            ],
          ),
        );
      },
    );
  }
}
