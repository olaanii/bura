import 'package:flutter/material.dart';
import 'package:move_delivery/theme/app_colors.dart';

class MoveTopBar extends StatelessWidget {
  const MoveTopBar({
    super.key,
    this.onTapNotifications,
    this.onTapProfile,
  });

  final VoidCallback? onTapNotifications;
  final VoidCallback? onTapProfile;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          _LogoMark(onTap: () {}),
          const SizedBox(width: 10),
          Text(
            'Move.',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          IconButton(
            onPressed: onTapNotifications,
            icon: const Icon(Icons.notifications_none_rounded),
            color: AppColors.white,
            iconSize: 22,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints.tightFor(width: 40, height: 40),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: onTapProfile,
            borderRadius: BorderRadius.circular(999),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: AppColors.grey200,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(color: AppColors.black.withOpacity(0.18), width: 1),
              ),
              child: const Icon(Icons.person, size: 18, color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class _LogoMark extends StatelessWidget {
  const _LogoMark({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: AppColors.yellow,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.north_east_rounded, size: 18, color: AppColors.black),
      ),
    );
  }
}
