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
    return BlocBuilder<ProductCubit, ProductState>(
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
