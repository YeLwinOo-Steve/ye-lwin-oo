import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';


class IntroductionPage extends StatefulWidget {
  const IntroductionPage({Key? key}) : super(key: key);

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _controller2;
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
    // _slideAnimation =
    //     Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
    //         .animate(
    //   CurvedAnimation(
    //     parent: _controller,
    //     curve: const Interval(0.6, 1.0, curve: Curves.ease),
    //   ),
    // );
    _controller.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
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
    return Padding(
      padding: context.symmetricPercentPadding(
        hPercent: 10,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 350,
            height: 350,
            child: Stack(
              children: [
                ScaleTransition(
                  scale: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kBlue100,
                    ),
                  ),
                ),
                ScaleTransition(
                  scale: Tween<double>(
                    begin: 0,
                    end: 1,
                  ).animate(
                    CurvedAnimation(
                      parent: _controller2,
                      curve: Curves.fastOutSlowIn,
                    ),
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: kWhite,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  AnimatedTextSlideBoxTransition(
                    controller: _controller,
                    coverColor: Theme.of(context).scaffoldBackgroundColor,
                    text: "Flutter Developer &",
                    textStyle:
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  AnimatedTextSlideBoxTransition(
                    controller: _controller,
                    coverColor: Theme.of(context).scaffoldBackgroundColor,
                    text: "AI/ML Enthusiast",
                    textStyle:
                    Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: 50,
                      color: Colors.black,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  AnimatedTextSlideBoxTransition(
                    controller: _controller,
                    text: "I'm Ye Lwin Oo",
                    textStyle:
                    Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const CustomButton(),
                ],
              ),
              const CodeBlock(),
            ],
          ),
        ],
      ),
    );
  }
}
