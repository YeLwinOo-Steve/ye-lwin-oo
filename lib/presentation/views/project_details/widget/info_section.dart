import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/project_info.dart';
import 'package:yelwinoo/presentation/configs/constant_sizes.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';
import 'package:yelwinoo/presentation/widgets/widgets.dart';

import '../../../configs/configs.dart';

class InfoSection extends StatelessWidget {
  InfoSection({
    super.key,
    required this.controller,
    required this.info,
  })  : _slideUpAnimation =
            Tween<Offset>(begin: const Offset(s0, s1), end: Offset.zero)
                .animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        ),
        _fadeAnimation = Tween<double>(begin: s0, end: s1).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeInOut,
          ),
        );
  final AnimationController controller;
  final Animation<Offset> _slideUpAnimation;
  final Animation<double> _fadeAnimation;
  final ProjectInfo info;
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      IconLabel(
        icon: info.icon,
        controller: controller,
        label: info.label,
        coverColor: kPrimary,
        textStyle: context
            .adaptive(Theme.of(context).textTheme.bodyMedium,
                Theme.of(context).textTheme.bodyLarge)
            ?.copyWith(
              fontWeight: FontWeight.w700,
            ),
      ),
      verticalSpaceLarge,
      ...info.contents.map(
        (content) {
          return FadeTransition(
            opacity: _fadeAnimation,
            child: SlideTransition(
              position: _slideUpAnimation,
              child: GestureDetector(
                onTap: () => content.launchWebsite(),
                child: Text(
                  info.isTag == true
                      ? content.prefixHash()
                      : content.prefixDash(),
                  style: TextStyle(
                    decoration: info.isLink == true
                        ? TextDecoration.underline
                        : TextDecoration.none,
                    decorationColor: kBlack26,
                  ),
                ).addPadding(
                  edgeInsets: context.padding(
                    l: 2 * horizontalSpaceMassive.width!,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    ]
        .addColumn(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .addPadding(
          edgeInsets: context.padding(
            r: context.adaptive(s10, s100),
            b: context.adaptive(s10, s50),
          ),
        );
  }
}
