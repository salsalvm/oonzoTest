import 'package:firstcry/res/asset/home_images.dart';
import 'package:firstcry/res/colors.dart';
import 'package:firstcry/res/styles.dart';
import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({
    Key? key,
    required this.bottomVisible,
  }) : super(key: key);
  final bool bottomVisible;
  @override
  Widget build(BuildContext context) {
    List<IconData> icon = <IconData>[
      Icons.search_sharp,
      Icons.favorite_outline,
      Icons.shopping_cart_outlined,
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: AppBar(
        leadingWidth: 90,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage(HomeImages.logo))),
          ),
        ),
        actions: List.generate(
          3,
          (i) => _actionIcons(icon: icon[i], countVisisble: i == 2 && true),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Visibility(
              visible: bottomVisible,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        5, (index) => circleAvatahrStatus(index))),
              ),
            )),
      ),
    );
  }

  circleAvatahrStatus(int index) {
    List<String> genderFasion = [
      'Add Child',
      'All',
      'Boy',
      'Female',
      'Expecting'
    ];
    List<String> icon = [
      HomeImages.add,
      HomeImages.all,
      HomeImages.men,
      HomeImages.girl,
      HomeImages.expecting,
    ];
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: kLight,
          backgroundImage: AssetImage(icon[index]),
        ),
        const SizedBox(height: 5),
        Text(
          genderFasion[index],
          style: KStyle.content(size: 11),
        )
      ],
    );
  }

  Stack _actionIcons({required IconData icon, bool countVisisble = false}) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: kGrey,
          ),
        ),
        Visibility(
          visible: countVisisble,
          child: Positioned(
            top: 2,
            right: 13,
            child: Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  color: kYellow, borderRadius: BorderRadius.circular(5)),
              child: Text(
                '0',
                style: KStyle.content(),
              ),
            ),
          ),
        )
      ],
    );
  }
}
