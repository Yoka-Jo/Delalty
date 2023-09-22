import '../../domain/entities/attachment.dart';
import '../../domain/entities/chat.dart';
import '../../domain/entities/embed.dart';
import '../../domain/entities/message.dart';
import '../../domain/entities/participant.dart';
import '../../domain/entities/comment.dart';
import '../../app/constants.dart';
import '../../domain/entities/user_image.dart';

import '../../domain/entities/best_categories.dart';
import '../../domain/entities/relationship.dart';
import '../../domain/entities/relationship_target.dart';
import '../../domain/entities/searched_products.dart';
import '../../domain/entities/user.dart';
import '../../domain/entities/seller.dart';
import '../../domain/entities/product_image.dart';
import '../../domain/entities/value.dart';
import '../../domain/entities/product.dart';
import '../../domain/entities/input.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/auth_data.dart';
// ignore: unused_import
import '../../app/extensions.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

import 'no_data.dart';
import 'package:delalty/domain/entities/category_products.dart';

part 'responses.g.dart';

part '../../data/responses/auth_data_response.dart';

part '../../data/responses/category_response.dart';

part '../../data/responses/input_response.dart';

part '../../data/responses/product_response.dart';

part '../../data/responses/value_response.dart';

part '../../data/responses/product_image_response.dart';

part '../../data/responses/seller_response.dart';

part '../../data/responses/user_response.dart';
part '../../data/responses/user_image_response.dart';
part '../../data/responses/best_categories_response.dart';
part '../../data/responses/category_products_response.dart';

part '../../data/responses/comment_response.dart';
part '../../data/responses/searched_products_response.dart';

part '../../data/responses/chat_response.dart';
part '../../data/responses/message_response.dart';
part '../../data/responses/embed_response.dart';
part '../../data/responses/participant_response.dart';
part '../../data/responses/attachment_response.dart';
part '../../data/responses/relationship_response.dart';
part '../../data/responses/relationship_target_response.dart';

abstract class DataResponse<T> {
  T toDomain();
}

@JsonSerializable(createToJson: false)
class NoDataResponse implements DataResponse<NoData> {
  const NoDataResponse();

  @override
  NoData toDomain() => const NoData();

  factory NoDataResponse.fromJson() => _$NoDataResponseFromJson({});
}
