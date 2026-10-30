import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed, this.icon, this.expanded = false, this.secondary = false});
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expanded;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    final child = icon == null ? Text(label) : Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 19), const SizedBox(width: 8), Text(label)]);
    final button = secondary ? OutlinedButton(onPressed: onPressed, child: child) : FilledButton(onPressed: onPressed, child: child);
    return expanded ? SizedBox(width: double.infinity, child: button) : button;
  }
}
