import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/resources/app_context.dart';
import '../core/resources/localization/cubit/change_language_cubit.dart';
import '../core/resources/routes/app_router.dart';
import '../core/resources/theme/app_theme.dart';
import '../core/resources/theme/cubit/change_theme_cubit.dart';
import '../core/resources/theme/themes/app_theme_data.dart';

class MyApp extends StatefulWidget {
  static MyApp instance = const MyApp._internal();
  const MyApp._internal();
  factory MyApp() => instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter(AppContext.navigationKey);

  final _lightTheme = LightThemeData();

  final _darkTheme = DarkThemeData();

  @override
  void didChangeDependencies() {
    initApp();
    super.didChangeDependencies();
  }

  void initApp() async {
    await Future.wait([
      ChangeThemeCubit.get(context).initTheme(),
      ChangeLanguageCubit.get(context).initLanguage(context)
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageCubit, ChangeLanguageState>(
      builder: (context, state) {
        return BlocBuilder<ChangeThemeCubit, ChangeThemeState>(
          builder: (context, state) {
            return AppTheme(
              lightTheme: _lightTheme,
              darkTheme: _darkTheme,
              child: ScreenUtilInit(
                designSize: const Size(393, 852),
                builder: (context, child) {
                  return GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: MaterialApp.router(
                      title: 'Delalty',
                      useInheritedMediaQuery: true,
                      builder: DevicePreview.appBuilder,
                      debugShowCheckedModeBanner: false,
                      theme: _lightTheme.materialThemeData,
                      darkTheme: _darkTheme.materialThemeData,
                      themeMode: ChangeThemeCubit.get(context).themeMode,
                      supportedLocales: context.supportedLocales,
                      localizationsDelegates: context.localizationDelegates,
                      locale: context.locale,
                      routerConfig: _appRouter.config(
                        initialRoutes: [
                          const AppRoute(),
                          // MapRoute(
                          //   longitude: 31.0414531,
                          //   latitude: 31.4240395,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
