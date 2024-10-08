import 'package:auto_route/auto_route.dart';
import '../../../../app/extensions.dart';
import '../../../../core/common/components/widgets/centered_circular_progress_indicator.dart';
import '../../../../core/resources/localization/cubit/change_language_cubit.dart';
import '../../../../core/resources/routes/app_router.dart';
import '../cubit/view_product_section_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../../core/common/components/widgets/form_fields_icons/search_icon.dart';
import '../../../../core/common/components/widgets/product_card/product_card_widget.dart';
import '../../../../core/common/components/widgets/real_estate_features.dart';
import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

part 'build_outlined_button.dart';
part 'view_product_section_body.dart';
part 'view_product_section_buttons.dart';
part 'view_product_section_filter_button.dart';
part 'view_product_section_form_field.dart';
part 'view_product_section_list_of_products.dart';
