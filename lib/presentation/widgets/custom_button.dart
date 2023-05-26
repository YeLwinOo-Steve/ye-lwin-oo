import 'package:flutter/material.dart';

import '../configs/configs.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({Key? key}) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('hello my love - yoh yoh');
      },
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
              left: _isHovered ? 7 : 0,
              bottom: _isHovered ? 7 : 0,
              duration: const Duration(milliseconds: 500),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 40.0),
                decoration: BoxDecoration(
                  color: kBlue100,
                  border: Border.all(
                    color: kBlue100,
                  ),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Text(
                        'Yoh Yoh',
                        style: TextStyle(color: kBlue100),
                      ),
                      SizedBox(
                        width: _isHovered ? 10.0 : 5.0,
                      ),
                      Icon(
                        Icons.arrow_right_alt,
                        color: kBlue100,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 7, bottom: 7),
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 40.0),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Text('Yoh Yoh'),
                    AnimatedContainer(
                      width: _isHovered ? 10.0 : 5.0,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    const Icon(Icons.arrow_right_alt),
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
