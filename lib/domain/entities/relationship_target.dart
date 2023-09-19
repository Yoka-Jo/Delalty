// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:delalty/domain/entities/seller.dart';

class RelationShipTarget {
  final String id;
  final String name;

  final bool isAdmin;

  final bool isCompany;
  final String image;
  final Seller? seller;

  const RelationShipTarget({
    required this.id,
    required this.name,
    required this.isAdmin,
    required this.isCompany,
    required this.image,
    required this.seller,
  });
}
