// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/services/socket/socket_cubit.dart';
import 'package:delalty/presentation/screens/app/pages/chat/chat_page.dart';
import 'package:delalty/presentation/screens/app/pages/home/cubit/home_cubit.dart';
import 'package:delalty/presentation/screens/app/pages/home/home_page.dart';
import 'package:delalty/presentation/screens/app/pages/more/more_page.dart';
import 'package:delalty/presentation/screens/app/pages/personal_profile/personal_profile_page.dart';
import 'package:delalty/presentation/screens/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/resources/app_context.dart';
import '../../../core/resources/colors_manager.dart';
import '../../../di.dart';

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
  }

  int index = 4;
  final List<Widget> screens = [
    const MorePage(),
    const ChatPage(),
    Container(),
    const PersonalProfilePage(),
    const HomePage(),
  ];

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
                context.router.push(const AllDepartmentsRoute());
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
    SocketCubit.get(ctx).close();
  }
}
