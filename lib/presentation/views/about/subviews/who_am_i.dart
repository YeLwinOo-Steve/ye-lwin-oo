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

  @override
  void initState() {
    super.initState();
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
              fontWeight: FontWeight.w400,
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
        color: kBlack,
        margin: context.symmetricPercentPadding(hPercent: s8),
        padding: context.allPercentPadding(allPercent: s3),
        height: context.percentHeight(s50),
        child: <Widget>[
          <Widget>[
            Text(
              ksWhoAmI,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: kWhite,
                  ),
            ),
            verticalSpaceLarge,
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: kWhite,
                  ),
            ),
          ]
              .addColumn(
                crossAxisAlignment: CrossAxisAlignment.start,
              )
              .addExpanded(),
          const SizedBox.shrink().addExpanded(),
        ].addRow(),
      ),
      <Widget>[
        SlideTransition(
          position: _earthSlideAnimation,
          child: SvgPicture.asset(
            kaEarth,
            semanticsLabel: 'Earth SVG',
            width: s80,
            height: s80,
          ),
        ),
        horizontalSpaceMassive,
        SlideTransition(
          position: _galaxySlideAnimation,
          child: SvgPicture.asset(
            kaGalaxy,
            semanticsLabel: 'Galaxy SVG',
            width: s80,
            height: s80,
          ),
        ),
      ]
          .addRow(
            mainAxisSize: MainAxisSize.min,
          )
          .addAlign(
            alignment: Alignment.centerRight,
          ),
    ].addStack(
      alignment: Alignment.centerLeft,
    );
  }
}
