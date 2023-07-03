import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/views/wrapper.dart';

import '../../configs/configs.dart';
import 'widgets/certificate_card.dart';

class CertificatesView extends StatefulWidget {
  const CertificatesView({super.key});

  @override
  State<CertificatesView> createState() => _CertificatesViewState();
}

class _CertificatesViewState extends State<CertificatesView>
    with TickerProviderStateMixin {
  List<AnimationController> _controller = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < ksCertificateList.length; i++) {
      _controller.add(AnimationController(vsync: this, duration: duration500));
    }
  }

  @override
  void dispose() {
    for (var element in _controller) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Wrapper(
      page: GridView.custom(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          pattern: [
            const WovenGridTile(
              1.8 / 1,
            ),
            const WovenGridTile(
              13 / 9,
              crossAxisRatio: 0.95,
              alignment: AlignmentDirectional.centerEnd,
            ),
          ],
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
      )
          .addPadding(edgeInsets: context.allPercentPadding(allPercent: s8))
          .addScrollView(
            physics: const BouncingScrollPhysics(),
          ),
    );
  }
}
