class Product {
  const Product({required this.id, required this.name, required this.quantity, this.category = 'أخرى', this.barcode = '', this.imagePath = '', this.purchasePrice = 0, this.salePrice = 0, this.updatedAt});
  final String id;
  final String name;
  final int quantity;
  final String category;
  final String barcode;
  final String imagePath;
  final double purchasePrice;
  final double salePrice;
  final DateTime? updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: (json['id'] ?? '').toString(),
    name: (json['name'] ?? '').toString(),
    quantity: _asInt(json['quantity'] ?? json['pieces']),
    category: (json['category'] ?? 'أخرى').toString(),
    barcode: (json['barcode'] ?? '').toString(),
    imagePath: (json['imagePath'] ?? '').toString(),
    purchasePrice: _asDouble(json['purchasePrice'] ?? json['unitPrice']),
    salePrice: _asDouble(json['salePrice']),
    updatedAt: DateTime.tryParse((json['updatedAt'] ?? json['date'] ?? '').toString()),
  );

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'quantity': quantity, 'category': category, 'barcode': barcode, 'imagePath': imagePath, 'purchasePrice': purchasePrice, 'salePrice': salePrice, 'updatedAt': updatedAt?.toIso8601String()};
  static int _asInt(dynamic value) => value is num ? value.toInt() : int.tryParse('$value') ?? 0;
  static double _asDouble(dynamic value) => value is num ? value.toDouble() : double.tryParse('$value') ?? 0;
}
