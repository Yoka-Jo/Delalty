// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delalty/core/base_usecase.dart';
import 'package:delalty/core/common/components/widgets/simple_toast.dart';
import 'package:delalty/domain/usecases/google_login_usecase.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../di.dart';
import '../../domain/usecases/facebook_login_usecase.dart';

class SocialAuth {
  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }

    final response = await getIt<GoogleLoginUseCase>()(NoParams());

    response.fold(
      (failure) {
        SimpleToast.showSimpleToast(msg: failure.message);
      },
      (_) {},
    );
  }

  Future<void> signInWithFacebook() async {
    await FacebookAuth.instance.login();
    final userData =
        AuthModel.fromJson(await FacebookAuth.instance.getUserData());

    final response = await getIt<FacebookLoginUseCase>()(NoParams());

    response.fold(
      (failure) {
        SimpleToast.showSimpleToast(msg: failure.message);
      },
      (_) {},
    );
  }
}

class AuthModel {
  final String name;
  final String email;
  final String id;
  AuthModel({
    required this.name,
    required this.email,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> map) {
    return AuthModel(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['id'] as String,
    );
  }
}
