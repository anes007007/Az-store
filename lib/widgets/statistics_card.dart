import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  const StatisticsCard({super.key, required this.title, required this.value, required this.icon, required this.color, this.subtitle});
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(width: 42, height: 42, decoration: BoxDecoration(color: color.withValues(alpha: .13), borderRadius: BorderRadius.circular(13)), child: Icon(icon, color: color)),
          const SizedBox(height: 12),
          Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: dark ? Theme.of(context).colorScheme.onSurface : color)),
          const SizedBox(height: 4),
          Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
          if (subtitle != null) ...[const SizedBox(height: 3), Text(subtitle!, style: Theme.of(context).textTheme.bodySmall)],
        ]),
      ),
    );
  }
}
