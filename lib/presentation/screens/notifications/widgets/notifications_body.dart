part of 'widgets.dart';

class NotificationsBody extends StatelessWidget {
  const NotificationsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      child: ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            padding:
                EdgeInsets.only(right: 7.h, left: 20.h, top: 7.h, bottom: 7.h),
            decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(10.r)),
            child: const Column(
              children: [
                NotificationHeader(),
                NotificationsDetails(),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 28.h),
        itemCount: 2,
      ),
    );
  }
}
