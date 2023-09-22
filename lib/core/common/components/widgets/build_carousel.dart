// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delalty/core/common/components/widgets/simple_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../resources/assets_manager.dart';
import 'cached_image.dart';

class BuildCarousel extends StatefulWidget {
  final bool showFavouriteButton;
  final bool showIfOnlyOneImage;
  final EdgeInsets numberOfImagesMargin;
  final double height;
  final List<dynamic> images;
  final void Function(int)? onSwipe;
  const BuildCarousel({
    Key? key,
    this.showFavouriteButton = true,
    this.showIfOnlyOneImage = true,
    required this.numberOfImagesMargin,
    required this.height,
    required this.images,
    this.onSwipe,
  }) : super(key: key);

  @override
  State<BuildCarousel> createState() => _BuildCarouselState();
}

class _BuildCarouselState extends State<BuildCarousel> {
  int imageIndex = 0;

  List<dynamic> get images => widget.images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.r),
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  setState(() {
                    imageIndex = index;
                  });
                  if (widget.onSwipe != null) {
                    widget.onSwipe!(index);
                  }
                },
                height: widget.height,
                initialPage: 0,
                viewportFraction: 1,
                scrollDirection: Axis.horizontal,
              ),
              items: images
                  .map(
                    (image) => ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: images[0] is String
                          ? CachedImage(
                              url: image,
                              fit: BoxFit.cover,
                              height: 156.h,
                              width: double.infinity,
                            )
                          : Image.file(
                              image,
                              fit: BoxFit.cover,
                              height: 156.h,
                              width: double.infinity,
                            ),
                    ),
                  )
                  .toList(),
            ),
            if (widget.showFavouriteButton)
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.all(10.h),
                  margin: EdgeInsets.all(5.h),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(
                      width: 1,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ),
                  child: SvgPicture.asset(
                    ImageAssets.favourite,
                  ),
                ),
              ),
            if (widget.showIfOnlyOneImage)
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                    height: 20.h,
                    width: 32.w,
                    padding: const EdgeInsets.all(1),
                    margin: widget.numberOfImagesMargin,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: Colors.white.withOpacity(0.26),
                    ),
                    child: Center(
                      child: SimpleText(
                        '${imageIndex + 1}/${images.length}',
                        textStyle: TextStyleEnum.poppinsRegular,
                        fontSize: 10.sp,
                      ),
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
