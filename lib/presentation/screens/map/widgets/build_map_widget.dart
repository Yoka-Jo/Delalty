import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/my_outlined_button.dart';
import 'package:delalty/core/common/components/widgets/real_estate_features.dart';
import 'package:delalty/core/resources/routes/app_router.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:delalty/presentation/screens/map/widgets/custom_marker_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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
  BitmapDescriptor? customMarkerIcon;
  final Map<String, Marker> _markers = {};
  bool _isLoaded = false;
  bool _isPoped = false;

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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _onBuildComplete());
  }

  Future<void> _onBuildComplete() async {
    await Future.wait(data.map(
      (value) async {
        Marker marker = await _generateMarkersFromWidgets(value);
        _markers[marker.markerId.value] = marker;
      },
    ));
    setState(() {
      _isLoaded = true;
    });
  }

  Future<Marker> _generateMarkersFromWidgets(Map<String, dynamic> data) async {
    return await Future.delayed(const Duration(milliseconds: 30), () async {
      RenderRepaintBoundary boundary = data['globalKey']
          .currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 4);

      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      return Marker(
        markerId: MarkerId(data['id']),
        position: data['position'],
        icon: BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoaded) {
      return ListView(
        children: [
          for (int i = 0; i < data.length; i++)
            Transform.translate(
              offset: Offset(
                -MediaQuery.sizeOf(context).width * 2,
                -MediaQuery.sizeOf(context).height * 2,
              ),
              child: RepaintBoundary(
                key: data[i]['globalKey'],
                child: data[i]['widget'],
              ),
            ),
        ],
      );
    }
    return WillPopScope(
      onWillPop: () async {
        setState(() {
          _isPoped = true;
        });
        return true;
      },
      child: Visibility(
        visible: !_isPoped,
        child: GoogleMap(
          mapType: MapType.normal,
          markers: _markers.values.toSet(),
          myLocationEnabled: true,
          zoomControlsEnabled: false,
          myLocationButtonEnabled: false,
          initialCameraPosition: widget.cameraPosition,
          onMapCreated: (GoogleMapController controller) {
            // if (Theme.of(context).brightness == Brightness.dark) {
            //   controller.setMapStyle(Constants.googleMapDarkTheme);
            // }
            widget.mapController.complete(controller);
          },
        ),
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
                  Image.asset(
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
                        context.router.push(const ConversationRoute());
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
