import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/assets_manager.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart';
import 'package:delalty/presentation/screens/verification_code/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class VerificationCodeScreen extends StatelessWidget {
  const VerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerificationCodeCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 58.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    ImageAssets.verificationCode,
                    fit: BoxFit.cover,
                  ),
                  SimpleText(
                    AppStrings.verifciationCode,
                    textStyle: TextStyleEnum.montserratBold,
                    fontSize: 25.sp,
                  ),
                  SizedBox(height: 29.h),
                  const VerificationCodeOtpSentToPhone(),
                  SizedBox(height: 46.h),
                  const VerificationCodeOtp(),
                  SizedBox(height: 20.h),
                  const VerificationCodeResendOtp()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
