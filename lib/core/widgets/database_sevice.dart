import 'package:path/path.dart';
import 'package:products_app/features/products/data/models/product_details_model.dart';
import 'package:sqflite/sqflite.dart';

import '../../features/products/data/models/get_products_model.dart';

class DatabaseService {
  static const String tableName = 'products';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'products.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE $tableName (
            id INTEGER PRIMARY KEY,
            title TEXT,
            price REAL,
            description TEXT,
            category TEXT,
            image TEXT
          )
          ''',
        );
      },
    );
  }

  Future<void> saveProducts(List<Product> products) async {
    final db = await database;
    final batch = db.batch();

    // Clear existing products
    await db.delete(tableName);

    // Insert new products
    for (var product in products) {
      batch.insert(
        tableName,
        product.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    await batch.commit();
  }
  Future<void> saveProduct({required ProductDetailsModel product}) async {
    final db = await database;


    await db.insert(
      tableName,
      product.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final maps = await db.query(tableName);

    return List.generate(maps.length, (i) {
      return Product.fromJson(maps[i]);
    });
  }

  Future<ProductDetailsModel?> getProduct(int id) async {
    final db = await database;
    final maps = await db.query(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return ProductDetailsModel.fromJson(maps.first);
    }

    return null;
  }
}
