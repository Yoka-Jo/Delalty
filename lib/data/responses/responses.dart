// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import '../../app/extensions.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/no_data.dart';
import '../../domain/entities/user.dart';

part 'responses.g.dart';
part 'user_response.dart';

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
