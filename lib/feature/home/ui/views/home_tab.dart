import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:real_estate_moniepoint_test/core/utils/assets.dart';
import 'package:real_estate_moniepoint_test/core/utils/common.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
import 'package:real_estate_moniepoint_test/core/widgets/app_text.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/widgets/home_bottom_sheet.dart';
import 'package:real_estate_moniepoint_test/feature/home/ui/widgets/auto_expanding_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _containerWidthAnimation;
  late Animation<Offset> _textSlideAnimation;
  late Animation<double> _imageSizeAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _fade2Animation;
  late Animation<double> _appTextSlideAnimation;

  late Animation<double> _scaleAnimation;
  late Animation<int> _numberAnimation;
  late Animation<int> _rentAnimaation;

  late Animation<Offset> _contentSlideAnimation;

  late Animation<double> _textFadeAnimation;

  final _sheetState = GlobalKey<HomeBottomSheetState>();

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 4000),
      vsync: this,
    )..forward().whenComplete(() {
        _sheetState.currentState!.forward();
      });

    _containerWidthAnimation = Tween<double>(begin: 0, end: 190).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeOut),
      ),
    );

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3 + 3 / 1500, 0.6 + 3 / 1500,
            curve: Curves.easeInOut),
      ),
    );

    _fade2Animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3 + 3 / 1500, 0.6 + 3 / 1500,
            curve: Curves.easeInOut),
      ),
    );

    _imageSizeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.easeIn),
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );

    // _appTextSlideAnimation = Tween<Offset>(
    //   begin: const Offset(0, 1),
    //   end: Offset.zero,
    // ).animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.7, 0.9, curve: Curves.easeInOut),
    //   ),
    // );

    _appTextSlideAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 0.9, curve: Curves.easeInOut),
      ),
    );

    _scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeOut),
      ),
    );

    _numberAnimation = IntTween(begin: 0, end: 1034).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _rentAnimaation = IntTween(begin: 0, end: 2212).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.4, 1.0, curve: Curves.easeInOut),
      ),
    );

    _contentSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.9, 1.0, curve: Curves.easeInOut),
      ),
    );

    _textFadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.7, 1.0, curve: Curves.easeIn),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, __) {
        return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kHomeScreenBackgroundColor, kWhite],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Container(
                      height: 60,
                      width: _containerWidthAnimation.value,
                      padding: const EdgeInsets.only(
                          left: 22, right: 22, top: 16, bottom: 16),
                      decoration: BoxDecoration(
                        color: kWhite,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: _shadow,
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          SlideTransition(
                            position: _textSlideAnimation,
                            child: FadeTransition(
                              opacity: _fade2Animation,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    SvgAssets.location,
                                    colorFilter: const ColorFilter.mode(
                                      kTextPrimary,
                                      BlendMode.srcIn,
                                    ),
                                    width: 22,
                                    height: 22,
                                  ),
                                  const SizedBox(width: 5),
                                  const AppText("Saint Petersburg",
                                      size: 15,
                                      color: kTextPrimary,
                                      weight: FontWeight.w500),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      scale: _imageSizeAnimation.value,
                      child: const CircularImageContainer(
                        asset: ImageAssets.obirin,
                        margin: EdgeInsets.all(0),
                        assetSize: 60,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: const AppText(
                    "Hi, Marina",
                    color: kTextPrimary,
                    size: 30,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: AutoExpandingText(
                  animation: _appTextSlideAnimation,
                  text: "let's select your perfect place",
                  style: const TextStyle(
                    height: 1.2,
                    fontSize: 45,
                    color: kContrastColor,
                    fontFamily: "Satoshi",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              _rentInfo,
              const SizedBox(height: 30),
              SlideTransition(
                position: _contentSlideAnimation,
                child: HomeBottomSheet(
                  key: _sheetState,
                  fadeAnimation: _textFadeAnimation,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  List<BoxShadow> get _shadow {
    return [
      const BoxShadow(
        color: kStrokeBorderColor,
        blurRadius: 16.0,
        offset: Offset(0, 2),
        spreadRadius: 0,
      ),
    ];
  }

  Widget get _rentInfo {
    return Transform.scale(
      scale: _scaleAnimation.value,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: kAmountContainerColor),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      const AppText("BUY",
                          color: kWhite, size: 16, weight: FontWeight.w500),
                      const Spacer(),
                      AppText("${_numberAnimation.value}",
                          color: kWhite, size: 36, weight: FontWeight.w700),
                      const AppText("offers",
                          color: kWhite, size: 14, weight: FontWeight.w500),
                      const SizedBox(height: 15),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhite,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: _shadow,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(height: 15),
                      const AppText("RENT",
                          color: kRentColor, size: 16, weight: FontWeight.w500),
                      const Spacer(),
                      AppText("${_rentAnimaation.value}",
                          color: kRentColor, size: 36, weight: FontWeight.w700),
                      const AppText("offers",
                          color: kRentColor, size: 14, weight: FontWeight.w500),
                      const SizedBox(height: 15),
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class OutwardCurvedBottomClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final Path path = Path();
//     path.lineTo(0, size.height);
//     path.arcToPoint(
//       Offset(30, size.height - 30),
//       radius: Radius.circular(30),
//       clockwise: true,
//     );
//     path.lineTo(size.width - 30, size.height - 30);
//     path.arcToPoint(
//       Offset(size.width, size.height),
//       radius: Radius.circular(30),
//       clockwise: true,
//     );
//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);
//     path.close();
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
