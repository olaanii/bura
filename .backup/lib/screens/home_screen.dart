import 'package:flutter/material.dart';
import 'package:move_delivery/screens/tracking_screen.dart';
import 'package:move_delivery/theme/app_colors.dart';
import 'package:move_delivery/widgets/action_tile.dart';
import 'package:move_delivery/widgets/map_backdrop.dart';
import 'package:move_delivery/widgets/move_top_bar.dart';
import 'package:move_delivery/widgets/order_row.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 20),
          children: [
            const MoveTopBar(),
            const SizedBox(height: 14),
            Stack(
              children: [
                const MapBackdrop(height: 210, cornerRadius: 28),
                Positioned(
                  left: 12,
                  top: 12,
                  child: _MapFloatingButton(
                    icon: Icons.near_me_rounded,
                    onTap: () {},
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 12,
                  child: _MapFloatingButton(
                    icon: Icons.open_in_new_rounded,
                    onTap: () {},
                  ),
                ),
                Positioned(
                  left: 14,
                  right: 14,
                  bottom: 14,
                  child: Container(
                    height: 42,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.92),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: AppColors.black.withOpacity(0.06), width: 1),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Row(
                      children: [
                        Text(
                          'Current Delivery',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.grey500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '-',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.grey500,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'AB-846861',
                          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: AppColors.black,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: ActionTile(
                    title: 'Courier',
                    subtitle: 'Door-to-door',
                    icon: Icons.directions_car_filled_rounded,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionTile(
                    title: 'Cargo',
                    subtitle: 'Bulk shipments',
                    icon: Icons.local_shipping_rounded,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: ActionTile(
                    title: 'Parcels',
                    subtitle: 'Small packages',
                    icon: Icons.inventory_2_rounded,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionTile(
                    title: 'Documents',
                    subtitle: 'Papers & files',
                    icon: Icons.description_rounded,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Expanded(child: SizedBox(height: 94)),
                const SizedBox(width: 12),
                Expanded(
                  child: ActionTile(
                    title: 'Custom\nconditions',
                    subtitle: '',
                    icon: Icons.north_east_rounded,
                    variant: ActionTileVariant.dark,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Text(
              'My Orders',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w900,
              ),
            ),
            const SizedBox(height: 12),
            OrderRow(
              from: 'New York',
              to: 'Toronto',
              orderId: 'Order US-583920',
              statusLabel: 'In Transit',
              statusColor: AppColors.yellow,
              leading: const _Flags(first: '🇺🇸', second: '🇨🇦'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const TrackingScreen()),
                );
              },
            ),
            const SizedBox(height: 10),
            const OrderRow(
              from: 'London',
              to: 'Berlin',
              orderId: 'Order UK-104782',
              statusLabel: 'Delivered',
              statusColor: AppColors.green,
              leading: _Flags(first: '🇬🇧', second: '🇩🇪'),
            ),
            const SizedBox(height: 10),
            const OrderRow(
              from: 'Milan',
              to: 'Zurich',
              orderId: 'Order IT-229481',
              statusLabel: 'Pending',
              statusColor: AppColors.blueGrey,
              leading: _Flags(first: '🇮🇹', second: '🇨🇭'),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapFloatingButton extends StatelessWidget {
  const _MapFloatingButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(999),
      child: Ink(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.86),
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.black.withOpacity(0.06), width: 1),
        ),
        child: Icon(icon, size: 18, color: AppColors.black),
      ),
    );
  }
}

class _Flags extends StatelessWidget {
  const _Flags({required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    Widget dot(String flag) {
      return Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(999),
          border: Border.all(color: AppColors.black.withOpacity(0.07), width: 1),
        ),
        alignment: Alignment.center,
        child: Text(flag, style: const TextStyle(fontSize: 14)),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        dot(first),
        Positioned(left: 16, child: dot(second)),
        const SizedBox(width: 42, height: 26),
      ],
    );
  }
}
