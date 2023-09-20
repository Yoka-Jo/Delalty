// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NoDataResponse _$NoDataResponseFromJson(Map<String, dynamic> json) =>
    NoDataResponse();

AuthDataResponse _$AuthDataResponseFromJson(Map<String, dynamic> json) =>
    AuthDataResponse(
      userId: json['userId'] as String,
      accessToken: json['accessToken'] as String?,
      isRegister: json['isRegister'] as bool?,
      hasPassword: json['hasPassword'] as bool?,
      phoneStatus: json['phoneStatus'] as String?,
      verifiedEmail: json['verifiedEmail'] as bool?,
    );

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      parentId: json['parent_id'] as String?,
      inputs: (json['inputs'] as List<dynamic>?)
          ?.map((e) => InputResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

InputResponse _$InputResponseFromJson(Map<String, dynamic> json) =>
    InputResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      type: json['type'] as String?,
      validations: json['validations'] as Map<String, dynamic>?,
      isRequired: json['required'] as bool,
    );

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as String,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'],
      categoryId: json['category_id'] as String?,
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

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'category_id': instance.categoryId,
      'values': instance.values,
      'images': instance.images,
      'seller': instance.seller,
      'visible': instance.visible,
      'main_image_id': instance.mainImageId,
    };

ValueResponse _$ValueResponseFromJson(Map<String, dynamic> json) =>
    ValueResponse(
      inputId: json['input_id'] as String?,
      value: json['value'],
    );

Map<String, dynamic> _$ValueResponseToJson(ValueResponse instance) =>
    <String, dynamic>{
      'input_id': instance.inputId,
      'value': instance.value,
    };

ProductImageResponse _$ProductImageResponseFromJson(
        Map<String, dynamic> json) =>
    ProductImageResponse(
      id: json['id'] as String?,
      extension: json['extension'] as String?,
      url: json['url'] as String?,
    );

Map<String, dynamic> _$ProductImageResponseToJson(
        ProductImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'extension': instance.extension,
      'url': instance.url,
    };

SellerResponse _$SellerResponseFromJson(Map<String, dynamic> json) =>
    SellerResponse(
      id: json['id'] as String?,
      verified: json['verified'] as bool?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SellerResponseToJson(SellerResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'verified': instance.verified,
      'user': instance.user,
    };

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      image: json['image'] as String?,
      isAdmin: json['is_admin'] as bool?,
      isCompany: json['is_company'] as bool?,
      seller: json['seller'] == null
          ? null
          : SellerResponse.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'is_admin': instance.isAdmin,
      'is_company': instance.isCompany,
      'seller': instance.seller,
    };

UserImageResponse _$UserImageResponseFromJson(Map<String, dynamic> json) =>
    UserImageResponse(
      id: json['id'] as String?,
      url: json['url'] as String?,
    );

BestCategoriesResponse _$BestCategoriesResponseFromJson(
        Map<String, dynamic> json) =>
    BestCategoriesResponse(
      ids: (json['ids'] as List<dynamic>).map((e) => e as String).toList(),
    );

CategoryProductsResponse _$CategoryProductsResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryProductsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

CommentResponse _$CommentResponseFromJson(Map<String, dynamic> json) =>
    CommentResponse(
      id: json['id'] as String?,
      productId: json['product_id'] as String?,
      userId: json['user_id'] as String?,
      referenceId: json['reference_id'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] as String?,
      repliesCount: json['replies_count'] as int?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

SearchedProductsResponse _$SearchedProductsResponseFromJson(
        Map<String, dynamic> json) =>
    SearchedProductsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
    );

ChatResponse _$ChatResponseFromJson(Map<String, dynamic> json) => ChatResponse(
      id: json['id'] as String,
      productId: json['product_id'] as String,
      type: json['type'] as String?,
      product: json['product'] == null
          ? null
          : ProductResponse.fromJson(json['product'] as Map<String, dynamic>),
      lastMessage: json['last_message'] == null
          ? null
          : MessageResponse.fromJson(
              json['last_message'] as Map<String, dynamic>),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => ParticipantResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

MessageResponse _$MessageResponseFromJson(Map<String, dynamic> json) =>
    MessageResponse(
      id: json['id'] as String,
      chatId: json['chat_id'] as String,
      content: json['content'] as String?,
      nonce: json['nonce'] as String?,
      createdAt: json['created_at'] as Map<String, dynamic>?,
      updatedAt: json['updated_at'] as Map<String, dynamic>?,
      embeds: (json['embeds'] as List<dynamic>?)
          ?.map((e) => EmbedResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => AttachmentResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

EmbedResponse _$EmbedResponseFromJson(Map<String, dynamic> json) =>
    EmbedResponse(
      id: json['id'] as String,
      type: json['type'] as String?,
      title: json['title'] as Map<String, dynamic>?,
      description: json['description'] as Map<String, dynamic>?,
      url: json['url'] as Map<String, dynamic>?,
    );

ParticipantResponse _$ParticipantResponseFromJson(Map<String, dynamic> json) =>
    ParticipantResponse(
      lastMessageReadId: json['last_message_read_id'] as String?,
      isChatOwner: json['is_chat_owner'] as bool?,
      user: json['user'] == null
          ? null
          : UserResponse.fromJson(json['user'] as Map<String, dynamic>),
    );

AttachmentResponse _$AttachmentResponseFromJson(Map<String, dynamic> json) =>
    AttachmentResponse(
      id: json['id'] as String,
      filename: json['filename'] as String?,
      url: json['url'] as String?,
    );

RelationShipResponse _$RelationShipResponseFromJson(
        Map<String, dynamic> json) =>
    RelationShipResponse(
      type: json['type'] as String?,
      verified: json['verified'] as bool?,
      target: json['target'] == null
          ? null
          : RelationShipTargetResponse.fromJson(
              json['target'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelationShipResponseToJson(
        RelationShipResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'verified': instance.verified,
      'target': instance.target,
    };

RelationShipTargetResponse _$RelationShipTargetResponseFromJson(
        Map<String, dynamic> json) =>
    RelationShipTargetResponse(
      id: json['id'] as String,
      name: json['name'] as String?,
      isAdmin: json['is_admin'] as bool?,
      isCompany: json['is_company'] as bool?,
      image: json['image'] as String?,
      seller: json['seller'] == null
          ? null
          : SellerResponse.fromJson(json['seller'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RelationShipTargetResponseToJson(
        RelationShipTargetResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_admin': instance.isAdmin,
      'is_company': instance.isCompany,
      'image': instance.image,
      'seller': instance.seller,
    };
