// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:device_preview/device_preview.dart';
import 'app/my_app.dart';
import 'core/resources/localization/cubit/change_language_cubit.dart';
import 'core/resources/localization/language_manager.dart';
import 'core/resources/theme/cubit/change_theme_cubit.dart';
import 'core/services/socket/socket_cubit.dart';
import 'di.dart';
import 'firebase_options.dart';
import 'presentation/cubits/create_chat_cubit/create_chat_cubit.dart';
import 'presentation/cubits/relationship_cubit/relationship_cubit.dart';
import 'presentation/screens/app/cubit/app_cubit.dart';
import 'presentation/screens/favorite/cubit/favorite_cubit.dart';

void main() async {
  final engine = WidgetsFlutterBinding.ensureInitialized();
  engine.performReassemble();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
    configureDependencies(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChangeThemeCubit(),
        ),
        BlocProvider(
          create: (_) => ChangeLanguageCubit(),
        ),
        BlocProvider(
          create: (_) => getIt<AppCubit>(),
        ),
        BlocProvider(
          create: (_) => SocketCubit(),
        ),
        BlocProvider(
          create: (_) => getIt<CreateChatCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<RelationshipCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<FavoriteCubit>(),
        ),
      ],
      child: EasyLocalization(
        path: assetPathLocalizations,
        supportedLocales: const [arabicLocal, englishLocal],
        child: DevicePreview(
          enabled: false,
          builder: (context) => MyApp(),
        ),
      ),
    ),
  );
}
