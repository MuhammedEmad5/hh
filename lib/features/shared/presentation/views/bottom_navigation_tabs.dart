import 'package:InvoiceF/features/shared/presentation/views/transactions.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../core/constants/colors.dart';
import '../../../../core/presentation/views/example_view.dart';

class BottomNavigationTabs extends StatefulWidget {
  const BottomNavigationTabs({super.key});

  @override
  State<BottomNavigationTabs> createState() => _BottomNavigationTabsState();
}

final PersistentTabController _controller =
    PersistentTabController(initialIndex: 0);
int _currentIndex = 0;

class _BottomNavigationTabsState extends State<BottomNavigationTabs> {
  late AppLocalizations appLocalizations;

  @override
  Widget build(BuildContext context) {
    appLocalizations = AppLocalizations.of(context)!;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.black38,
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 300),
      ),
      onItemSelected: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      navBarStyle: NavBarStyle.style15,
    );
  }

  List<Widget> _buildScreens() {
    return [
      ExampleView(),
      TransactionsView(),
      const ExampleView(),
      ExampleView(),
      ExampleView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.grid_view_rounded),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        title: _controller.index == 0 ? (appLocalizations.dashboard) : null,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.credit_card),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        title: _controller.index == 1 ? (appLocalizations.transactions) : null,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
          icon: const Icon(
            Icons.point_of_sale,
            color: AppColors.onButton,
          ),
          textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          title: _controller.index == 2 ? ("POS") : null,
          activeColorPrimary: AppColors.primaryColor,
          inactiveColorPrimary: Colors.grey,
          onPressed: (a) {
            // InvoiceSellService().initDi();
            // AppNavigation.push(const SellInvoiceDetailsPage(
            //   newIndex: -1,
            //   isHomeCalled: true,
            // ));
          }),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bar_chart),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        title: _controller.index == 3 ? (appLocalizations.reporting) : null,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.domain),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        title: _controller.index == 4 ? (appLocalizations.infraData) : null,
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }
}
