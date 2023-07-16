import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';
import 'package:yelwinoo/presentation/widgets/animated_horizontal_stick.dart';
import 'package:yelwinoo/presentation/widgets/animated_text_slide_box_transition.dart';

import '../../configs/configs.dart';
import 'widgets/certificate_card.dart';

class CertificatesView extends StatefulWidget {
  const CertificatesView({super.key});

  @override
  State<CertificatesView> createState() => _CertificatesViewState();
}

class _CertificatesViewState extends State<CertificatesView>
    with TickerProviderStateMixin {
  late AnimationController _stickController;
  final List<AnimationController> _controller = [];
  late AnimationController _textController;
  @override
  void initState() {
    super.initState();
    _stickController = AnimationController(vsync: this, duration: duration500)
      ..forward()
      ..addStatusListener(stickControllerListener);
    _textController = AnimationController(vsync: this, duration: duration1000);
    for (int i = 0; i < ksCertificateList.length; i++) {
      _controller.add(AnimationController(vsync: this, duration: duration500));
    }
  }

  void stickControllerListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      _textController.forward();
    }
  }

  @override
  void dispose() {
    for (var element in _controller) {
      element.dispose();
    }
    _stickController.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: <Widget>[
        <Widget>[
          AnimatedHorizontalStick(controller: _stickController),
          horizontalSpaceMedium,
          AnimatedTextSlideBoxTransition(
            controller: _textController,
            text: ksCertificates,
            textStyle: context.adaptive(
              Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.titleSmall,
            ),
            coverColor: kPrimary,
          ),
        ].addRow(),
        GridView.custom(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: context.adaptive(1, 2),
            childAspectRatio: 16 / 9,
            mainAxisSpacing: s10,
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            childCount: ksCertificateList.length,
            (context, index) => AnimationConfiguration.staggeredList(
              position: index,
              duration: duration2000,
              child: SlideAnimation(
                verticalOffset: s50,
                curve: Curves.easeInOut,
                child: FadeInAnimation(
                  child: CertificateCard(
                    key: ValueKey(index.toString()),
                    animation: _controller[index],
                    certificate: ksCertificateList[index],
                    onHover: (isHovered) {
                      if (isHovered) {
                        _controller[index].forward();
                      } else {
                        if (!_controller[index].isDismissed) {
                          _controller[index].reverse();
                        }
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ]
          .addColumn()
          .addPadding(
            edgeInsets: context.symmetricPercentPadding(
              hPercent: context.adaptive(s10, s8),
              vPercent: context.adaptive(s14, s12),
            ),
          )
          .addScrollView(
            physics: const BouncingScrollPhysics(),
          ),
    );
  }
}
