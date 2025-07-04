import 'package:app_bd/controller/database.dart';
import 'package:app_bd/models/producto.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String category;

  ProductScreen({required this.category});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Product> products = [];
  final dbHelper = DBHelper();
  final TextEditingController _productIdController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Productos de ${widget.category}'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Product>>(
        future: dbHelper.getProductsByCategory(widget.category),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            products = snapshot.data!;
            return products.isEmpty
                ? const Center(
                    child: Text('No hay productos ingresados'),
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ListTile(
                        title: Text(product.name),
                        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _showCreateProductDialog(products,
                                      isEditMode: true, producto: product);
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    dbHelper.deleteProduct(product.id);
                                  });
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                  );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateProductDialog(products);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showCreateProductDialog(List<Product> products,
      {bool isEditMode = false, Product? producto}) async {
    if (isEditMode && producto != null) {
      _productIdController.text = producto.id.toString();
      _productNameController.text = producto.name;
      _productPriceController.text = producto.price.toString();
    } else {
      _productIdController.clear();
      _productNameController.clear();
      _productPriceController.clear();
    }

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isEditMode ? 'Actualizar Producto' : 'Crear Producto'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                isEditMode
                    ? Container()
                    : TextField(
                        controller: _productIdController,
                        decoration: const InputDecoration(labelText: 'Id'),
                        keyboardType: TextInputType.number,
                      ),
                TextField(
                  controller: _productNameController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: _productPriceController,
                  decoration: const InputDecoration(labelText: 'Precio'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(isEditMode ? 'Actualizar' : 'Crear'),
              onPressed: () async {
                final id = int.parse(_productIdController.text);

                if (!isEditMode) {
                  bool isIdDuplicate = false;

                  for (var product in products) {
                    if (product.id == id) {
                      isIdDuplicate = true;
                      break;
                    }
                  }

                  if (isIdDuplicate) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Error! Id duplicado'),
                      backgroundColor: Colors.red,
                    ));
                    return;
                  }
                }

                final name = _productNameController.text;
                final price =
                    double.tryParse(_productPriceController.text) ?? 0.0;

                if (name.isNotEmpty && price > 0) {
                  final newProduct = Product(
                      id: id,
                      name: name,
                      category: widget.category,
                      price: price);
                  if (isEditMode) {
                    await dbHelper.updateProduct(newProduct);
                  } else {
                    await dbHelper.insertProduct(newProduct);
                  }

                  Navigator.of(context).pop();
                  setState(() {}); // Actualiza la lista de productos
                }
              },
            ),
          ],
        );
      },
    );
  }
}
