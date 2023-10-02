import 'package:delalty/core/common/components/widgets/centered_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../cubit/app_cubit.dart';
import 'widgets/widgets.dart';

class PersonalProfilePage extends StatelessWidget {
  const PersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        if (state is AppGetUserDataLoading) {
          return const SizedBox(
            width: double.infinity,
            child: CenteredCircularProgressIndicaotr(),
          );
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              const PersonalProfileImages(),
              const PersonalProfileInfo(),
              SizedBox(height: 40.h),
              const PersonalProfileButtons(),
              SizedBox(height: 150.h),
            ],
          ),
        );
      },
    );
  }
}
