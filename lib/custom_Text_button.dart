import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  CustomTextButton({
    required this.title,
    required this.color,
    this.borderRadius: 2,
    required this.onPressed, this.fSize : false,
  }) : assert(borderRadius != null);
  final String title;
  final Color? color;
  final double borderRadius;
  final VoidCallback? onPressed;
  final bool fSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        // side: const BorderSide(width:3, color:Colors.red), //border width and color
        onPrimary: Colors.white,
        primary: color,
        minimumSize: Size.fromHeight(50),
        padding: EdgeInsets.symmetric(horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      onPressed: onPressed,
      child: Text(title),);
  }
}
