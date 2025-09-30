import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final double? width;
  final double? height;
  final double? fontSize;
  final IconData? icon;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue,
    this.width,
    this.height,
    this.fontSize,
    this.icon,
  });

  factory CustomButton.primary({
    required String text,
    required VoidCallback onPressed,
    double? width,
    double? height,
    double? fontSize,
    IconData? icon,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: Colors.blue,
      width: width,
      height: height,
      fontSize: fontSize,
      icon: icon,
    );
  }

  factory CustomButton.secondary({
    required String text,
    required VoidCallback onPressed,
    double? width,
    double? height,
    double? fontSize,
    IconData? icon,
  }) {
    return CustomButton(
      text: text,
      onPressed: onPressed,
      backgroundColor: Colors.grey,
      width: width,
      height: height,
      fontSize: fontSize,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
            ],
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: fontSize ?? 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
