import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class WhoAmI extends StatefulWidget {
  const WhoAmI({super.key});

  @override
  State<WhoAmI> createState() => _WhoAmIState();
}

class _WhoAmIState extends State<WhoAmI> with TickerProviderStateMixin {
  late AnimationController _textController;
  late AnimationController _earthController;
  late AnimationController _galaxyController;
  late Animation<Offset> _earthSlideAnimation;
  late Animation<Offset> _galaxySlideAnimation;
  Image myPicture = Image.asset(kaShowcaseStyle);
  @override
  void initState() {
    super.initState();
    _precacheImage();
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
        parent: _earthController,
        curve: Curves.easeInOut,
      ),
    );
    _galaxySlideAnimation =
        Tween<Offset>(begin: const Offset(s0, s08), end: Offset.zero).animate(
      CurvedAnimation(
        parent: _galaxyController,
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
    _textController.dispose();
    _earthController.dispose();
    _galaxyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      Align(
        alignment: Alignment.centerLeft,
        child: RotatedBox(
          quarterTurns: 3,
          child: AnimatedTextSlideBoxTransition(
            text: ksAboutMe.toUpperCase(),
            controller: _textController,
            coverColor: kPrimary,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
        ).addPadding(
            edgeInsets: context.symmetricPadding(
          h: s40,
        )),
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
          Text(
            "I specialize in Mobile Technologies and highly passionate about developing quality applications & open-source works.",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: kBlack,
                ),
            textScaleFactor: context.textScaleFactor(),
          ).addExpanded(),
          const SizedBox.shrink().addExpanded(),
        ].addRow(),
      ),
      <Widget>[
        AspectRatio(
          aspectRatio: 9 / 16,
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
        Align(
          alignment: Alignment.centerRight,
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
          )
          .addPadding(
              edgeInsets: context.percentPadding(
            r: s6,
          ))
          .addAlign(
            alignment: Alignment.centerRight,
          ),
    ].addStack(
      alignment: Alignment.centerLeft,
    );
  }
}
