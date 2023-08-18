import 'package:flutter/material.dart';

class Products {
  String productName;
  double productPrice;

  Products({required this.productName, required this.productPrice});
}

class MyListViewPage extends StatelessWidget {
  final List<Products> products = [
    Products(productName: 'Produkt 1', productPrice: 10),
    Products(productName: 'Produkt 2', productPrice: 4.5),
    Products(productName: 'Produkt 3', productPrice: 7),
    Products(productName: 'Produkt 4', productPrice: 12.50)
  ];

  MyListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('ListView exercise'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: const Icon(Icons.shopping_cart),
            trailing: Text('${products[index].productPrice} €'),
            title: Text(products[index].productName),
          );
        },
      ),
    );
  }
}
