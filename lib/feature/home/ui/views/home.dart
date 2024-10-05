import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_moniepoint_test/core/utils/assets.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/home_tab.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/views/location_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const route = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  int _currentIndex = 2;
  late AnimationController _controller;

  late Animation<Offset> _tabIconsAnimation;
  late AnimationController _tabIconsController;

  final pages = [
    (icon: SvgAssets.search, widget: const LocationMapScreen()),
    (icon: SvgAssets.message, widget: const Center(child: Text('n/a'))),
    (icon: SvgAssets.home, widget: const HomeScreen()),
    (icon: SvgAssets.message, widget: const Center(child: Text('n/a'))),
    (icon: SvgAssets.message, widget: const Center(child: Text('n/a'))),
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    _tabIconsController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _tabIconsAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _tabIconsController,
      curve: Curves.easeInOut,
    ));

    _controller.forward().whenComplete(() {
      Future.delayed(const Duration(seconds: 4), () {
        _tabIconsController.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabIconsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: pages[_currentIndex].widget,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return FadeTransition(opacity: animation, child: child);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _tabIconsAnimation,
              child: Container(
                height: 60,
                margin: const EdgeInsets.only(bottom: 40),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kBottomTabColor,
                  borderRadius: BorderRadius.circular(90),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (var i = 0; i < pages.length; i++) ...{
                      _tabIcons(i, pages[i].icon),
                      if (i != pages.length - 1) ...{
                        const SizedBox(width: 5),
                      }
                    }
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabIcons(int index, String icon) {
    return GestureDetector(
      onTap: () {
        Future.microtask(() {
          setState(() => _currentIndex = index);
          _controller.forward(from: 0);
        });
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInCirc,
            width: _currentIndex == index ? 50 : 44,
            height: _currentIndex == index ? 50 : 44,
            decoration: BoxDecoration(
              color: _currentIndex == index
                  ? kBottomContainerSwitchTabColor
                  : kBottomContainerTabColor,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(icon, width: 24, height: 24),
            ),
          ),
          if (_currentIndex == index)
            ScaleTransition(
              scale: Tween<double>(begin: 1.0, end: 0.0).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeOutCirc,
                ),
              ),
              child: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
