// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/simple_toast.dart';
import 'package:delalty/core/services/socket/socket_cubit.dart';
import 'package:delalty/presentation/screens/app/pages/chat/chat_page.dart';
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart';
import 'package:delalty/presentation/screens/app/pages/home/home_page.dart';
import 'package:delalty/presentation/screens/app/pages/more/more_page.dart';
import 'package:delalty/presentation/screens/app/pages/personal_profile/personal_profile_page.dart';
import 'package:delalty/presentation/screens/app/widgets/widgets.dart';
import 'package:delalty/presentation/screens/favorite/cubit/favorite_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/components/widgets/my_elevated_button.dart';
import '../../../core/common/components/widgets/simple_text.dart';
import '../../../core/resources/app_context.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../core/resources/routes/app_router.dart';
import '../../../core/resources/strings_manager.dart';
import '../../../di.dart';
import 'cubit/app_cubit.dart';

@RoutePage()
class AppScreen extends StatefulWidget {
  const AppScreen({super.key});

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    super.initState();
    SocketCubit.get(context).initialzeSocket();
    FavoriteCubit.get(context).getFavorites();
  }

  int index = 4;
  final List<Widget> screens = [
    const MorePage(),
    const ChatPage(),
    Container(),
    const PersonalProfilePage(),
    const HomePage(),
  ];

  void becomeSellerDialog() {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog.adaptive(
        title: SimpleText(
          AppStrings.becomeSeller.tr(context: context),
          textStyle: TextStyleEnum.montserratBold,
          fontSize: 18.sp,
        ),
        content: SimpleText(
          '',
          textStyle: TextStyleEnum.montserratMedium,
          fontSize: 15.sp,
        ),
        actions: [
          BlocConsumer<AppCubit, AppState>(
            listener: (context, state) {
              if (state is AppBecomeSellerFailure) {
                SimpleToast.showSimpleToast(
                  msg: state.message,
                  state: ToastStates.error,
                );
              }
              if (state is AppBecomeSellerSuccess) {
                context.router
                    .popUntil((route) => route.settings.name == "AppRoute");
                SimpleToast.showSimpleToast(
                  msg: AppStrings.youHaveBecomeSellerNow.tr(context: context),
                  state: ToastStates.error,
                );
              }
            },
            builder: (context, state) {
              return Center(
                child: MyElevatedButton(
                  isLoading: state is AppBecomeSellerLoading,
                  title: AppStrings.ok.tr(context: context),
                  onPressed: () async {
                    await AppCubit.get(context).becomeSeller();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>(),
      child: Builder(builder: (context) {
        return WillPopScope(
          onWillPop: () async {
            HomeCubit.get(context).reInitializeFields();
            return true;
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: screens[index],
            extendBody: true,
            bottomNavigationBar: BottomNavBarWidget(
              onTap: (value) {
                setState(() {
                  index = value;
                });
              },
              index: index,
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (AppCubit.get(context).user.seller == null) {
                  becomeSellerDialog();
                } else {
                  context.router.push(
                      AllDepartmentsRoute(homeCubit: HomeCubit.get(context)));
                }
              },
              backgroundColor: AppColors.primaryColor,
              child: Container(
                height: 25.r,
                width: 25.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 2,
                    color: Colors.white,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 18.r,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    super.dispose();
    final ctx = AppContext.context;
    SocketCubit.get(ctx).dispose();
  }
}
