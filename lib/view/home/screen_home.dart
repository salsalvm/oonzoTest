import 'package:firstcry/view/home/pages/explore_pages.dart';
import 'package:firstcry/view/home/pages/menu_pages.dart';
import 'package:firstcry/view/home/pages/parenting_pages.dart';
import 'package:firstcry/view/home/pages/profile_page.dart';
import 'package:firstcry/view/home/pages/shoping_pages.dart';
import 'package:firstcry/view/home/widget/bottom_bar_items.dart';
import 'package:firstcry/view/home/widget/main_appbar.dart';
import 'package:flutter/material.dart';

ValueNotifier<int> indexChangerNavigator = ValueNotifier<int>(0);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangerNavigator,
      builder: (context, value, _) {
        return Scaffold(
          appBar: PreferredSize(
              preferredSize:
                  Size.fromHeight(indexChangerNavigator.value == 0 ? 120 : 56),
              child: MainAppBar(
                onTap: () {},
                bottomVisible: indexChangerNavigator.value == 0 ? true : false,
              )),
          body: SafeArea(
            child: Builder(
              builder: (BuildContext context) {
                switch (indexChangerNavigator.value) {
                  case 0:
                    return const PageShoping();
                  case 1:
                    return const PageExplore();
                  case 2:
                    return const PageParenting();
                  case 3:
                    return const PageProfile();
                  case 4:
                    return const PageMenu();
                  default:
                    return Container();
                }
              },
            ),
          ),
          bottomNavigationBar: const BottomNavItems(),
        );
      },
    );
  }
}
