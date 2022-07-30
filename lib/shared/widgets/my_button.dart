import 'package:flutter/material.dart';
import 'package:rocket_help/shared/constants.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.onTap,
    required this.label,
    this.enabled = true,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: enabled ? onTap : null,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        height: 45,
        width: double.infinity,
        decoration: BoxDecoration(
          color: enabled
              ? Constants.green700
              : Constants.green700.withOpacity(0.7),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
