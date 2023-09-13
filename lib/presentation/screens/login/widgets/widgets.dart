import 'package:auto_route/auto_route.dart';
import 'package:delalty/app/functions.dart';
import 'package:delalty/core/common/components/widgets/simple_toast.dart';
import 'package:delalty/core/resources/colors_manager.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/components/widgets/default_text_form_field.dart';
import '../../../../core/common/components/widgets/form_fields_icons/lock_icon.dart';
import '../../../../core/common/components/widgets/form_fields_icons/mail_icon.dart';
import '../../../../core/common/components/widgets/loading_button.dart';
import '../../../../core/common/components/widgets/login_social_media.dart';
import '../../../../core/common/components/widgets/or_divider_widget.dart';
import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/resources/strings_manager.dart';
import '../cubit/login_cubit.dart';

part 'login_body.dart';
part 'login_title.dart';
part 'login_form_fields.dart';
part 'login_button.dart';
part 'login_forgot_password.dart';
part 'login_create_account.dart';
