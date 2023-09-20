part of 'widgets.dart';

class ConversationFormField extends StatelessWidget {
  const ConversationFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DefaultTextFormField(
            hintTextDirection: TextDirection.rtl,
            hintColor: AppColors.grey6,
            inputType: TextInputType.text,
            enableColor: AppColors.searchFormFieldBorderColor,
            focusColor: AppColors.searchFormFieldBorderColor,
            textInputAction: TextInputAction.done,
            filledColor: const Color(0xffEEEEEE),
            hintTxt: AppStrings.messaging.tr(context: context),
            prefixIcon: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const AttachmentIcon(),
                  SizedBox(width: 10.w),
                  const CameraIcon(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        CircleAvatar(
          radius: 26.r,
          backgroundColor: AppColors.ligthGreen,
          child: SvgPicture.asset(
            ImageAssets.send,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
