import 'package:flutter/material.dart';
import 'package:yelwinoo/presentation/utils/extensions/extensions.dart';

import '../configs/configs.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    required this.label,
    this.bgColor = kWhite,
    this.foregroundColor = kBlack,
    this.shadowColor,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);
  final String label;
  final Color bgColor;
  final Color foregroundColor;
  final Color? shadowColor;
  final VoidCallback onPressed;
  final IconData icon;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final labelStyle = context.adaptive(Theme.of(context).textTheme.bodySmall,
        Theme.of(context).textTheme.bodyMedium);
    return GestureDetector(
      onTap: widget.onPressed,
      child: MouseRegion(
        onHover: (PointerEvent event) {
          setState(() {
            _isHovered = true;
          });
        },
        onExit: (PointerEvent event) {
          setState(() {
            _isHovered = false;
          });
        },
        child: <Widget>[
          AnimatedPositioned(
            left: _isHovered ? s8 : s0,
            bottom: _isHovered ? s8 : s0,
            duration: const Duration(milliseconds: d300),
            child: <Widget>[
              Text(
                widget.label.toUpperCase(),
                style: labelStyle?.copyWith(
                  color: widget.shadowColor ?? kSecondary,
                ),
              ),
              customSpace(w: _isHovered ? s10 : s5),
              Icon(
                widget.icon,
                color: widget.shadowColor ?? kSecondary,
              ),
            ].addRow().addCenter().addContainer(
                  padding: EdgeInsets.symmetric(
                    vertical: context.adaptive(s6, s14),
                    horizontal: context.adaptive(s24, s42),
                  ),
                  decoration: BoxDecoration(
                    color: widget.shadowColor ?? kSecondary,
                    border: Border.all(
                      color: widget.shadowColor ?? kSecondary,
                    ),
                  ),
                ),
          ),
          <Widget>[
            Text(
              widget.label.toUpperCase(),
              style: labelStyle,
            ),
            AnimatedContainer(
              width: _isHovered ? s10 : s5,
              duration: const Duration(milliseconds: d300),
              curve: Curves.easeInOut,
            ),
            Icon(
              widget.icon,
            ),
          ].addRow().addCenter().addContainer(
                margin: const EdgeInsets.only(left: s8, bottom: s8),
                padding: EdgeInsets.symmetric(
                  vertical: context.adaptive(s6, s14),
                  horizontal: context.adaptive(s24, s42),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: widget.foregroundColor,
                  ),
                ),
              ),
        ].addStack(),
      ),
    );
  }
}
