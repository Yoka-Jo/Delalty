import 'dart:convert';

import '../core/network/failure.dart';

extension NonNullString on String? {
  String orEmpty() {
    if (this == null) {
      return "";
    } else {
      return this!;
    }
  }
}

extension NonNullInteger on int? {
  int orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullDouble on double? {
  double orZero() {
    if (this == null) {
      return 0;
    } else {
      return this!;
    }
  }
}

extension NonNullBool on bool? {
  bool orFalse() {
    if (this == null) {
      return false;
    } else {
      return this!;
    }
  }
}

extension GetErrorFromBadRequest on Failure {
  String getErrors() =>
      (json.decode(message)['error'] as Map<String, dynamic>).values.map(
        (e) {
          return (e as List).map((e) => e).join('\n');
        },
      ).join('\n');
}
