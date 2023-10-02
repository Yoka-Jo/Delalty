// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'widgets.dart';

class AddYourProductBody extends StatelessWidget {
  const AddYourProductBody({
    Key? key,
    required this.category,
  }) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BlocConsumer<AddYourProductCubit, AddYourProductState>(
          listener: (context, state) {
            if (state is CreateProductFailure) {
              SimpleToast.showSimpleToast(
                  msg: state.message, state: ToastStates.error);
            }
            if (state is CreateProductSuccess) {
              context.router.replaceAll(
                [
                  const AppRoute(),
                  ConfirmationOfSaleRoute(product: state.product),
                ],
              );
            }
          },
          builder: (context, state) {
            final cubit = AddYourProductCubit.get(context);
            return WillPopScope(
              onWillPop: () async {
                if (cubit.finishedAddingProductDetails) {
                  cubit.unFinishedAddingProductDetails();
                  return false;
                }
                return true;
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  const AddYourProductAppBar(),
                  SizedBox(height: 36.h),
                  const AddYourProductProgress(),
                  SizedBox(height: 25.h),
                  if (!cubit.finishedAddingProductDetails)
                    ProductDataValues(category: category)
                  else
                    const AddYourProductAddImages()
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
