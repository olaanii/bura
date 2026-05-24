import 'package:flutter/material.dart';
import 'package:move_delivery/theme/app_colors.dart';
import 'package:move_delivery/widgets/map_backdrop.dart';
import 'package:move_delivery/widgets/pill.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 52, 16, 16),
              child: MapBackdrop(
                  cornerRadius: 32, blur: true, showCenterPin: false),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: Align(
                alignment: Alignment.topLeft,
                child: _BackButton(
                  onTap: () => Navigator.of(context).maybePop(),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: _DetailsCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
            color: AppColors.black.withValues(alpha: 0.06), width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Order AB-846861',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                ),
              ),
              const Pill(
                label: 'Paid',
                background: AppColors.grey100,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Tracking number',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.grey500,
                  ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    '1641498165216486',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                          color: AppColors.white,
                          letterSpacing: 0.2,
                        ),
                  ),
                ),
                Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: AppColors.white.withValues(alpha: 0.16),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.copy_rounded,
                      size: 18, color: AppColors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          const _KeyValueRow(
              label: 'Address', value: '350 Main St, San Francisco, CA'),
          const SizedBox(height: 10),
          const _KeyValueRow(label: 'Recipient', value: 'Daniel Foster'),
          const SizedBox(height: 10),
          const _KeyValueRow(label: 'Phone', value: '+1 415 782 3490'),
          const SizedBox(height: 10),
          const _KeyValueRow(
              label: 'Delivery time', value: '22 March, 10:00 Am'),
          const SizedBox(height: 10),
          const _KeyValueRow(label: 'Payment method', value: 'Cash'),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.grey100,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  color: AppColors.black.withValues(alpha: 0.05), width: 1),
            ),
            padding: const EdgeInsets.fromLTRB(14, 12, 14, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivery notes',
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: AppColors.grey500,
                      ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Please ensure the package is handled with care\n— fragile items inside.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        height: 1.35,
                      ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _KeyValueRow extends StatelessWidget {
  const _KeyValueRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: AppColors.grey500,
                ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: AppColors.black,
                ),
          ),
        ),
      ],
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Ink(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.86),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(
              color: AppColors.black.withValues(alpha: 0.06), width: 1),
        ),
        child: const Icon(Icons.arrow_back_rounded,
            size: 20, color: AppColors.black),
      ),
    );
  }
}
