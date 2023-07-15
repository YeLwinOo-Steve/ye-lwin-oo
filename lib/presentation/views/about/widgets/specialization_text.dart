import 'package:flutter/material.dart';
import 'package:type_text/type_text.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../../../configs/configs.dart';

class SpecializationText extends StatelessWidget {
  const SpecializationText({super.key});

  @override
  Widget build(BuildContext context) {
    return TypeText(
      ksSpecialization,
      style: context
          .adaptive(Theme.of(context).textTheme.bodyLarge,
              Theme.of(context).textTheme.titleSmall)
          ?.copyWith(
            fontWeight: FontWeight.w300,
            color: kBlack,
          ),
      textAlign: TextAlign.center,
      duration: duration2000,
    );
  }
}
