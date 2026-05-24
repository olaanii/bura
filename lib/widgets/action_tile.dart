import 'package:flutter/material.dart';
import 'package:move_delivery/theme/app_colors.dart';

class ActionTile extends StatelessWidget {
  const ActionTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.variant = ActionTileVariant.light,
    this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final ActionTileVariant variant;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = variant == ActionTileVariant.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(18),
      child: Ink(
        height: 94,
        decoration: BoxDecoration(
          color: isDark ? AppColors.black : AppColors.white,
          borderRadius: BorderRadius.circular(18),
          border: isDark
              ? null
              : Border.all(
                  color: AppColors.black.withValues(alpha: 0.08), width: 1),
        ),
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                          color: isDark ? AppColors.white : AppColors.black,
                        ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDark
                              ? AppColors.white.withValues(alpha: 0.70)
                              : AppColors.grey500,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Icon(icon,
                size: 34, color: isDark ? AppColors.white : AppColors.black),
          ],
        ),
      ),
    );
  }
}

enum ActionTileVariant { light, dark }
