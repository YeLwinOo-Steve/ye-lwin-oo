import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    _slideEditor = Tween<double>(
      begin: 0,
      end: -20,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return [
      AnimatedBuilder(
        builder: (context, child) {
          return Positioned(
            left: _slideEditor.value,
            top: _slideEditor.value,
            child: child!,
          );
        },
        animation: _slideEditor,
        child: const Opacity(
            opacity: 0.4,
            child: Editor(
              isBackground: true,
            )),
      ),
      const Editor(),
    ].addStack();
  }
}

class Editor extends StatelessWidget {
  const Editor({
    Key? key,
    this.isBackground = false,
  }) : super(key: key);
  final bool isBackground;
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
        color: Colors.black,
      ),
      padding: const EdgeInsets.all(12.0),
      margin: const EdgeInsets.only(left: 25.0, top: 25.0, bottom: 25.0),
      child: isBackground
          ? const SizedBox.shrink()
          : [
              const [
                Icon(
                  Icons.circle,
                  size: 16,
                  color: kYellow,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.circle,
                  size: 16,
                  color: kGreen,
                ),
                SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.circle,
                  size: 16,
                  color: kRed,
                ),
              ]
                  .addRow(
                    mainAxisAlignment: MainAxisAlignment.end,
                  )
                  .addAlign(
                    alignment: Alignment.topRight,
                  ),
              const Text(
                "\$ find / name -\"life.dart\"",
                style: TextStyle(
                  color: kWhite,
                ),
              ),
              Text(
                "> Searching . . .",
                style: TextStyle(
                  color: kSecondary,
                ),
              ),
              const Text(
                "> Error: No life is found!",
                style: TextStyle(
                  color: kRed,
                ),
              ),
              const Text(
                "> Since you are a programmer, you have no life!",
                style: TextStyle(
                  color: kRed,
                ),
              ),
              const Text(
                "\$ _",
                style: TextStyle(
                  color: kWhite,
                ),
              ),
            ].addColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
    );
  }
}
