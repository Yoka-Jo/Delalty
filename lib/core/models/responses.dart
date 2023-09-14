import 'package:delalty/app/constants.dart';
import 'package:delalty/domain/entities/user_image.dart';

import '../../domain/entities/best_categories.dart';
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

abstract class DataResponse<T> {
  T toDomain();
}

@JsonSerializable(createToJson: false)
class NoDataResponse implements DataResponse<NoData> {
  const NoDataResponse();

  @override
  NoData toDomain() => const NoData();

  factory NoDataResponse.fromJson() =>
      _$NoDataResponseFromJson({});
}
