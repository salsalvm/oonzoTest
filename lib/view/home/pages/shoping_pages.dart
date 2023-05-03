import 'package:firstcry/data/response/status.dart';
import 'package:firstcry/res/asset/home_images.dart';
import 'package:firstcry/res/styles.dart';
import 'package:firstcry/view/home/widget/carousel_banner.dart';
import 'package:firstcry/view/home/widget/find_location_tile.dart';
import 'package:firstcry/view_model/home_constroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class PageShoping extends StatelessWidget {
  const PageShoping({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const FindLocationTile(),
        Card(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Container(
            width: double.infinity,
            height: 70,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(HomeImages.banner))),
          ),
        ),
        const CarouselBanner(height: 270, img: []),
        Row(
          children: List.generate(2, (index) {
            List<String> img = <String>[
              HomeImages.freeShip,
              HomeImages.dummy,
            ];
            return Card(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Container(
                width: index == 1 ? 75 : 280,
                height: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    image: AssetImage(img[index]),
                  ),
                ),
              ),
            );
          }, growable: true),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
          child: Text(
            'Shop By Category',
            style: KStyle.title(),
          ),
        ),
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (HomeController controller) {
            switch (controller.homeDatas.stauts) {
              case Status.isLoading:
                return const Center(child: CircularProgressIndicator());
              case Status.isError:
                return Center(
                  child: Text(controller.homeDatas.message.toString()),
                );
              case Status.isComplete:
                return GridView.builder(
                  itemCount: controller.homeDatas.data!.products!.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 1 / .65,
                  ),
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        controller.viewProductPage(
                            context, controller.homeDatas.data!.products![i]);
                      },
                      child: Card(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder: HomeImages.logo,
                                placeholderFit: BoxFit.fill,
                                imageErrorBuilder:
                                    (BuildContext context, Object error, _) =>
                                        Container(
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(HomeImages.logo),
                                    ),
                                  ),
                                ),
                                height: 80,
                                alignment: Alignment.center,
                                image: controller
                                    .homeDatas.data!.products![i].thumbnail!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              controller.homeDatas.data!.products![i].title!,
                              style: KStyle.content(),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
            }
            return Container();
          },
        )
      ],
    );
  }
}
