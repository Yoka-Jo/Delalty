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

  @override
  Widget build(BuildContext context) {
    return BlocListener<RelationshipCubit, RelationshipState>(
      listener: (context, state) {
        if (state is ChangeRelationshipSuccess) {
          SimpleToast.showSimpleToast(
            msg: AppStrings.sentAddFriendRequest.tr(context: context),
            state: ToastStates.success,
          );
        }

        if (state is ChangeRelationshipFailure) {
          SimpleToast.showSimpleToast(
            msg: state.message,
            state: ToastStates.error,
          );
        }
      },
      child: BlocListener<CreateChatCubit, CreateChatState>(
        listener: (context, state) {
          if (state is CreateChatSuccess) {
            context.router.push(ConversationRoute(chatId: state.chatId));
          }

          if (state is CreateChatFailure) {
            SimpleToast.showSimpleToast(
              msg: state.message,
              state: ToastStates.error,
              toastLength: Toast.LENGTH_LONG,
            );
          }
          if (state is CreateChatFailureNotFriends) {
            showDialogForAddingFriend(
              context,
              () async =>
                  await RelationshipCubit.get(context).addFriend(state.id),
            );
          }
        },
        child: BlocConsumer<ProductCubit, ProductState>(
          listener: (context, state) {
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
        ),
      ),
    );
  }
}
