part of 'widgets.dart';

class ProductDataValues extends StatelessWidget {
  const ProductDataValues({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddYourProductCubit, AddYourProductState>(
      builder: (context, state) {
        final cubit = AddYourProductCubit.get(context);
        return Expanded(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleText(
                  category.name,
                  textStyle: TextStyleEnum.poppinsMedium,
                  fontSize: 20.sp,
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Form(
                    key: cubit.formKey,
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TitledFormField(
                            initialValue:
                                AddYourProductCubit.get(context).title,
                            title: "Title",
                            hint: 'Enter product name',
                            validationFunction: (value) {
                              if (value!.length < 10) {
                                return 'Product title length must be at least 10 characters.';
                              }
                              return null;
                            },
                            onSaved: (value) => cubit.setTitle(value!),
                          ),
                          SizedBox(height: 20.h),
                          TitledFormField(
                            initialValue:
                                AddYourProductCubit.get(context).descritption,
                            title: "Description",
                            hint: 'Enter product description',
                            validationFunction: (value) {
                              if (value!.length < 50) {
                                return 'Product description length must be at least 50 characters.';
                              }
                              return null;
                            },
                            onSaved: (value) => cubit.setDescription(value!),
                          ),
                          SizedBox(height: 20.h),
                          TitledFormField(
                            initialValue:
                                AddYourProductCubit.get(context).price,
                            title: "Price",
                            hint: 'Enter product price',
                            validationFunction: (value) {
                              if (double.tryParse(value!) == null) {
                                return 'Please enter valid price.';
                              }
                              return null;
                            },
                            onSaved: (value) => cubit.setPrice(value!),
                          ),
                          SizedBox(height: 20.h),
                          ProductFormFieldsForCategoryValues(
                            category: category,
                          ),
                          SizedBox(height: 20.h),
                          ProductCheckBoxes(category: category),
                          ProductSelectButtons(category: category),
                          SizedBox(height: 30.h),
                          MyElevatedButton(
                            height: 50.h,
                            title: AppStrings.next.tr(context: context),
                            onPressed: () {
                              cubit.next(category.id);
                            },
                          ),
                          SizedBox(height: 40.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
