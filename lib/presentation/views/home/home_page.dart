import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import 'introduction_page.dart';
import 'showcase_projects_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  List<Widget> mainPages = [];
  final _key = GlobalKey();
  int page = 0;
  int pageLength = 3;
  bool _isDrawerOpen = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    mainPages = const [
      IntroductionPage(),
      ShowcaseProjectsPage(),
      FooterPage(),
    ];
  }

  // // void _handleScroll(Offset delta) {
  // //   if (delta.dy > s150 && page < pageLength) {
  // //     page++;
  // //   } else {
  // //     page--;
  // //   }
  // //   _animateToPage();
  // // }
  //
  // void _animateToPage() {
  //   // WidgetsBinding.instance.addPostFrameCallback((_) {
  //   //   _scrollController.animateTo(page * _screenHeight,
  //   //       duration: duration1000, curve: Curves.easeInOut);
  //   // });
  // }

  void onMenuTapped() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: Listener(
        // onPointerSignal: (PointerSignalEvent event) {
        //   if (event is PointerScrollEvent) {
        //     _handleScroll(event.scrollDelta);
        //   }
        // },
        child: PageView(
          key: _key,
          physics: const AlwaysScrollableScrollPhysics(),
          // controller: _scrollController,
          scrollDirection: Axis.vertical,
          children: mainPages,
        ),
      ),
    );
  }
}
