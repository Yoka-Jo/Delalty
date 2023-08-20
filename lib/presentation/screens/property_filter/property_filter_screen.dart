import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/appbar_widget.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/di.dart';
import 'package:delalty/presentation/screens/property_filter/cubit/property_filter_cubit.dart';
import 'package:delalty/presentation/screens/property_filter/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class PropertyFilterScreen extends StatelessWidget {
  const PropertyFilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PropertyFilterCubit>(),
      child: const Scaffold(
        appBar: AppBarWidget(
          title: AppStrings.propertySearch,
        ),
        body: PropertyFilterBody(),
      ),
    );
  }
}
