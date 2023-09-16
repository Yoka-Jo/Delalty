// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/onboarding/cubit/onboarding_cubit.dart';
import 'package:delalty/presentation/screens/onboarding/widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'model/onboarding_model.dart';

@RoutePage()
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: Builder(builder: (context) {
          return Padding(
            padding: EdgeInsets.only(bottom: 65.h),
            child: PageView.builder(
              controller: _pageController,
              itemCount: models.length,
              onPageChanged: OnboardingCubit.get(context).changeCurrentPosition,
              itemBuilder: (context, i) {
                final model = models[i];
                return Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(model.image, fit: BoxFit.cover),
                        SimpleText(
                          model.title.tr(context: context),
                          textStyle: TextStyleEnum.poppinsSemiBold,
                          fontSize: 25.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 17.h),
                        SimpleText(
                          model.body.tr(context: context),
                          textStyle: TextStyleEnum.poppinsLight,
                          fontSize: 18.sp,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 38.h),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }),
        bottomSheet: OnBoardingBottomSheet(
          onTap: () async {
            if (_pageController.page == models.length - 1) {
              await getIt<LocalDataSource>().saveIsOnBoardingScreenViewed();
              if (context.mounted) {
                context.router.replaceAll([LoginRoute()]);
              }
              return;
            }
            _pageController.nextPage(
              duration: const Duration(milliseconds: 700),
              curve: Curves.easeInOut,
            );
          },
        ),
      ),
    );
  }
}
