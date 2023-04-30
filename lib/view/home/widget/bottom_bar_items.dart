import 'package:firstcry/view/home/screen_home.dart';
import 'package:flutter/material.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangerNavigator,
      builder: (context, value, _) => BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        currentIndex: indexChangerNavigator.value,
        onTap: (int currentIndex) {
          indexChangerNavigator.value = currentIndex;
        },
        items: List.generate(5, (i) => _bottomBuilderItem(i)),
      ),
    );
  }

//bottom navigation bar item styles
  BottomNavigationBarItem _bottomBuilderItem(int i) {
    //bottom bar item list name and icons
    final List<Icon> inActiveIcons = <Icon>[
      const Icon(
        Icons.home_outlined,
      ),
      const Icon(Icons.play_circle_outline_outlined),
      const Icon(Icons.favorite_outline),
      const Icon(Icons.person_outline_outlined),
      const Icon(Icons.menu)
    ];
    final List<Icon> activIcons = <Icon>[
      const Icon(Icons.home),
      const Icon(Icons.play_circle),
      const Icon(Icons.favorite),
      const Icon(Icons.person),
      const Icon(Icons.menu)
    ];
    final List<String> labelList = <String>[
      'Shopping',
      'Explore',
      'Parenting',
      'Profile',
      'Menu',
    ];

    return BottomNavigationBarItem(
      icon: inActiveIcons[i],
      label: labelList[i],
      activeIcon: activIcons[i],
    );
  }
}
