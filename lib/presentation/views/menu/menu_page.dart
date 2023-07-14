import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/utils/extensions/layout_adapter_ex.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class MenuPage extends StatefulWidget {
  MenuPage({
    Key? key,
    required this.onMenuItemTapped,
    required this.animation,
  })  : _slideDownAnimation = Tween<Offset>(
          begin: const Offset(0.0, -1),
          end: Offset.zero,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutQuad,
          ),
        ),
        super(key: key);
  final Function(int) onMenuItemTapped;
  final Animation<double> animation;
  final Animation<Offset> _slideDownAnimation;

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> with TickerProviderStateMixin {
  late AnimationController _boxController;
  late AnimationController _colorBoxController;

  List<bool> _menuItemHover = List.filled(ksMenu.length, false);
  final List<double> _menuItemListPositionY = List.filled(ksMenu.length, 0.0);

  late EdgeInsets _padding;
  late double _menuItemHeight;
  final List<Image> _vanGoghImages = List.generate(
    kaMenu.length,
    (index) => Image.asset(kaMenu[index]),
  );
  int currentHoverIndex = -2;

  void _addSizeConfig() {
    _padding = context.symmetricPercentPadding(
      hPercent: context.adaptive<double>(s2, s10, md: s5),
      vPercent: context.adaptive<double>(s20, s12, md: s14),
    );
    double top = _padding.top;
    double bottom = _padding.bottom;
    double menuHeight = context.screenHeight - (top + bottom);
    _menuItemHeight = menuHeight / ksMenu.length;
    for (int i = 0; i < ksMenu.length; i++) {
      _menuItemListPositionY[i] = top + (_menuItemHeight * i);
    }
  }

  void _precacheImages() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (Image vanGoghImage in _vanGoghImages) {
        precacheImage(vanGoghImage.image, context);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _precacheImages();

    _boxController = AnimationController(
      duration: duration100,
      vsync: this,
    )..addStatusListener(boxControllerListener);
    _colorBoxController = AnimationController(
      duration: duration500,
      vsync: this,
    );
  }

  void boxControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _colorBoxController.forward();
    } else if (status == AnimationStatus.dismissed) {
      _colorBoxController.reverse();
    }
  }

  @override
  void dispose() {
    _boxController.dispose();
    _colorBoxController.dispose();
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
    _boxController.forward();
  }

  void dismissSlideContainerAnimation() {
    _boxController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    _addSizeConfig();
    return SlideTransition(
      position: widget._slideDownAnimation,
      child: MouseRegion(
        onHover: onHover,
        onExit: onExit,
        child: <Widget>[
          Visibility(
            visible:
                currentHoverIndex > -1 && currentHoverIndex < ksMenu.length,
            child: VanGoghImage(
              hoveredIndex: currentHoverIndex,
              animation: _boxController.view,
              coloredBoxAnimation: _colorBoxController.view,
              images: _vanGoghImages,
            ),
          ).addAlign(
            alignment: Alignment.centerRight,
          ),
          <Widget>[
            ...createMenuItems(context),
          ].addColumn(),
        ]
            .addStack(
              alignment: Alignment.center,
            )
            .addCenter(),
      ).addContainer(
        height: context.screenHeight,
        padding: _padding,
        color: kPrimary,
      ),
    );
  }

  List<Widget> createMenuItems(BuildContext context) {
    return ksMenu.map((menuItem) {
      int index = ksMenu.indexOf(menuItem);
      return MenuItem(
        label: menuItem.label,
        index: index,
        height: _menuItemHeight,
        isHovered: _menuItemHover[index],
        onTap: () => widget.onMenuItemTapped(index),
      ).addExpanded();
    }).toList();
  }
}
