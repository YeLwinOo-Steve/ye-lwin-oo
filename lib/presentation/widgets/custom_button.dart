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
        child: Stack(
          children: [
            AnimatedPositioned(
              left: _isHovered ? s8 : s0,
              bottom: _isHovered ? s8 : s0,
              duration: const Duration(milliseconds: d300),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: s14,
                  horizontal: s42,
                ),
                decoration: BoxDecoration(
                  color: widget.shadowColor ?? kBlue100,
                  border: Border.all(
                    color: widget.shadowColor ?? kBlue100,
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        widget.label.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: widget.shadowColor ?? kBlue100,
                            ),
                      ),
                      customSpace(w: _isHovered ? s10 : s5),
                      Icon(
                        widget.icon,
                        color: widget.shadowColor ?? kBlue100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: s8, bottom: s8),
              padding:
                  const EdgeInsets.symmetric(vertical: s14, horizontal: s42),
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.foregroundColor,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    Text(
                      widget.label.toUpperCase(),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    AnimatedContainer(
                      width: _isHovered ? s10 : s5,
                      duration: const Duration(milliseconds: d300),
                      curve: Curves.easeInOut,
                    ),
                    Icon(
                      widget.icon,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
