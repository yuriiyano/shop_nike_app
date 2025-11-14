import 'package:flutter/material.dart';

import 'package:shop_nike_app/localization/index.dart';
import 'package:shop_nike_app/router/index.dart';
import 'package:shop_nike_app/widgets/index.dart';
import 'package:shop_nike_app/styles/index.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      endDrawer: const AppDrawer(),
      routes: const [
        DashboardRoute(),
        ShopRoute(),
        FavouritesRoute(),
        SettingsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return DecoratedBox(
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                spreadRadius: 1,
                blurRadius: 3,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              const BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Assets.images.shop.favorite.svg(
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    Color.fromARGB(255, 118, 118, 118),
                    BlendMode.srcIn,
                  ),
                ),
                activeIcon: Assets.images.shop.favorite.svg(
                  width: 18,
                  height: 18,
                  colorFilter: const ColorFilter.mode(
                    Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
                label: 'Favourites',
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: context.tr(LocaleKeys.settings),
              ),
            ],
          ),
        );
      },
    );
  }
}
