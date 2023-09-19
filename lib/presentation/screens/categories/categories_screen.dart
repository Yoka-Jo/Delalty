// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/app/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/common/components/widgets/category_widget.dart';
import '../../../core/common/components/widgets/centered_circular_progress_indicator.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes/app_router.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../domain/entities/category.dart';

@RoutePage()
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final ScrollController controller;
  int page = 1;
  int itemsNumber = 6;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.onScrollEndsListener(() {
      setState(() {
        isLoading = true;
      });
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          isLoading = false;
          page = 2;
        });
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.favorite.tr(context: context),
        iconColor: AppColors.grey3,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              controller: controller,
              crossAxisSpacing: 16.w,
              mainAxisSpacing: 12.h,
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(
                (page * itemsNumber > widget.categories.length
                    ? widget.categories.length
                    : page * itemsNumber),
                (index) {
                  final category = widget.categories[index];
                  return InkWell(
                    onTap: () {
                      context.router.push(
                        ViewProductSectionRoute(
                          category: category,
                          isRealEstate: false,
                        ),
                      );
                    },
                    child: CategoryWidget(
                      image: category.image,
                      title: category.name,
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 30.h),
          if (isLoading) ...[
            const CenteredCircularProgressIndicaotr(),
            SizedBox(height: 30.h),
          ]
        ],
      ),
    );
  }
}
