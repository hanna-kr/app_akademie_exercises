import 'package:flutter/material.dart';

class MyNavigatorPage extends StatelessWidget {
  final List<String> products = [
    'Produkt 1',
    'Produkt 2',
    'Produkt 3',
    'Produkt 4'
  ];

  MyNavigatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Navigator exercise',
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
                leading: const Icon(Icons.install_mobile),
                title: Text(products[index]),
                onTap: () {
                  Navigator.pushNamed(context, '/navigator_details',
                      arguments: products[index]);
                }),
          );
        },
      ),
    );
  }
}
