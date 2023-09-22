import 'package:auto_route/annotations.dart';
import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/my_elevated_button.dart';
import '../../../core/common/components/widgets/user_image.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/strings_manager.dart';
import 'cubit/prohibited_persons_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/simple_text.dart';
import '../../../di.dart';

@RoutePage()
class ProhibitedPersonsScreen extends StatefulWidget {
  const ProhibitedPersonsScreen({super.key});

  @override
  State<ProhibitedPersonsScreen> createState() =>
      _ProhibitedPersonsScreenState();
}

class _ProhibitedPersonsScreenState extends State<ProhibitedPersonsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ProhibitedPersonsCubit>()..getBlockedUsers(context),
      child: Builder(builder: (context) {
        return BlocBuilder<ProhibitedPersonsCubit, ProhibitedPersonsState>(
          builder: (context, state) {
            final cubit = ProhibitedPersonsCubit.get(context);
            final blockedUsers = cubit.blockedUsers;
            return Scaffold(
              appBar: AppBarWidget(
                title: AppStrings.prohibitedPersons.tr(context: context),
                iconColor: AppColors.grey3,
              ),
              body: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                itemBuilder: (context, index) {
                  final blockedUser = blockedUsers[index];
                  return Container(
                    padding: EdgeInsets.fromLTRB(5.w, 10.h, 10.w, 10.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: const Color(0xff111111).withOpacity(0.05),
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                      color: AppColors.grey7,
                    ),
                    child: Row(
                      children: [
                        UserImage(
                          image: blockedUser.user?.image ?? '',
                          borderWidth: 0.0,
                          circleSize: 50.r,
                          showIconOnImage: false,
                        ),
                        SizedBox(width: 20.w),
                        SimpleText(
                          blockedUser.user?.name ?? '',
                          textStyle: TextStyleEnum.poppinsRegular,
                          fontSize: 15.sp,
                        ),
                        const Spacer(),
                        MyElevatedButton(
                          title: AppStrings.unblock,
                          height: 32.h,
                          verticalPadding: 0.0,
                          horizontalPadding: 8.w,
                          titleSize: 13.sp,
                          backgroundColor: AppColors.grey3,
                          onPressed: () {
                            if (blockedUser.user != null) {
                              cubit.unBlockUser(blockedUser.user!.id, context);
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 20.h),
                itemCount: blockedUsers.length,
              ),
            );
          },
        );
      }),
    );
  }
}
