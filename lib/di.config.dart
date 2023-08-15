// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:delalty/core/user_secure_storage.dart' as _i11;
import 'package:delalty/data/datasources/local_datasource/local_datasource.dart'
    as _i13;
import 'package:delalty/data/datasources/local_datasource/local_modules.dart'
    as _i17;
import 'package:delalty/data/datasources/remote_datasource/app_api.dart' as _i3;
import 'package:delalty/data/datasources/remote_datasource/remote_modules.dart'
    as _i15;
import 'package:delalty/data/network/dio_factory.dart' as _i16;
import 'package:delalty/data/repository/repository.dart' as _i8;
import 'package:delalty/domain/repository/repository.dart' as _i7;
import 'package:delalty/domain/usecases/login_usecase.dart' as _i14;
import 'package:delalty/presentation/screens/login/cubit/login_cubit.dart'
    as _i6;
import 'package:delalty/presentation/screens/signup/cubit/signup_cubit.dart'
    as _i10;
import 'package:delalty/presentation/screens/verification_code/cubit/verification_code_cubit.dart'
    as _i12;
import 'package:dio/dio.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i9;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableAppServiceClientModule =
        _$InjectableAppServiceClientModule();
    final injectableDioModule = _$InjectableDioModule();
    final injectableUserSecureStorageModule =
        _$InjectableUserSecureStorageModule();
    final sharedPrefsInjectableModule = _$SharedPrefsInjectableModule();
    gh.lazySingleton<_i3.AppServiceClient>(
        () => injectableAppServiceClientModule.appServiceClient);
    gh.lazySingleton<_i4.Dio>(() => injectableDioModule.dio);
    gh.lazySingleton<_i5.FlutterSecureStorage>(
        () => injectableUserSecureStorageModule.secureStorage);
    gh.factory<_i6.LoginCubit>(() => _i6.LoginCubit());
    gh.factory<_i7.Repository>(
        () => _i8.RepositoryImpl(gh<_i3.AppServiceClient>()));
    await gh.factoryAsync<_i9.SharedPreferences>(
      () => sharedPrefsInjectableModule.prefs,
      preResolve: true,
    );
    gh.factory<_i10.SignupCubit>(() => _i10.SignupCubit());
    gh.factory<_i11.UserSecureStorage>(
        () => _i11.UserSecureStorage(gh<_i5.FlutterSecureStorage>()));
    gh.factory<_i12.VerificationCodeCubit>(() => _i12.VerificationCodeCubit());
    gh.factory<_i13.LocalDataSource>(
        () => _i13.LocalDataSource(gh<_i9.SharedPreferences>()));
    gh.lazySingleton<_i14.LoginUseCase>(
        () => _i14.LoginUseCase(gh<_i7.Repository>()));
    return this;
  }
}

class _$InjectableAppServiceClientModule
    extends _i15.InjectableAppServiceClientModule {}

class _$InjectableDioModule extends _i16.InjectableDioModule {}

class _$InjectableUserSecureStorageModule
    extends _i11.InjectableUserSecureStorageModule {}

class _$SharedPrefsInjectableModule extends _i17.SharedPrefsInjectableModule {}
