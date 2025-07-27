import 'package:flutter/material.dart';
import 'package:hodtech/core/utils/colors.dart';
import 'package:hodtech/core/utils/dims.dart';

class PrimaryTextField extends StatelessWidget {
  final String label;
  final String placeholder;
  final String? errorText;
  final bool enabled;
  final TextEditingController? controller;
  final bool readOnly;
  final Widget? suffixIcon;
  final VoidCallback? onTap;

  const PrimaryTextField({
    super.key,
    required this.label,
    required this.placeholder,
    this.errorText,
    this.enabled = true,
    this.controller,
    this.readOnly = false,
    this.suffixIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.titleSmall?.copyWith(
            color: enabled ? appColor.grey_900 : appColor.grey_500,
          ),
        ),
        const SizedBox(height: 6),
        SizedBox(
          height: 52,
          child: TextFormField(
            controller: controller,
            enabled: enabled,
            readOnly: readOnly,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: TextStyle(
                color: enabled ? appColor.grey_600 : appColor.grey_500,
                fontWeight: FontWeight.w400,
              ),
              suffixIcon: suffixIcon,
              filled: true,
              fillColor: enabled
                  ? appColor.white
                  : appColor.grey_500,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dims.inputRadius),
                borderSide: BorderSide(color: appColor.grey_500),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dims.inputRadius),
                borderSide: BorderSide(color: appColor.grey_500),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dims.inputRadius),
                borderSide: BorderSide(color: appColor.primary_500, width: 1.5),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dims.inputRadius),
                borderSide: BorderSide(color: appColor.error, width: 1.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(Dims.inputRadius),
                borderSide: BorderSide(color: appColor.error, width: 1.5),
              ),
              errorText: errorText,
            ),
            style: TextStyle(
              color: enabled ? appColor.grey_900 : appColor.grey_500,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
