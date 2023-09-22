import 'dart:io';

import '../cubit/account_verification_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/common/components/widgets/cached_image.dart';
import '../../../../core/common/components/widgets/country_picker_button.dart';
import '../../../../core/common/components/widgets/my_elevated_button.dart';
import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/common/components/widgets/titled_form_field.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../../../../core/resources/strings_manager.dart';

part 'account_verification_form_fields.dart';
part 'checking_document_widget.dart';
part 'provide_application_documentation_widget.dart';
part 'account_verification_body.dart';
part 'account_verification_data.dart';
part 'account_verification_steps_bars.dart';
part 'account_verification_id_images.dart';
part 'id_card_image.dart';
