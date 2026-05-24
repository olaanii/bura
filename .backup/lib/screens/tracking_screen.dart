import 'package:flutter/material.dart';
import 'package:move_delivery/screens/order_details_screen.dart';
import 'package:move_delivery/theme/app_colors.dart';
import 'package:move_delivery/widgets/map_backdrop.dart';
import 'package:move_delivery/widgets/pill.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 52, 16, 16),
              child: MapBackdrop(cornerRadius: 32, showCenterPin: true),
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
                child: _BottomCard(
                  onTapOrderDetails: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const OrderDetailsScreen()),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomCard extends StatelessWidget {
  const _BottomCard({required this.onTapOrderDetails});

  final VoidCallback onTapOrderDetails;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(26),
        border: Border.all(color: AppColors.black.withOpacity(0.06), width: 1),
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: AppColors.grey200,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: const Icon(Icons.person, size: 22, color: AppColors.black),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Ethan Walker',
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.star_rounded, size: 16, color: AppColors.yellow),
                        Text(
                          '4.8',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.grey500,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 1),
                    Text(
                      'Delivery Driver',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _RoundIconButton(icon: Icons.more_horiz_rounded, onTap: () {}),
              const SizedBox(width: 10),
              _RoundIconButton(icon: Icons.call_rounded, onTap: () {}),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Drop-off at 350 Main St',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'San Francisco, CA',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                        color: AppColors.grey500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              const Pill(label: 'In Transit', background: AppColors.yellow),
            ],
          ),
          const SizedBox(height: 14),
          const _Timeline(),
          const SizedBox(height: 16),
          _MenuRow(
            icon: Icons.inventory_2_rounded,
            label: 'Order Details',
            onTap: onTapOrderDetails,
          ),
          const SizedBox(height: 10),
          _MenuRow(
            icon: Icons.credit_card_rounded,
            label: 'Payment Details',
            onTap: () {},
          ),
          const SizedBox(height: 10),
          _MenuRow(
            icon: Icons.support_agent_rounded,
            label: 'Support',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class _Timeline extends StatelessWidget {
  const _Timeline();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '8:15 am',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.grey500,
              ),
            ),
            const Spacer(),
            Text(
              '04:20 pm',
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                fontWeight: FontWeight.w800,
                color: AppColors.grey500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 22,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Positioned.fill(
                left: 10,
                right: 10,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.grey200,
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Positioned.fill(
                left: 10,
                right: 10,
                child: Align(
                  alignment: const Alignment(-0.25, 0),
                  child: FractionallySizedBox(
                    widthFactor: 0.55,
                    alignment: Alignment.centerLeft,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: AppColors.yellow,
                        borderRadius: BorderRadius.circular(999),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(left: 0, child: _Dot(color: AppColors.yellow)),
              Positioned(right: 0, child: _Dot(color: AppColors.grey200)),
              Align(
                alignment: const Alignment(0.06, 0),
                child: Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.circular(999),
                    border: Border.all(color: AppColors.white, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.18),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(Icons.navigation_rounded, size: 14, color: AppColors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.white, width: 2),
      ),
    );
  }
}

class _MenuRow extends StatelessWidget {
  const _MenuRow({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.black.withOpacity(0.05), width: 1),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18, color: AppColors.black),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                label,
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            const Icon(Icons.chevron_right_rounded, color: AppColors.grey500),
          ],
        ),
      ),
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
          color: AppColors.white.withOpacity(0.86),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.black.withOpacity(0.06), width: 1),
        ),
        child: const Icon(Icons.arrow_back_rounded, size: 20, color: AppColors.black),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
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
          color: AppColors.black,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Icon(icon, size: 20, color: AppColors.white),
      ),
    );
  }
}
