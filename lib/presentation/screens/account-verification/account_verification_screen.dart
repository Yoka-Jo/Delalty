import 'package:auto_route/annotations.dart';
import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/colors_manager.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AccountVerificationScreen extends StatelessWidget {
  const AccountVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(
        title: AppStrings.accountVerification,
        iconColor: AppColors.grey3,
      ),
      body: AccountVerificationBody(),
    );
  }
}
