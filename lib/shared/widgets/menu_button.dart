import 'package:flutter/material.dart';
import 'package:rocket_help/shared/constants.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.color = Constants.gray600,
    this.selected = false,
  }) : super(key: key);

  final String label;
  final VoidCallback onTap;
  final bool selected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          height: 28,
          decoration: BoxDecoration(
            color: Constants.gray600,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: selected ? color : Constants.gray600,
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: selected ? color : Constants.gray300,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
