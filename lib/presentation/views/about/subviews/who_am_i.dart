import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/about/widgets/left_stick_label.dart';
import 'package:yelwinoo/presentation/views/about/widgets/specialization_text.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({
    super.key,
  });
  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> with TickerProviderStateMixin {
  AnimationController? _textController;
  AnimationController? _earthController;
  AnimationController? _galaxyController;
  AnimationController? _stickController;
  late Animation<Offset> _earthSlideAnimation;
  late Animation<Offset> _galaxySlideAnimation;
  Image myPicture = Image.asset(kaShowcaseStyle);

  @override
  void initState() {
    super.initState();
    _precacheImage();
    _stickController = AnimationController(vsync: this, duration: duration2000)
      ..repeat();
    _textController = AnimationController(
      vsync: this,
      duration: duration2000,
    )..forward();
    _earthController = AnimationController(
      vsync: this,
      duration: duration2870,
    )..repeat(
        reverse: true,
      );
    _galaxyController = AnimationController(
      vsync: this,
      duration: duration4300,
    )..repeat(reverse: true);
    _earthSlideAnimation =
        Tween<Offset>(begin: const Offset(s0, -s08), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _earthController!,
        curve: Curves.easeInOut,
      ),
    );
    _galaxySlideAnimation =
        Tween<Offset>(begin: const Offset(s0, s08), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _galaxyController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  void _precacheImage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(myPicture.image, context);
    });
  }

  @override
  void dispose() {
    if (_textController != null) {
      _textController!
        ..stop()
        ..dispose();
    }
    if (_earthController != null) {
      _earthController!
        ..stop()
        ..dispose();
    }
    if (_galaxyController != null) {
      _galaxyController!
        ..stop()
        ..dispose();
    }
    if (_stickController != null) {
      _stickController!
        ..stop()
        ..dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return context.adaptive(
      mobileVersion(),
      desktopVersion(),
      md: desktopVersion(),
    );
  }

  Widget mobileVersion() {
    return <Widget>[
      Positioned(
        bottom: s0,
        left: s0,
        child: LeftStickLabel(
          textController: _textController!,
          stickController: _stickController!,
        ),
      ),
      Positioned(
        top: context.percentHeight(s10),
        right: context.percentWidth(s8),
        child: OutlinedText(
          text: ksNobody,
          strokeWidth: s1,
          fontSize: s20,
          strokeColor: kSecondary.withOpacity(0.3),
          textColor: kTransparent,
          fontWeight: FontWeight.w900,
        ),
      ),
      Positioned(
        top: s0,
        left: s0,
        right: s0,
        child: Container(
          margin: context.symmetricPercentPadding(hPercent: s8),
          padding: context.percentPadding(t: s10, l: s5, r: s5, b: s5),
          child: const SpecializationText(),
        ),
      ),
      Positioned(
        bottom: s0,
        left: s0,
        right: s0,
        child: <Widget>[
          Positioned(
            bottom: s0,
            left: s0,
            right: s0,
            child: AspectRatio(
              aspectRatio: 12 / 9,
              child: Image(
                image: myPicture.image,
              ),
            ),
          ),
          Positioned(
            left: s50,
            top: context.percentHeight(s10),
            child: SlideTransition(
              position: _earthSlideAnimation,
              child: SvgPicture.asset(
                kaEarth,
                semanticsLabel: 'Earth SVG',
                width: s50,
                height: s50,
              ),
            ),
          ),
          Positioned(
            right: s20,
            top: context.percentHeight(s20),
            child: SlideTransition(
              position: _galaxySlideAnimation,
              child: SvgPicture.asset(
                kaGalaxy,
                semanticsLabel: 'Galaxy SVG',
                width: s50,
                height: s50,
              ),
            ),
          ),
        ]
            .addStack()
            .addSizedBox(
              width: context.screenWidth,
              height: context.percentHeight(s50),
            )
            .addPadding(
              edgeInsets: context.percentPadding(
                r: s6,
              ),
            ),
      ),
    ]
        .addStack(
          alignment: Alignment.centerLeft,
        )
        .addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight -
              Theme.of(context).appBarTheme.toolbarHeight!,
        );
  }

  Widget desktopVersion() {
    return <Widget>[
      Positioned(
        bottom: s0,
        left: s0,
        child: LeftStickLabel(
          textController: _textController!,
          stickController: _stickController!,
        ),
      ),
      Positioned(
        top: context.percentHeight(s10),
        right: context.percentWidth(s8),
        child: OutlinedText(
          text: ksNobody,
          fontSize: s100,
          strokeColor: kSecondary,
          textColor: kTransparent,
          fontWeight: FontWeight.w900,
        ),
      ),
      Container(
        margin: context.symmetricPercentPadding(hPercent: s8),
        padding: context.allPercentPadding(allPercent: s3),
        child: <Widget>[
          const SpecializationText().addCenter().addExpanded(),
          const SizedBox.shrink().addExpanded(),
        ].addRow(),
      ),
      <Widget>[
        AspectRatio(
          aspectRatio: 1,
          child: Image(
            image: myPicture.image,
            height: context.percentHeight(s50),
          ),
        ),
        Positioned(
          left: s0,
          top: context.percentHeight(s32),
          child: SlideTransition(
            position: _earthSlideAnimation,
            child: SvgPicture.asset(
              kaEarth,
              semanticsLabel: 'Earth SVG',
              width: s80,
              height: s80,
            ),
          ),
        ),
        Positioned(
          right: s0,
          top: context.percentHeight(s48),
          child: SlideTransition(
            position: _galaxySlideAnimation,
            child: SvgPicture.asset(
              kaGalaxy,
              semanticsLabel: 'Galaxy SVG',
              width: s80,
              height: s80,
            ),
          ),
        ),
      ]
          .addStack(
            alignment: Alignment.bottomCenter,
          )
          .addSizedBox(
            width: context.percentWidth(s30),
            height: context.screenHeight,
          )
          .addPadding(
              edgeInsets: context.percentPadding(
            r: s6,
          ))
          .addAlign(
            alignment: Alignment.centerRight,
          ),
    ]
        .addStack(
          alignment: Alignment.centerLeft,
        )
        .addSizedBox(
          width: context.screenWidth,
          height: context.screenHeight -
              Theme.of(context).appBarTheme.toolbarHeight!,
        );
  }
}
