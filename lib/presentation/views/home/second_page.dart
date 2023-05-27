import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';
import 'package:yelwinoo/presentation/widgets/animated_slide_transtion.dart';

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
    double halfHeight =
        MediaQuery.of(context).size.height * 0.5 - kToolbarHeight;
    return Padding(
      padding: context.symmetricPercentPadding(
        hPercent: 10,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  width: double.maxFinite,
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
                  targetOffset: const Offset(0, 0),
                  child: Container(
                    height: halfHeight,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: AnimatedSlideTranstion(
                  controller: _controller,
                  beginOffset: const Offset(-1, 0),
                  targetOffset: const Offset(0, 0),
                  child: Container(
                    height: halfHeight,
                    color: Colors.black,
                  ),
                ),
              ),
              const Expanded(child: SizedBox(),),
            ],
          )
        ],
      ),
    );
  }
}
