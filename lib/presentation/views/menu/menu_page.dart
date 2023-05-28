import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class MenuPage extends StatefulWidget {
  MenuPage({Key? key, required this.animation})
      : _slideDownAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut,
          ),
        ),
        super(key: key);
  final Animation<double> animation;
  final Animation<Offset> _slideDownAnimation;
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  List<bool> _menuItemHover = List.filled(ksMenu.length, false);
  final List<double> _menuItemListPositionY = List.filled(ksMenu.length, 0.0);

  late EdgeInsets _padding;
  late double _menuItemHeight;
  int currentHoverIndex = -2;

  void _addSizeConfig() {
    _padding = context.symmetricPercentPadding(
      hPercent: s10,
      vPercent: s10,
    );
    double top = _padding.top;
    double bottom = _padding.bottom;
    double menuHeight = context.screenHeight - (top + bottom);
    _menuItemHeight = menuHeight / ksMenu.length;
    for (int i = 0; i < ksMenu.length; i++) {
      _menuItemListPositionY[i] = top + (_menuItemHeight * i);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController = AnimationController(
      duration: duration200,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onHover(PointerHoverEvent event) {
    double y = event.position.dy;
    int index = _menuItemListPositionY.lastIndexWhere((itemY) => y >= itemY);
    if (index != -1) {
      currentHoverIndex = index;
      startSlideContainerAnimation();
      _menuItemHover = List.filled(ksMenu.length, false);
      _menuItemHover[index] = true;
      setState(() {});
    }
  }

  void onExit(PointerExitEvent event) {
    _menuItemHover = List.filled(ksMenu.length, false);
    dismissSlideContainerAnimation();
    setState(() {});
  }

  void startSlideContainerAnimation() {
    _animationController.forward();
  }

  void dismissSlideContainerAnimation() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _addSizeConfig();
    return SlideTransition(
      position: widget._slideDownAnimation,
      child: Container(
        height: context.screenHeight,
        padding: _padding,
        color: kPrimary,
        child: MouseRegion(
          onHover: onHover,
          onExit: onExit,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Visibility(
                    visible: currentHoverIndex > -1 &&
                        currentHoverIndex < ksMenu.length,
                    child: VanGoghImage(
                      hoveredIndex: currentHoverIndex,
                      animation: _animationController.view,
                    ),
                  ),
                ),
                Column(
                  children: [
                    ...createMenuItems(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> createMenuItems(BuildContext context) {
    return ksMenu.map((menuItem) {
      int index = ksMenu.indexOf(menuItem);
      return MenuItem(
        label: menuItem,
        index: index,
        height: _menuItemHeight,
        isHovered: _menuItemHover[index],
      );
    }).toList();
  }
}
