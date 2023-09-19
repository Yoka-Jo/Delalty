part of 'widgets.dart';

class ViewProductSectionBody extends StatelessWidget {
  const ViewProductSectionBody({
    super.key,
    required this.isRealEstate,
  });

  final bool isRealEstate;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewProductSectionCubit, ViewProductSectionState>(
      builder: (context, state) {
        final isLoading = state is ViewProductSectionGetProductsLoading;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  const ViewProductSectionFormField(),
                  if (isRealEstate) ...[
                    SizedBox(width: 6.w),
                    const ViewProductSectionFilterButton(),
                  ]
                ],
              ),
              SizedBox(height: 11.h),
              if (!isRealEstate) const ViewProductSectionButtons(),
              ViewProductSectionListOfProucts(isRealEstate: isRealEstate),
            ],
          ),
        );
      },
    );
  }
}
