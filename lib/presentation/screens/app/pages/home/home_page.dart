import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import 'widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // AppCubit.get(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>()..getHomeData(),
      child: Container(
        color: AppColors.primaryColor,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SizedBox(height: 20.h),
                        const HomeAppBar(),
                        SizedBox(height: 20.h),
                        const HomeFormField(),
                        SizedBox(height: 17.h),
                        const HomeCategories(),
                        SizedBox(height: 28.h),
                      ],
                    ),
                  ),
                  const HomeContainer()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
