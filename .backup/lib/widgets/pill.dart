import 'package:flutter/material.dart';
import 'package:move_delivery/theme/app_colors.dart';

class Pill extends StatelessWidget {
  const Pill({
    super.key,
    required this.label,
    required this.background,
    this.foreground,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
    this.textStyle,
  });

  final String label;
  final Color background;
  final Color? foreground;
  final EdgeInsets padding;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final resolvedForeground =
        foreground ?? (background == AppColors.black ? AppColors.white : AppColors.black);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Padding(
        padding: padding,
        child: Text(
          label,
          style: (textStyle ?? Theme.of(context).textTheme.labelMedium)?.copyWith(
            color: resolvedForeground,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
