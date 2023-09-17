import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../language_manager.dart';

part 'change_language_state.dart';

class ChangeLanguageCubit extends Cubit<ChangeLanguageState> {
  ChangeLanguageCubit() : super(ChangeLanguageInitial());

  static ChangeLanguageCubit get(BuildContext context) =>
      BlocProvider.of(context);

  bool _isEnglish = true;

  bool get isEnglish => _isEnglish;

  Locale get getLocale => _isEnglish ? englishLocal : arabicLocal;

  Future<void> initLanguage(BuildContext context) async {
    emit(ChangeLanguageInitial());

    SharedPreferences prefs = await SharedPreferences.getInstance();

    final isEnglish = prefs.getBool("lang") ?? true;
    _isEnglish = isEnglish;
    if (context.mounted) {
      context.setLocale(getLocale);
    }
    emit(ChangeLanguage());
  }

  Future<void> changeLanguage(BuildContext context, {bool? isEnglish}) async {
    isEnglish ??= !_isEnglish;
    emit(ChangeLanguageInitial());

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("lang", isEnglish);
    _isEnglish = isEnglish;
    if (context.mounted) {
      context.setLocale(getLocale);
    }
    emit(ChangeLanguage());
  }
}
