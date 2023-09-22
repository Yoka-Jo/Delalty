import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:delalty/core/common/components/widgets/back_icon_widget.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:delalty/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/colors_manager.dart';
import '../widgets/build_map_widget.dart';

@RoutePage()
class MapScreen extends StatefulWidget {
  const MapScreen({Key? key, required this.longitude, required this.latitude})
      : super(key: key);
  final double longitude;
  final double latitude;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _mapController = Completer();

  late final CameraPosition _cameraPosition;

  @override
  void initState() {
    super.initState();
    _cameraPosition = CameraPosition(
      bearing: 0.0,
      target: LatLng(widget.latitude, widget.longitude),
      tilt: 0.0,
      zoom: 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80.h,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(25.r),
          ),
        ),
        elevation: 0.0,
        leading: const BackIconWidget(),
        titleSpacing: 0,
        title: Container(
          margin: EdgeInsets.only(right: 16.w),
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppColors.searchFormFieldColor,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              width: 1,
              color: Colors.black.withOpacity(0.15),
            ),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                ImageAssets.locationPin,
                width: 16.r,
                height: 16.r,
                color: Colors.black,
              ),
              SizedBox(
                width: 10.w,
              ),
              SimpleText(
                AppStrings.placesNearYou,
                textStyle: TextStyleEnum.poppinsRegular,
                fontSize: 15.sp,
              )
            ],
          ),
        ),
      ),
      body: BuildMapWidget(
        cameraPosition: _cameraPosition,
        mapController: _mapController,
      ),
    );
  }
}
