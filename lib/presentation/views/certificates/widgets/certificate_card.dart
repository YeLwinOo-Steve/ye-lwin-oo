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
        end: 0.3,
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
                onPressed: (){},
                icon: Icon(Atlas.arrows_corners_move_thin,)
              ).addPadding(
                edgeInsets: context.allPadding(p: s8,)
              ),
            )
          ),
          Align(
            alignment: Alignment.center,
            child: Opacity(
              opacity: 1 - opacityAnimation.value,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    certificate.name,
                    style: Theme.of(context).textTheme.titleMedium,
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
