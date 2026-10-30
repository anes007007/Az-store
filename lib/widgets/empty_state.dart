import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key, required this.title, this.message, this.icon = Icons.inbox_outlined, this.actionLabel, this.onAction});
  final String title;
  final String? message;
  final IconData icon;
  final String? actionLabel;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) => Center(
    child: Padding(padding: const EdgeInsets.all(28), child: Column(mainAxisSize: MainAxisSize.min, children: [
      Icon(icon, size: 58, color: Theme.of(context).colorScheme.primary.withValues(alpha: .75)),
      const SizedBox(height: 12),
      Text(title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      if (message != null) ...[const SizedBox(height: 6), Text(message!, textAlign: TextAlign.center)],
      if (actionLabel != null && onAction != null) ...[const SizedBox(height: 16), FilledButton(onPressed: onAction, child: Text(actionLabel!))],
    ])),
  );
}
