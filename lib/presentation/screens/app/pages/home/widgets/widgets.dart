import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/build_shimmer_widget.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../app/constants.dart';
import '../../../../../../core/common/components/widgets/cached_image.dart';
import '../../../../../../core/common/components/widgets/category_widget.dart';
import '../../../../../../core/common/components/widgets/centered_circular_progress_indicator.dart';
import '../../../../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../../../../core/common/components/widgets/product_card/product_card_widget.dart';
import '../../../../../../core/common/components/widgets/simple_text.dart';
import '../../../../../../core/resources/assets_manager.dart';
import '../../../../../../core/resources/colors_manager.dart';
import '../../../../../../core/resources/strings_manager.dart';
import '../../../models/category_model.dart';

part 'home_appbar.dart';
part 'home_best_categories.dart';
part 'home_trending_categories.dart';
part 'home_prodcuts.dart';
part 'home_cateogries.dart';
part 'home_categories_list.dart';
part 'home_explore_categories_and_watch_more.dart';
part 'home_container.dart';
part 'home_search_form_field.dart';
