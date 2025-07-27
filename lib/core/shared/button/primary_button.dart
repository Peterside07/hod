import 'package:flutter/material.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/core/utils/dims.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isActive;
  final bool isHovered;
  final Color? color;
  final Color? textColor;

  const PrimaryButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.isActive = false,
    this.isHovered = false,
    this.color,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    Color background = onPressed == null
        ? appColor.grey_500 // Disabled
        : isHovered
            ? appColor.primary_700
            : isActive
                ? appColor.primary_600
                : appColor.primary_500;
    if (color != null) {
      background = color!;
    }

    return InkWell(
      onTap: onPressed,
      child: Container(

        height: 52,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: background,
          borderRadius: BorderRadius.circular(Dims.buttonRadius),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor ?? appColor.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}


class PrimaryButtonWithIcon extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Widget icon;
  final bool isPrimary;

  const PrimaryButtonWithIcon({
    super.key,
    required this.onPressed,
    required this.label,
    required this.icon,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    final bgColor = isPrimary ? appColor.primary : Colors.transparent;
    final borderColor = isPrimary ? Colors.transparent : appColor.grey_500;
    final textColor = isPrimary ? appColor.white : appColor.grey_900;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 10),
            Text(
              label,
              style:  Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: textColor,
                    fontWeight: FontWeight.w500,
                     fontSize: 16,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

