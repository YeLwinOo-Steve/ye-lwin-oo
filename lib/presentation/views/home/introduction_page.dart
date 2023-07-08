import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key, required this.onTapSeeMyWorks})
      : super(key: key);
  final VoidCallback onTapSeeMyWorks;
  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controller2;
  late Animation<double> blueCircleTween;
  late Animation<double> whiteCircleTween;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _controller.forward();
    blueCircleTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    whiteCircleTween = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastOutSlowIn,
      ),
    );
    Future.delayed(duration500, () {
      _controller2.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      <Widget>[
        ScaleTransition(
          scale: blueCircleTween,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kSecondary,
            ),
          ),
        ),
        ScaleTransition(
          scale: whiteCircleTween,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kWhite,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(s0, s0),
                  blurRadius: s50,
                  spreadRadius: s05,
                  color: kSecondary,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
          ),
        ),
      ].addStack().addSizedBox(
            width: s400,
            height: s400,
          ),
      <Widget>[
        <Widget>[
          AnimatedTextSlideBoxTransition(
            controller: _controller,
            coverColor: Theme.of(context).scaffoldBackgroundColor,
            text: ksFlutterDeveloperAnd,
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
          AnimatedTextSlideBoxTransition(
            controller: _controller,
            coverColor: Theme.of(context).scaffoldBackgroundColor,
            text: ksAiEnthusiast,
            textStyle: Theme.of(context).textTheme.headlineSmall,
          ),
          verticalSpaceMassive,
          AnimatedTextSlideBoxTransition(
            controller: _controller,
            text: ksIntro,
            coverColor: Theme.of(context).scaffoldBackgroundColor,
            textStyle: Theme.of(context).textTheme.bodyLarge,
            width: context.screenWidth * 0.3,
            maxLines: 4,
          ),
          verticalSpaceMassive,
          CustomButton(
            label: ksSeeMyWork,
            onPressed: widget.onTapSeeMyWorks,
            icon: kiArrowForward,
          ),
          context.percentSizedBox(pHeight: s10),
          <Widget>[
            AnimatedHoverLink(
              label: ksGithub,
              controller: _controller,
            ).addInkWell(
              onTap: ksGithubLink.launchWebsite,
            ),
            const Text(ksSlash).addCenter().addSizedBox(
                  width: s50,
                ),
            AnimatedHoverLink(
              label: ksLinkedIn,
              controller: _controller,
            ).addInkWell(
              onTap: ksLinkedInLink.launchWebsite,
            ),
            const Text(ksSlash).addCenter().addSizedBox(
                  width: s50,
                ),
            AnimatedHoverLink(
              label: ksDiscord,
              controller: _controller,
            ).addInkWell(
              onTap: ksDiscordLink.launchWebsite,
            ),
          ].addRow(),
        ].addColumn(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        const CodeBlock(),
      ].addRow(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
      ),
    ]
        .addStack(
          alignment: Alignment.center,
        )
        .addPadding(
          edgeInsets: context.symmetricPercentPadding(
            hPercent: 10,
          ),
        )
        .addSizedBox(
          height: context.screenHeight - context.appBarTheme().toolbarHeight!,
          width: context.screenWidth,
        );
  }
}
