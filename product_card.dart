import 'dart:io';

import 'package:flutter/material.dart';

/// Reusable product row for AZ Store. This widget is intentionally independent
/// of the existing data model so it can be connected to the product screen.
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.name,
    required this.stock,
    this.imagePath,
    this.category,
    this.price,
    this.onTap,
  });

  final String name;
  final int stock;
  final String? imagePath;
  final String? category;
  final String? price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final bool lowStock = stock <= 5;
    final bool hasImage = imagePath != null &&
        imagePath!.isNotEmpty &&
        File(imagePath!).existsSync();

    final List<String> details = <String>[
      if (category != null && category!.isNotEmpty) category!,
      'المخزون: $stock',
      if (price != null && price!.isNotEmpty) price!,
    ];

    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 6,
        ),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: SizedBox(
            width: 54,
            height: 54,
            child: hasImage
                ? Image.file(
                    File(imagePath!),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                        _placeholder(),
                  )
                : _placeholder(),
          ),
        ),
        title: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(
          details.join(' • '),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
          decoration: BoxDecoration(
            color: (lowStock ? Colors.orange : Colors.green)
                .withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            lowStock ? 'منخفض' : 'متوفر',
            style: TextStyle(
              color: lowStock ? Colors.orange.shade800 : Colors.green.shade700,
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _placeholder() {
    return const ColoredBox(
      color: Color(0xFFE8F3FF),
      child: Center(
        child: Icon(
          Icons.inventory_2_outlined,
          color: Color(0xFF0877E8),
        ),
      ),
    );
  }
}
