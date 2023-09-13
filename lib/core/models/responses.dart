import '../../domain/entities/validations.dart';
import '../../domain/entities/input.dart';
import '../../domain/entities/category.dart';
import '../../domain/entities/auth_data.dart';
// ignore: unused_import
import '../../app/extensions.dart';
// ignore: unused_import
import 'package:equatable/equatable.dart';

import 'package:json_annotation/json_annotation.dart';

import 'no_data.dart';

part 'responses.g.dart';

part '../../data/responses/auth_data_response.dart';

part '../../data/responses/category_response.dart';

part '../../data/responses/input_response.dart';

part '../../data/responses/validations_response.dart';

abstract class DataResponse<T> {
  T toDomain();
}

@JsonSerializable(createToJson: false)
class NoDataResponse implements DataResponse<NoData> {
  const NoDataResponse();

  @override
  NoData toDomain() => const NoData();

  factory NoDataResponse.fromJson(Map<String, dynamic> json) =>
      _$NoDataResponseFromJson(json);
}
