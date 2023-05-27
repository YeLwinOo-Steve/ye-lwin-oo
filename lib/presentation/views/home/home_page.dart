import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';
import 'second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final _scrollController = PageController();
  final _key = GlobalKey();
  int page = 0;
  final int pageLength = 2;
  late double _screenHeight;
  bool _isDrawerOpen = false;
  late AnimationController _animationController;
  late Animation<Offset> _animation;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, -1.2),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _screenHeight = MediaQuery.of(context).size.height;
  }

  void _handleScroll(Offset delta) {
    if (delta.dy > 50 && page < pageLength) {
      page++;
    } else {
      page--;
    }
    _animateToPage();
  }

  void _animateToPage() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(page * _screenHeight,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void onMenuTapped() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
    if (_isDrawerOpen) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Logo(),
        actions: [
          MenuButton(
            onPressed: onMenuTapped,
            hasMenuTapped: _isDrawerOpen,
          ),
        ],
      ),
      body: Stack(
        children: [
          Listener(
            onPointerSignal: (PointerSignalEvent event) {
              if (event is PointerScrollEvent) {
                _handleScroll(event.scrollDelta);
              }
            },
            child: PageView(
              key: _key,
              physics: const ClampingScrollPhysics(),
              controller: _scrollController,
              scrollDirection: Axis.vertical,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    HeadlineText(),
                  ],
                ),
                Padding(
                    padding: context.symmetricPercentPadding(
                      hPercent: 10,
                    ),
                    child: const SecondPage())
              ],
            ),
          ),
          SlideTransition(
            position: _animation,
            child: Container(
              height: size.height,
              color: kPrimary,
              child: const Center(
                child: Text(
                  'Drawer Content',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
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
