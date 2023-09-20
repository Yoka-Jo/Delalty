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
            padding: EdgeInsets.symmetric(vertical: 25.h),
            decoration: BoxDecoration(
              color: AppColors.containerLightColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30.r),
                topLeft: Radius.circular(30.r),
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        if (ConversationCubit.get(context).chat.product !=
                            null) ...[
                          const ConversationProductInfo(),
                          SizedBox(height: 15.h),
                          const ConversationDivider(),
                        ],
                        SizedBox(height: 25.h),
                        const ConversationMessagesList(),
                      ],
                    ),
                  ),
                ),
                const ConversationRejectOrAcceptContact(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const ConversationFormField(),
                )
              ],
            ),
          )),
    );
  }
}
