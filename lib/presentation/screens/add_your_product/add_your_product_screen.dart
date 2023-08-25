import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'widgets/widgets.dart';

@RoutePage()
class AddYourProductScreen extends StatelessWidget {
  const AddYourProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: AddYourProductBody(),
    );
  }
}
