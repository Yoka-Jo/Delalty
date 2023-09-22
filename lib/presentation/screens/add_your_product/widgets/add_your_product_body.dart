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
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddYourProductAppBar(),
            SizedBox(height: 36.h),
            const AddYourProductProgress(),
            SizedBox(height: 25.h),

            Expanded(
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
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: getFormFieldsInputs.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 40.h,
                        ),
                        itemBuilder: (context, index) {
                          final input = getFormFieldsInputs[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SimpleText(
                                input.name,
                                textStyle: TextStyleEnum.poppinsRegular,
                                fontSize: 15.sp,
                              ),
                              SizedBox(height: 15.h),
                              DefaultTextFormField(
                                hintTxt: input.name,
                                validationFunction: (value) {
                                  final max = input.validations['max'];
                                  final min = input.validations['min'];
                                  if (max != null && value!.length > max) {
                                    return 'This field should be at most $max characters long.';
                                  }
                                  if (min != null && value!.length < min) {
                                    return 'This field should be at least $min characters long.';
                                  }
                                  return null;
                                },
                                inputType: input.type == 'TEXT'
                                    ? TextInputType.text
                                    : TextInputType.number,
                                textInputAction:
                                    index == getFormFieldsInputs.length - 1
                                        ? TextInputAction.done
                                        : TextInputAction.next,
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        itemCount: getCheckBoxes.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          final input = getCheckBoxes[index];
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SimpleText(
                                input.name,
                                textStyle: TextStyleEnum.poppinsRegular,
                                fontSize: 15.sp,
                              ),
                              SizedBox(height: 15.h),
                              Checkbox(
                                value: true,
                                activeColor: AppColors.primaryColor,
                                onChanged: (value) {},
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    // Expanded(
                    //   child: ListView.separated(
                    //     physics: const BouncingScrollPhysics(),
                    //     itemCount: getSelectInputs.length,
                    //     separatorBuilder: (context, index) => SizedBox(
                    //       height: 40.h,
                    //     ),
                    //     itemBuilder: (context, index) {
                    //       final input = getFormFieldsInputs[index];
                    //       return Column(
                    //         crossAxisAlignment: CrossAxisAlignment.start,
                    //         children: [
                    //           SimpleText(
                    //             input.name,
                    //             textStyle: TextStyleEnum.poppinsRegular,
                    //             fontSize: 15.sp,
                    //           ),
                    //           SizedBox(height: 15.h),
                    //           Wrap(
                    //             spacing: 7.w,
                    //             runSpacing: 7.h,
                    //             children: getSelectInputs
                    //                 .map(
                    //                   (input) => BuildOptionButton(
                    //                     isSelected: false,
                    //                     title: input.name,
                    //                     onPressed: () {},
                    //                   ),
                    //                 )
                    //                 .toList(),
                    //           ),
                    //         ],
                    //       );
                    //     },
                    //   ),
                    // ),

                    MyElevatedButton(
                      height: 50.h,
                      title: AppStrings.next.tr(context: context),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )
            // const AddYourProductAddImages()
          ],
        ),
      ),
    );
  }

  List<Input> get getFormFieldsInputs => category.inputs
      .where((e) => e.type == 'TEXT' || e.type == 'NUMBER')
      .toList();

  List<Input> get getCheckBoxes =>
      category.inputs.where((e) => e.type == 'BOOLEAN').toList();

  List<Input> get getSelectInputs =>
      category.inputs.where((e) => e.type == 'SELECT').toList();
}
