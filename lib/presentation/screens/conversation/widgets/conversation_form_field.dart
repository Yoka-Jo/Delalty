part of 'widgets.dart';

class ConversationFormField extends StatefulWidget {
  const ConversationFormField({
    super.key,
  });

  @override
  State<ConversationFormField> createState() => _ConversationFormFieldState();
}

class _ConversationFormFieldState extends State<ConversationFormField> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: BlocBuilder<ConversationCubit, ConversationState>(
        builder: (context, state) {
          final cubit = ConversationCubit.get(context);
          return Column(
            children: [
              if (cubit.images.isEmpty)
                const SizedBox.shrink()
              else
                StatefulBuilder(
                  builder: (context, setState) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: Stack(
                        children: [
                          BuildCarousel(
                            numberOfImagesMargin: EdgeInsets.all(10.r),
                            height: MediaQuery.sizeOf(context).width / 2,
                            showFavouriteButton: false,
                            showIfOnlyOneImage: cubit.images.length != 1,
                            images: cubit.images,
                            onSwipe: (ind) {
                              setState(() {
                                index = ind;
                              });
                            },
                          ),
                          Positioned(
                            top: 10.r,
                            right: 10.r,
                            child: InkWell(
                              onTap: () {
                                cubit.removeImage(index);
                              },
                              child: CircleAvatar(
                                radius: 16.r,
                                backgroundColor: AppColors.red,
                                child: CircleAvatar(
                                  radius: 14.r,
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                    size: 20.r,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: DefaultTextFormField(
                          controller: cubit.messageController,
                          hintTextDirection: TextDirection.rtl,
                          onChangedFunction: cubit.onMessageChanged,
                          hintColor: AppColors.grey6,
                          inputType: TextInputType.text,
                          enableColor: AppColors.searchFormFieldBorderColor,
                          focusColor: AppColors.searchFormFieldBorderColor,
                          textInputAction: TextInputAction.done,
                          filledColor: const Color(0xffEEEEEE),
                          hintTxt: AppStrings.messaging.tr(context: context),
                          onFieldSubmitted: (value) {
                            cubit.sendMessage();
                          },
                          prefixIcon: InkWell(
                            onTap: () async {
                              await cubit.pickImages(context);
                            },
                            child: const CameraIcon(),
                          ),

                          // Container(
                          //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       const AttachmentIcon(),
                          //       SizedBox(width: 10.w),
                          //       const CameraIcon(),
                          //     ],
                          //   ),
                          // ),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      InkWell(
                        onTap: () {
                          cubit.sendMessage();
                        },
                        child: CircleAvatar(
                          radius: 26.r,
                          backgroundColor: AppColors.ligthGreen,
                          child: SvgPicture.asset(
                            ImageAssets.send,
                            matchTextDirection: true,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  if (cubit.messageError != null) ...[
                    SizedBox(
                      height: 5.h,
                    ),
                    SimpleText(
                      cubit.messageError!.tr(context: context),
                      textStyle: TextStyleEnum.montserratMedium,
                      color: AppColors.red,
                      fontSize: 12.sp,
                    ),
                  ]
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
