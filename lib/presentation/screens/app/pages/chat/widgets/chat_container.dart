part of 'widgets.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(
            top: 20.h,
            right: 16.w,
            left: 16.w,
          ),
          decoration: BoxDecoration(
            color: AppColors.containerLightColor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30.r),
              topLeft: Radius.circular(30.r),
            ),
          ),
          // child: Center(
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Image.asset(
          //         ImageAssets.noMessages,
          //       ),
          //       SimpleText(
          //         AppStrings.noMessages,
          //         textStyle: TextStyleEnum.poppinsRegular,
          //         fontSize: 15.sp,
          //         color: AppColors.grey3,
          //       )
          //     ],
          //   ),
          // ),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                context.router.push(const ConversationRoute());
              },
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const ChatImage(),
                  SizedBox(width: 18.w),
                  const ChatUserNameAndMessage(),
                  const Spacer(),
                  const ChatTimeAndStatus()
                ],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(
              height: 20.h,
            ),
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
