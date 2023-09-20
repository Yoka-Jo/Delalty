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
      child: Column(
        children: [
          BlocBuilder<ConversationCubit, ConversationState>(
            builder: (context, state) {
              final cubit = ConversationCubit.get(context);
              if (ConversationCubit.get(context).images.isEmpty) {
                return const SizedBox.shrink();
              }
              return StatefulBuilder(
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
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: DefaultTextFormField(
                  controller: ConversationCubit.get(context).messageController,
                  hintTextDirection: TextDirection.rtl,
                  hintColor: AppColors.grey6,
                  inputType: TextInputType.text,
                  enableColor: AppColors.searchFormFieldBorderColor,
                  focusColor: AppColors.searchFormFieldBorderColor,
                  textInputAction: TextInputAction.done,
                  filledColor: const Color(0xffEEEEEE),
                  hintTxt: AppStrings.messaging.tr(context: context),
                  prefixIcon: InkWell(
                    onTap: () async {
                      await ConversationCubit.get(context).pickImages(context);
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
                  ConversationCubit.get(context).sendMessage();
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
        ],
      ),
    );
  }
}
