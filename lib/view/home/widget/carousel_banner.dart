import 'package:carousel_slider/carousel_slider.dart';
import 'package:firstcry/res/asset/home_images.dart';
import 'package:flutter/material.dart';

class CarouselBanner extends StatelessWidget {
  const CarouselBanner({
    super.key,
    required this.height,
    this.fraction = 1.4,
    required this.img,
    this.autoCurveType = Curves.easeIn,
  });
  final Curve autoCurveType;
  final double height;
  final List<String> img;
  final double fraction;
  @override
  Widget build(BuildContext context) {
    List<String> banner = [
      HomeImages.carousel1,
      HomeImages.carousel2,
      HomeImages.carousel1,
    ];
    return CarouselSlider.builder(
      itemCount: img.isEmpty ? 3 : img.length,
      itemBuilder: (BuildContext context, int index, _) {
        return FadeInImage.assetNetwork(
          placeholder: HomeImages.logo,
          placeholderCacheHeight: 1,
          placeholderCacheWidth: 1,
          placeholderFit: BoxFit.fill,
          imageErrorBuilder: (BuildContext context, _, __) =>
              Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(banner[index]),
              ),
            ),
          ),
          height: 80,
          alignment: Alignment.center,
          image: img.isEmpty ? '' : img[index],
          fit: BoxFit.fill,
        );
        //  Container(
        //   // width: double.infinity,
        //   // height: height,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(image: AssetImage(banner[index]))),
        // );
      },
      options: CarouselOptions(
        autoPlay: true,
        height: height,
        autoPlayCurve: autoCurveType,
        autoPlayInterval: const Duration(seconds: 5),
        animateToClosest: true,
        enlargeCenterPage: true,
        viewportFraction: fraction,
      ),
    );
  }
}
