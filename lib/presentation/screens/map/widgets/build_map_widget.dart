import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/my_outlined_button.dart';
import 'package:delalty/core/common/components/widgets/real_estate_features.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/presentation/screens/map/widgets/custom_marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:custom_map_markers/custom_map_markers.dart';
import '../../../../core/common/components/widgets/build_carousel.dart';
import '../../../../core/common/components/widgets/simple_text.dart';
import '../../../../core/common/components/widgets/user_image.dart';
import '../../../../core/common/components/widgets/user_rating.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';

class BuildMapWidget extends StatefulWidget {
  const BuildMapWidget({
    Key? key,
    required this.cameraPosition,
    required this.mapController,
  }) : super(key: key);
  final CameraPosition cameraPosition;
  final Completer<GoogleMapController> mapController;

  @override
  State<BuildMapWidget> createState() => _BuildMapWidgetState();
}

class _BuildMapWidgetState extends State<BuildMapWidget> {
  bool _isPoped = false;
  bool isMapCompleted = false;

  List<Map<String, dynamic>> data = [
    {
      'id': '1',
      'globalKey': GlobalKey(),
      'position': const LatLng(31.4240395, 31.0414531),
      'widget':
          const CustomMarkerIcon(title: 'Town House for sale in Sheikh Zayed'),
    },
    {
      'id': '2',
      'globalKey': GlobalKey(),
      'position': const LatLng(31.4240395, 31.0414531),
      'widget': const CustomMarkerIcon(title: 'Another Marker'),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _isPoped = true;
        });
        return true;
      },
      child: Visibility(
        visible: !_isPoped,
        child: CustomGoogleMapMarkerBuilder(
            customMarkers: [
              MarkerData(
                marker: Marker(
                    markerId: MarkerId(data[0]['id']),
                    position: data[0]['position']),
                child: data[0]['widget'],
              ),
              MarkerData(
                marker: Marker(
                    markerId: MarkerId(data[1]['id']),
                    position: data[1]['position']),
                child: data[1]['widget'],
              ),
            ],
            builder: (BuildContext context, Set<Marker>? markers) {
              if (markers == null) {
                return const SizedBox.shrink();
              }
              return GoogleMap(
                mapType: MapType.normal,
                // markers: _markers.values.toSet(),
                markers: markers,
                myLocationEnabled: true,
                zoomControlsEnabled: false,
                myLocationButtonEnabled: false,
                initialCameraPosition: widget.cameraPosition,
                onMapCreated: (GoogleMapController controller) {
                  // if (Theme.of(context).brightness == Brightness.dark) {
                  //   controller.setMapStyle(Constants.googleMapDarkTheme);
                  // }
                  if (!isMapCompleted) {
                    setState(() {
                      isMapCompleted = true;
                    });
                    widget.mapController.complete(controller);
                  }
                },
              );
            }),
      ),
    );
  }

  Future buildBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            25.r,
          ),
          topLeft: Radius.circular(
            25.r,
          ),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: context.router.pop,
                child: Icon(
                  Icons.close,
                  color: AppColors.grey3,
                  size: 18.r,
                ),
              ),
              SizedBox(height: 20.h),
              BuildCarousel(
                images: const [],
                numberOfImagesMargin:
                    EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                height: 156.h,
              ),
              SizedBox(height: 10.h),
              SimpleText(
                'Town House for sale in Sheikh Zayed',
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 13.sp,
              ),
              SizedBox(height: 7.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleText(
                    'EGP 6,000,000',
                    textStyle: TextStyleEnum.poppinsSemiBold,
                    fontSize: 14.sp,
                  ),
                  const RealEstateFeatures(
                    area: 200,
                    bedsNumber: 4,
                    bathroomsNumber: 3,
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              Row(
                children: [
                  SvgPicture.asset(
                    ImageAssets.locationPin,
                    height: 10.r,
                    width: 10.r,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: 2.w),
                  SimpleText(
                    "Egypt . Cairo",
                    textStyle: TextStyleEnum.poppinsMedium,
                    fontSize: 10.sp,
                    color: AppColors.primaryColor,
                  ),
                ],
              ),
              SizedBox(height: 11.h),
              const Divider(),
              SizedBox(height: 24.h),
              Row(
                children: [
                  UserImage(
                    image:
                        'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    circleSize: 80.r,
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SimpleText(
                        'Ahmed Mustafa',
                        textStyle: TextStyleEnum.poppinsMedium,
                        fontSize: 15.sp,
                      ),
                      const UserRating(rating: 5),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 78.w,
                    height: 28.h,
                    child: MyOutlinedButton(
                      onPressed: () {
                        context.router.push(ConversationRoute(chatId: ''));
                      },
                      title: AppStrings.chat,
                      titleColor: AppColors.primaryColor,
                      titleSize: 10.sp,
                      titleStyle: TextStyleEnum.poppinsRegular,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        );
      },
    );
  }
}
