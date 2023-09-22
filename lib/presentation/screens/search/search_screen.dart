import 'package:auto_route/auto_route.dart';
import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../di.dart';
import 'cubit/search_cubit.dart';
import 'widgets/widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SearchCubit>()..getRecentlySearchedProducts(),
      child: Scaffold(
        appBar: AppBarWidget(
          title: AppStrings.search.tr(context: context),
        ),
        body: const SearchBody(),
      ),
    );
  }
}
