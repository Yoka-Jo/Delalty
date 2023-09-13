// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    const NoDataResponse();

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

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      categoryId: json['category_id'] as int?,
      values: (json['values'] as List<dynamic>?)
          ?.map((e) => ValueResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ProductImageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      seller: json['seller'] == null
          ? null
          : SellerResponse.fromJson(json['seller'] as Map<String, dynamic>),
      visible: json['visible'] as bool?,
      mainImageId: json['main_image_id'] as String?,
    );

ValueResponse _$ValueResponseFromJson(Map<String, dynamic> json) =>
    ValueResponse(
      inputId: json['input_id'] as String?,
      value: json['value'] as String?,
    );

ProductImageResponse _$ProductImageResponseFromJson(
        Map<String, dynamic> json) =>
    ProductImageResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

SellerResponse _$SellerResponseFromJson(Map<String, dynamic> json) =>
    SellerResponse(
      id: json['id'] as String?,
      verified: json['verified'] as bool?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] == null
          ? null
          : UserImageResponse.fromJson(json['image'] as Map<String, dynamic>),
      isAdmin: json['is_admin'] as bool?,
      isCompany: json['is_company'] as bool?,
    );

UserImageResponse _$UserImageResponseFromJson(Map<String, dynamic> json) =>
    UserImageResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );
