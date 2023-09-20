import 'package:delalty/app/extensions.dart';
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/resources/colors_manager.dart';
import '../../cubit/app_cubit.dart';
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
    HomeCubit.get(context).getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return const HomePageView();
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  late final ScrollController controller;

  @override
  void initState() {
    super.initState();
    AppCubit.get(context).getUserData();
    controller = ScrollController();
    controller.onScrollEndsListener(() {
      HomeCubit.get(context).getCategoriesProducts();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          controller: controller,
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
    );
  }
}
