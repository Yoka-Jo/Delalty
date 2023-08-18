part of 'widgets.dart';

class ConversationContainer extends StatelessWidget {
  const ConversationContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 16.w,
            ),
            decoration: BoxDecoration(
              color: AppColors.containerLightColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
            ),
            child: Column(
              children: [
                const ConversationProductInfo(),
                SizedBox(height: 15.h),
                const ConversationDivider(),
                SizedBox(height: 25.h),
                const ConversationMessagesList(),
                const ConversationFormField()
              ],
            ),
          )),
    );
  }
}
