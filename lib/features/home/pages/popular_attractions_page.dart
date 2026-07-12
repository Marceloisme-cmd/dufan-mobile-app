import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = ['Extreme', 'Kids', 'Family', 'Water'];

    return Scaffold(
      appBar: AppBar(title: const Text('All Categories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(categories[index]),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        },
      ),
    );
  }
}
