import 'package:app_bd/models/producto.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = join(await getDatabasesPath(), 'product_database.db');

    return openDatabase(path, version: 1, onCreate: (db, version) async {
      await db.execute('''
        CREATE TABLE products(
          id INTEGER PRIMARY KEY,
          name TEXT,
          category TEXT,
          price REAL
        )
      ''');
    });
  }

  Future<int> insertProduct(Product product) async {
    final db = await database;
    return db.insert('products', product.toMap());
  }

  Future<List<Product>> getProductsByCategory(String category) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db
        .query('products', where: 'category = ?', whereArgs: [category]);

    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

  Future<int> updateProduct(Product product) async {
    final db = await database;
    return db.update('products', product.toMap(),
        where: 'id = ?', whereArgs: [product.id]);
  }

  Future<int> deleteProduct(int id) async {
    final db = await database;
    return db.delete('products', where: 'id = ?', whereArgs: [id]);
  }
}
