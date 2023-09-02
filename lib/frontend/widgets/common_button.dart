import 'package:flutter/material.dart';


class CommonButton extends StatelessWidget {
  final Text text;
  final VoidCallback onClick;
  final double? width;
  final Color? color;
  final double? height;
  const CommonButton({super.key, required this.text, required this.onClick, this.width, this.color, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: ElevatedButton(onPressed: onClick,
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
              ),
            child: text,
          ),
        ),
    );
  }
}
