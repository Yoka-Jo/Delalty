// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'requests.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RegisterRequestToJson(RegisterRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
    };

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };

Map<String, dynamic> _$VerifyPhoneRequestToJson(VerifyPhoneRequest instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'code': instance.code,
    };

Map<String, dynamic> _$CreateProductRequestToJson(
        CreateProductRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'main_image_index': instance.mainImageIndex,
      'file': instance.file,
    };

Map<String, dynamic> _$AddProductToFavoritesRequestToJson(
        AddProductToFavoritesRequest instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
    };

Map<String, dynamic> _$ChangeRelationshipTypeRequestToJson(
        ChangeRelationshipTypeRequest instance) =>
    <String, dynamic>{
      'type': instance.type,
      'target_id': instance.target_id,
    };
