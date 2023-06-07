import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/menu/menu_page.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../configs/configs.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> with TickerProviderStateMixin {
  bool _isDrawerOpen = false;
  int sectors = 10;
  double screenWidth = 0.0;
  double sectorWidth = 0.0;
  final GlobalKey _globalKey = GlobalKey();
  late AnimationController _menuController;
  late AnimationController _loadingController;
  final List<Interval> _itemSlideIntervals = [];
  Duration get staggeredDuration => duration150;
  Duration get itemSlideDuration => duration1000;
  Duration get labelDuration => duration1000;
  Duration get slideDuration =>
      staggeredDuration + (staggeredDuration * sectors) + itemSlideDuration + duration500;

  void createStaggeredIntervals() {
    for (int i = 0; i < sectors; i++) {
      final Duration start = staggeredDuration + (staggeredDuration * i);
      final Duration end = start + itemSlideDuration;
      _itemSlideIntervals.add(
        Interval(
          start.inMilliseconds / slideDuration.inMilliseconds,
          end.inMilliseconds / slideDuration.inMilliseconds,
        ),
      );
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    createStaggeredIntervals();
    _menuController = AnimationController(
      vsync: this,
      duration: duration1000,
    );
    _loadingController = AnimationController(
      vsync: this,
      duration: slideDuration,
    );
    screenWidth = context.screenWidth;
    sectorWidth = screenWidth / sectors;
  }

  @override
  void dispose() {
    _menuController.dispose();
    _loadingController.dispose();
    super.dispose();
  }

  void onMenuTapped() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
    if (_isDrawerOpen) {
      _menuController.forward();
    } else {
      _menuController.reverse();
    }
  }

  void _handleNavigation(int index) {
    _menuController.reverse().then((value) {
      if (_menuController.status == AnimationStatus.dismissed) {
        _loadingController.forward();
        navigate(index);
      }
    });
  }

  void navigate(int index) {
    _loadingController.addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.pushNamed(
          context,
          ksMenu[index].route,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: const Logo(),
        actions: [
          MenuButton(
            onPressed: onMenuTapped,
            hasMenuTapped: _isDrawerOpen,
          ),
          horizontalSpaceLarge,
        ],
      ),
      body: [
        widget.page,
        MenuPage(
          onMenuItemTapped: _handleNavigation,
          animation: _menuController.view,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ...List.generate(
              sectors,
                  (index) => CustomPageTransition(
                controller: _loadingController,
                height: context.screenHeight,
                width: sectorWidth,
                boxColor: kSecondary,
                coverColor: kPrimary,
                index: index,
                interval: _itemSlideIntervals[index],
              ),
            ),
          ],
        ),
        // CustomSlider(
        //   width: context.screenWidth,
        //   height: context.screenHeight,
        //   animation: _loadingController.view,
        //   interval: const Interval(0, 1),
        // ),
      ].addStack(),
    );
  }
}
