// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    NoDataResponse();

AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    AuthDataResponse(
      userId: json['userId'] as int?,
      accessToken: json['accessToken'] as String?,
      isRegister: json['isRegister'] as bool?,
      hasPassword: json['hasPassword'] as bool?,
      phoneStatus: json['phoneStatus'] as String?,
      verifiedEmail: json['verifiedEmail'] as bool?,
    );

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      parentId: json['parent_id'] as int?,
      inputs: (json['inputs'] as List<dynamic>?)
          ?.map((e) => InputResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

InputResponse _$InputResponseFromJson(Map<String, dynamic> json) =>
    InputResponse(
      name: json['name'] as String?,
      type: json['type'] as String?,
      validations: (json['validations'] as List<dynamic>?)
          ?.map((e) => ValidationsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

ValidationsResponse _$ValidationsResponseFromJson(Map<String, dynamic> json) =>
    ValidationsResponse(
      min: json['min'] as int?,
      max: json['max'] as int?,
    );
