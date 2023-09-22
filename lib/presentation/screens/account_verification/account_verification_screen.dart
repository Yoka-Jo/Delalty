import 'package:auto_route/annotations.dart';
import '../../../core/common/components/widgets/appbar_widget.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../di.dart';
import 'cubit/account_verification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/resources/colors_manager.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AccountVerificationScreen extends StatelessWidget {
  const AccountVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AccountVerificationCubit>(),
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            if (AccountVerificationCubit.get(context)
                    .accountVerificationSteps ==
                AccountVerificationSteps.idImages) {
              AccountVerificationCubit.get(context)
                  .changeStep(AccountVerificationSteps.data);
              return false;
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBarWidget(
              title: AppStrings.accountVerification.tr(context: context),
              iconColor: AppColors.grey3,
            ),
            body: const AccountVerificationBody(),
          ),
        );
      }),
    );
  }
}
