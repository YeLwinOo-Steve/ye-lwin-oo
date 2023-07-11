import 'dart:math';
import 'package:flutter/material.dart';
import 'package:type_text/type_rich_text.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class CodeBlock extends StatefulWidget {
  const CodeBlock({Key? key}) : super(key: key);

  @override
  State<CodeBlock> createState() => _CodeBlockState();
}

class _CodeBlockState extends State<CodeBlock>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _slideEditor;
  @override
  void initState() {
    _controller = AnimationController(
      duration: duration3000,
      vsync: this,
    )..forward();
    _slideEditor = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      AnimatedBuilder(
        builder: (context, child) {
          return Positioned(
            left: _slideEditor.value,
            top: _slideEditor.value,
            child: child!,
          );
        },
        animation: _slideEditor,
        child: Opacity(
            opacity: 0.4,
            child: Editor(
              isBackground: true,
            )),
      ),
      Editor(),
    ].addStack();
  }
}

class Editor extends StatelessWidget {
  Editor({
    Key? key,
    this.isBackground = false,
  }) : super(key: key);
  final bool isBackground;
  final btnColors = [
    kYellow,
    kGreen,
    kRed,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: s400,
      height: s250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          width: s1,
          color: kBlack12,
        ),
        color: kBlack,
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
      child: isBackground
          ? noSpace
          : <Widget>[
              <Widget>[
                ...btnColors.map(
                  (color) {
                    return Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          kiCircle,
                          size: s14,
                          color: color,
                        ),
                        horizontalSpaceSmall,
                      ],
                    );
                  },
                ).toList(),
              ]
                  .addRow(
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                  .addAlign(
                    alignment: Alignment.topRight,
                  ),
              TypeRichText(
                text: TextSpan(
                  text: '\$ find / name -"life.dart"\n\n',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: kWhite,
                      ),
                  children: <TextSpan>[
                    TextSpan(
                      text: '> Searching . . .\n\n',
                      style: TextStyle(
                        color: kSecondary,
                      ),
                    ),
                    const TextSpan(
                      text: '> Error: No life is found!\n\n',
                      style: TextStyle(
                        color: kRed,
                      ),
                    ),
                    const TextSpan(
                      text: "> Since you are a programmer, you have no life!",
                      style: TextStyle(
                        color: kRed,
                      ),
                    ),
                  ],
                ),
                duration: duration5000,
              ),
            ].addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
    );
  }
}
