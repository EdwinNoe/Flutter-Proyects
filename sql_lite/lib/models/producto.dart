class Product {
  int id;
  String name;
  String category;
  double price;

  Product(
      {required this.id,
      required this.name,
      required this.category,
      required this.price});

  // Convierte un Producto a un Map para almacenarlo en la base de datos
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'category': category,
      'price': price,
    };
  }

  // Convierte un Map a un Producto
  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      category: map['category'],
      price: map['price'],
    );
  }
}
