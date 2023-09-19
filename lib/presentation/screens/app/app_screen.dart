// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_route/annotations.dart';
import 'package:delalty/core/services/socket.dart';
import 'package:delalty/presentation/screens/app/pages/chat/chat_page.dart';
import 'package:delalty/presentation/screens/app/pages/home/home_page.dart';
import 'package:delalty/presentation/screens/app/pages/more/more_page.dart';
import 'package:delalty/presentation/screens/app/pages/personal_profile/personal_profile_page.dart';
import 'package:delalty/presentation/screens/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/resources/colors_manager.dart';
import '../../../main.dart';

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
    socket = Socket();
  }

  final data = {
    "op": 0,
    "t": "READY",
    "d": {
      "user": {
        "id": "9",
        "name": "Yousef",
        "image": null,
        "is_admin": false,
        "is_company": false,
        "is_owner": false,
        "roles": [],
        "email": "ym8370302@gmail.com",
        "email_verified_at": "2023-09-14T12:24:21.000Z",
        "phones": [
          {"phone": "+966512345666", "verified_at": "2023-09-14T12:28:08.000Z"}
        ]
      },
      "chats": [],
      "relationships": [],
      "favorites": [
        {
          "id": "20",
          "title": "adwdawdawdaw",
          "description":
              "block yamanblock yamanblock yamanblock yamanblock yamanblock yamanblock yamanblock yaman",
          "price": 12,
          "category_id": "4",
          "visible": true,
          "main_image_id": "dd603413-7875-4462-8b30-ecc531017ad7",
          "values": [
            {"input_id": "3", "value": "dawdawdawdadwadaw2wdawa"},
            {"input_id": "4", "value": 10},
            {"input_id": "5", "value": true}
          ],
          "images": [
            {
              "id": "dd603413-7875-4462-8b30-ecc531017ad7",
              "extension": "png",
              "url": "soild-logo.png"
            }
          ],
          "seller": {
            "id": "5",
            "verified": false,
            "user": {
              "id": "7",
              "name": "Mahmoud Galal",
              "is_admin": true,
              "image": null,
              "is_company": false
            }
          }
        },
        {
          "id": "23",
          "title": "testtesttset",
          "description":
              "test test test testtest testtest testtest testtest testtest test1623893 test testtest testtest testtest test@#@#@test testtest testtest testtest test-=98876546/?????||||\"\"\"\"\"\"<<<MBVCXZASDFGHJKL:\"|",
          "price": 1234,
          "category_id": "1",
          "visible": true,
          "main_image_id": "d7e2c843-fd8a-451a-9f11-6de2ced5dad1",
          "values": [],
          "images": [
            {
              "id": "d7e2c843-fd8a-451a-9f11-6de2ced5dad1",
              "extension": "jpeg",
              "url": "WhatsApp Image 2023-05-25 at 4.19.19 PM.jpeg"
            }
          ],
          "seller": {
            "id": "1",
            "verified": false,
            "user": {
              "id": "1",
              "name": "Abdennour Mez 2",
              "is_admin": true,
              "image": "8b6a95dc-98d4-4e2f-b3a4-290d7f15bdff.png",
              "is_company": false
            }
          }
        }
      ]
    }
  };

  int index = 4;
  final List<Widget> screens = [
    const MorePage(),
    const ChatPage(),
    const Scaffold(),
    const PersonalProfilePage(),
    const HomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            index = 2;
          });
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
    );
  }
}
