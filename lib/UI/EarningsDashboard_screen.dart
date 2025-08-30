import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/mdi.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:kkinfotech/constants/colors.dart';
import 'package:kkinfotech/constants/theme.dart';
import 'package:kkinfotech/widgets/bottom%20nav.dart';

class EarningsDashboard extends StatelessWidget {
  const EarningsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: buildTheme(),
      child: const _EarningsScreen(),
    );
  }
}

class _EarningsScreen extends StatelessWidget {
  const _EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _AppBar(),
      bottomNavigationBar: AppBottomNav(selectedIndex: 2),
      body: _Body(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(Icons.menu, color: Color(0xFF494C53)),
      title: const Text('My Earnings'),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 16),
          child: Iconify(Mdi.notifications_none, color: Color(0xFF494C53)),
        ),
      ],
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const [
          _TotalEarningsCard(),
          SizedBox(height: 16),
          _PaymentSummaryCard(),
          SizedBox(height: 16),
          _ServiceHeader(),
          SizedBox(height: 12),

          _ServiceItem(
            key: ValueKey('Water Bottle'),
            leading: Iconify(Mdi.water_drop, color: AppColors.maroon, size: 20),
            title: 'Water Bottle',
            deliveries: '32 Deliveries',
            amount: '₹2,450',
            trend: '+12% vs last week',
            trendColor: AppColors.positive,
            barValue: 0.88,
          ),
          _ServiceItem(
            key: ValueKey('Oxygen Cylinder'),
            leading: Icon(Bootstrap.lungs, color: AppColors.maroon, size: 20),
            title: 'Oxygen Cylinder',
            deliveries: '18 Deliveries',
            amount: '₹3,600',
            trend: '+8% vs last week',
            trendColor: AppColors.positive,
            barValue: 0.74,
          ),
          _ServiceItem(
            key: ValueKey('Laundry'),
            leading: Iconify(Mdi.tshirt_crew_outline, color: AppColors.maroon, size: 20),
            title: 'Laundry',
            deliveries: '12 Deliveries',
            amount: '₹1,800',
            trend: '-5% vs last week',
            trendColor: AppColors.negative,
            barValue: 0.42,
          ),
          _ServiceItem(
            key: ValueKey('Tiffin'),
            leading: Iconify(Mdi.silverware_fork_knife, color: AppColors.maroon, size: 20),
            title: 'Tiffin',
            deliveries: '15 Deliveries',
            amount: '₹2,100',
            trend: '+15% vs last week',
            trendColor: AppColors.positive,
            barValue: 0.60,
          ),
          _ServiceItem(
            key: ValueKey('Meals'),
            leading: Iconify(Mdi.silverware, color: AppColors.maroon, size: 20),
            title: 'Meals',
            deliveries: '6 Deliveries',
            amount: '₹1,500',
            trend: '+20% vs last week',
            trendColor: AppColors.positive,
            barValue: 0.28,
          ),
        ],
      ),
    );
  }
}

class _TotalEarningsCard extends StatelessWidget {
  const _TotalEarningsCard();

  static const _cardRadius = 14.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.maroon,
        borderRadius: BorderRadius.circular(_cardRadius),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          _HeaderRow(),
          SizedBox(height: 12),
          Text('₹12,450', style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w700)),
          SizedBox(height: 14),
          Row(
            children: [
              _StatPill(label: 'Total Deliveries', value: '86'),
              SizedBox(width: 12),
              _StatPill(label: 'Total Distance', value: '142 km'),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderRow extends StatelessWidget {
  const _HeaderRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.account_balance_wallet_outlined, color: Colors.white, size: 18),
        const SizedBox(width: 8),
        const Text('Total Earnings', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.pillBg,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.white24),
          ),
          child: const Row(
            children: [
              Text('This Week', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w600)),
              SizedBox(width: 4),
              Icon(Icons.arrow_drop_down, size: 18, color: Colors.black),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatPill extends StatelessWidget {
  final String label;
  final String value;
  const _StatPill({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
    );
  }
}

class _PaymentSummaryCard extends StatelessWidget {
  const _PaymentSummaryCard();

  static const _tileShadow = BoxShadow(
    color: Color(0x1A000000),
    blurRadius: 10,
    offset: Offset(0, 4),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [_tileShadow],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Row(
            children: [
              Text('Payment Summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF262930))),
              Spacer(),
              Text('View All',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF7A4147))),
            ],
          ),
          SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _SummaryTile(
                  bg: Color(0xFFF6F8FB),
                  radius: 16,
                  icon: Icons.monetization_on_outlined,
                  iconColor: Color(0xFF27AE60),
                  title: 'COD Collected',
                  amount: '₹4,850',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _SummaryTile(
                  bg: Color(0xFFF6F8FB),
                  radius: 16,
                  icon: Icons.credit_card_sharp,
                  iconColor: Color(0xFF2D64F3),
                  title: 'Online Payments',
                  amount: '₹7,600',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummaryTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String amount;
  final Color bg;
  final double radius;

  const _SummaryTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.amount,
    this.bg = const Color(0xFFF6F8FB),
    this.radius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 14, color: Color(0xFF606772), height: 1.2),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            amount,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF101318)),
          ),
        ],
      ),
    );
  }
}

class _ServiceHeader extends StatelessWidget {
  const _ServiceHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Service Earnings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.onSurface)),
        Text('July 2025', style: TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant)),
      ],
    );
  }
}

class _ServiceItem extends StatelessWidget {
  final Widget leading;
  final String title;
  final String deliveries;
  final String amount;
  final String trend;
  final Color trendColor;
  final double barValue;

  const _ServiceItem({
    super.key,
    required this.leading,
    required this.title,
    required this.deliveries,
    required this.amount,
    required this.trend,
    required this.trendColor,
    required this.barValue,
  });

  static const _shadow = BoxShadow(
    color: Color(0x0A000000),
    blurRadius: 8,
    offset: Offset(0, 4),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [_shadow],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(color: AppColors.avatarBg, shape: BoxShape.circle),
                child: leading,
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.onSurface)),
                    const SizedBox(height: 4),
                    Text(deliveries, style: const TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant)),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 2),
                  Text(amount,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w700, color: AppColors.onSurface)),
                  const SizedBox(height: 4),
                  Text(trend, style: TextStyle(fontSize: 12, color: trendColor, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 6,
            child: Stack(
              fit: StackFit.expand,
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F1F1),
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: barValue,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.maroon,
                      borderRadius: BorderRadius.circular(100),
                    ),
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
