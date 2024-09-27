import 'package:flutter/material.dart';

class CategoryFilter extends StatelessWidget {
  final List<String> categories;

  CategoryFilter({required this.categories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: ChoiceChip(
              label: Text(categories[index]),
              selected: false,
              onSelected: (bool selected) {
              },
            ),
          );
        },
      ),
    );
  }
}
