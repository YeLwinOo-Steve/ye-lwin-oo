
import 'dart:math';

import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/widgets/animated_text_slide_box_transition.dart';

import '../widgets/animated_slide_transtion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = PageController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          Transform(
            transform: Matrix4.rotationY(pi),
            child: const Icon(
              Atlas.two_line_bold,
              size: 50.0,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
        child: PageView(
          controller: _pageController,
          scrollDirection: Axis.vertical,
          physics: const RangeMaintainingScrollPhysics(),
          onPageChanged: (int page) {
            _pageController.animateToPage(page,
                duration: const Duration(milliseconds: 800),
                curve: Curves.elasticInOut);
          },
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                HeadlineText(),
              ],
            ),
            const SecondPage(),
          ],
        ),
      ),
    );
  }
}

class HeadlineText extends StatefulWidget {
  const HeadlineText({Key? key}) : super(key: key);

  @override
  State<HeadlineText> createState() => _HeadlineTextState();
}

class _HeadlineTextState extends State<HeadlineText>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final AnimationController _controller2;
  late Animation<Offset> _slideAnimation;
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
    _slideAnimation =
        Tween<Offset>(begin: const Offset(0, 1), end: const Offset(0, 0))
            .animate(
          CurvedAnimation(
            parent: _controller,
            curve: const Interval(0.6, 1.0, curve: Curves.ease),
          ),
        );
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
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: 0,
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
                    color: Colors.grey.shade100,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.shade100,
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
                const SizedBox(height: 30,),
                AnimatedTextSlideBoxTransition(
                  controller: _controller,
                  text: "I'm Ye Lwin Oo",
                  textStyle:
                  Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 70,),
                Stack(
                  children: [
                    Positioned(
                      left: 0,
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 40.0),
                        decoration: const BoxDecoration(
                          color: Colors.yellow,
                        ),
                        child: Center(
                          child: Row(
                            children: [
                              Text(
                                'Yoh Yoh',
                                style: TextStyle(color: Colors.yellow),
                              ),
                              const SizedBox(
                                width: 5.0,
                              ),
                              Icon(Icons.arrow_right_alt,color: Colors.yellow,),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 5, bottom: 5),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 40.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.teal,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Text('Yoh Yoh'),
                            const SizedBox(
                              width: 5.0,
                            ),
                            Icon(Icons.arrow_right_alt),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Container(
              width: 400,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  width: 1,
                  color: Colors.black12,
                ),
                color: Colors.black,
              ),
              padding: const EdgeInsets.all(12.0),
              margin:
              const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(
                          Icons.circle,
                          size: 16,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Icon(
                          Icons.circle,
                          size: 16,
                          color: Colors.green,
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        Icon(
                          Icons.circle,
                          size: 16,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double halfHeight = MediaQuery.of(context).size.height * 0.5 - kToolbarHeight;
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.5,
                height: halfHeight,
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.teal,
                          height: halfHeight * 0.8,
                          margin: const EdgeInsets.only(left: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.teal,
                          height: halfHeight * 0.8,
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.teal,
                          height: halfHeight * 0.8,
                          margin: const EdgeInsets.only(right: 25),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: AnimatedSlideTranstion(
                controller: _controller,
                beginOffset: const Offset(1, 0),
                targetOffset: Offset(0, 0),
                child: Container(
                  height: halfHeight,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        AnimatedSlideTranstion(
          controller: _controller,
          beginOffset: Offset(-1, 0),
          targetOffset: Offset(-0.5, 0),
          child: Container(
            height: halfHeight,
            width: double.maxFinite,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}
