import 'package:firstcry/res/asset/home_images.dart';
import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:firstcry/view/home/widget/carousel_banner.dart';
import 'package:firstcry/view/home/widget/find_location_tile.dart';
import 'package:firstcry/view/home/widget/main_appbar.dart';
import 'package:firstcry/view_model/home_constroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenProduct extends StatelessWidget {
  const ScreenProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MainAppBar(bottomVisible: false)),
      body: SafeArea(
        child: Obx(
          () => ListView(
            children: <Widget>[
              const FindLocationTile(),
              Stack(
                children: [
                  CarouselBanner(
                      height: 270, img: homeController.product!.value.images!),
                  Positioned(
                      right: 20,
                      top: 10,
                      child: Text(
                        '\u{20B9}${homeController.product!.value.price!}',
                        style: KStyle.heading(color: kWarnning),
                      ))
                ],
              ),
              Card(
                margin: const EdgeInsets.all(10),
                child: Container(
                  width: double.infinity,
                  height: 70,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(HomeImages.banner))),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'New Born Baby Girl Fasion',
                  style: KStyle.title(lineHeight: 1),
                ),
              ),
              Column(
                  children: List.generate(
                      category.length,
                      (index) => Column(children: [
                            const Divider(thickness: 1.3),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 24,
                                    backgroundColor: kLight,
                                    backgroundImage:
                                        AssetImage(categoryImg[index]),
                                  ),
                                  const SizedBox(width: 30),
                                  Text(
                                    category[index],
                                    style: KStyle.title(),
                                  ),
                                  const Spacer(),
                                  const Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    color: kGrey,
                                  )
                                ],
                              ),
                            ),
                          ])))
            ],
          ),
        ),
      ),
    );
  }
}

List<String> category = <String>[
  'Splash In Summer',
  'Baby Girl Cloth',
  'Budget Store',
  'Splash In Summer',
  'Baby Girl Cloth',
  'Budget Store',
  'Splash In Summer',
  'Baby Girl Cloth',
  'Budget Store',
];
List<String> categoryImg = [
  HomeImages.all,
  HomeImages.men,
  HomeImages.girl,
  HomeImages.expecting,
  HomeImages.all,
  HomeImages.men,
  HomeImages.girl,
  HomeImages.expecting,
  HomeImages.all,
];
