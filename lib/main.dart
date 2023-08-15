import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/my_app.dart';
import 'core/resources/localization/cubit/change_language_cubit.dart';
import 'core/resources/localization/language_manager.dart';
import 'core/resources/theme/cubit/change_theme_cubit.dart';
import 'di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // AppNotifications appNotifications = AppNotifications();
  // await appNotifications.setupNotification();

  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChangeThemeCubit(),
        ),
        BlocProvider(
          create: (_) => ChangeLanguageCubit(),
        ),
      ],
      child: EasyLocalization(
        path: assetPathLocalizations,
        supportedLocales: const [arabicLocal, englishLocal],
        child: MyApp(),
      ),
    ),
  );
}
