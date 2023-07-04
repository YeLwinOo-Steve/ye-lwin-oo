import 'package:atlas_icons/atlas_icons.dart';
import 'package:flutter/material.dart';
import 'package:yelwinoo/data/model/certificate.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({
    super.key,
    required this.animation,
    required this.onHover,
    required this.certificate,
  });
  final Certificate certificate;
  final Animation<double> animation;
  final Function(bool) onHover;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => onHover(true),
      onExit: (_) => onHover(false),
      child: AnimatedCertificateImage(
        animation: animation,
        certificate: certificate,
      ),
    );
  }
}

class AnimatedCertificateImage extends AnimatedWidget {
  const AnimatedCertificateImage({
    super.key,
    required this.animation,
    required this.certificate,
  }) : super(listenable: animation);
  final Animation<double> animation;
  final Certificate certificate;

  Animation<double> get curvedAnimation =>
      CurvedAnimation(parent: animation, curve: Curves.easeInOut);

  Animation<double> get opacityAnimation => Tween<double>(
        begin: s1,
        end: 0.2,
      ).animate(curvedAnimation);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(s14),
      ),
      child: Stack(
        children: [
          Opacity(
            opacity: opacityAnimation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(s14),
              child: Image.asset(
                certificate.image,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: double.maxFinite,
              ),
            ),
          ),
          Align(
              alignment: Alignment.topRight,
              child: Opacity(
                opacity: 1 - opacityAnimation.value,
                child: IconButton(
                  onPressed: () {
                    showDialog<void>(
                      context: context,
                      barrierDismissible: true,
                      // false = user must tap button, true = tap outside dialog
                      builder: (BuildContext dialogContext) {
                        return AlertDialog(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                certificate.name,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              IconButton(
                                onPressed: () {
                                  Navigator.of(dialogContext).pop();
                                },
                                icon: const Icon(Atlas.xmark_circle),
                              ),
                            ],
                          ),
                          content: AspectRatio(
                            aspectRatio: 9 / 10,
                            child: Image.asset(
                              certificate.image,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Atlas.arrows_corners_move_thin,
                  ),
                ).addPadding(
                    edgeInsets: context.allPadding(
                  p: s8,
                )),
              )),
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 1 - opacityAnimation.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    certificate.name,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpaceMedium,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
