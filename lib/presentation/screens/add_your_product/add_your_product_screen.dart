// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/category.dart';
import 'widgets/widgets.dart';

@RoutePage()
class AddYourProductScreen extends StatelessWidget {
  final Category category;
  const AddYourProductScreen({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    for (var element in category.inputs) {
      log('name: ${element.name}');
      log('type: ${element.type}');
      log('validations: ${element.validations}');
      log('isRequired: ${element.isRequired}');
    }
    return Scaffold(
      body: AddYourProductBody(
        category: category,
      ),
    );
  }
}
