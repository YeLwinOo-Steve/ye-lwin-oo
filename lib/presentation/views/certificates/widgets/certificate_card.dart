import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/configs/configs.dart';
import 'package:yelwinoo/presentation/utils/extensions/context_ex.dart';

class CertificateCard extends StatelessWidget {
  const CertificateCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: kTeal200,
      height: context.percentHeight(s14),
      child: Center(
        child: Text('hello'),
      ),
    );
  }
}
