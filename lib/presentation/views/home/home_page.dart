import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../configs/configs.dart';
import 'introduction_page.dart';
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
              children: const [IntroductionPage(), SecondPage()],
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
