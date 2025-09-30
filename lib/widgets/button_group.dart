import 'package:flutter/material.dart';
import 'custom_button.dart';

class ButtonGroup extends StatelessWidget {
  final VoidCallback onMaterialPressed;
  final VoidCallback onCupertinoPressed;

  const ButtonGroup({
    super.key,
    required this.onMaterialPressed,
    required this.onCupertinoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          text: 'Book (Material)',
          onPressed: onMaterialPressed,
        ),
        const SizedBox(height: 20),
        CustomButton(
          text: 'Book (Cupertino)',
          onPressed: onCupertinoPressed,
        ),
      ],
    );
  }
}
