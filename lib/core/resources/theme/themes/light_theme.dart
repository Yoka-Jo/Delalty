part of 'app_theme_data.dart';

class LightThemeData extends AppThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
      scaffoldBackgroundColor: Colors.white,
      brightness: Brightness.light,
      primarySwatch: Colors.black.toMaterialColor(),
      dividerTheme: _dividerThemeData,
      appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0.0,
          titleTextStyle:
              getSemiBoldStyle(color: Colors.black, fontSize: 18.sp)));

  @override
  Color get selectedBottomSheetColor => Colors.orange;

  @override
  Color get multiDropDownCancelButtonTextColor => Colors.redAccent;

  @override
  Color get multiDropDownConfirmButtonTextColor => Colors.greenAccent;
}
