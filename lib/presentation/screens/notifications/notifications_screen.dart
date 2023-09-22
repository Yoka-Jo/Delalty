import 'package:auto_route/auto_route.dart';
import '../../../core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/common/components/widgets/appbar_widget.dart';
import 'widgets/widgets.dart';

@RoutePage()
class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(title: AppStrings.notifications),
      body: NotificationsBody(),
    );
  }
}
