import 'package:flutter/material.dart';
import 'package:gymbuddy/widgets/bottom_nav.dart';
import 'product_detail_page.dart';
import 'widgets/category_filter.dart';
import 'widgets/product_card.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final List<Map<String, String>> allProducts = [
    {'name': 'Whey Protein', 'price': 'Rs 5,000.00', 'imageUrl': 'assets/images/wheyprotein.jpg'},
    {'name': 'Creatine', 'price': 'Rs 5,000.00', 'imageUrl': 'assets/images/creatine.jpg'},
    {'name': 'BCAA', 'price': 'Rs 5,000.00', 'imageUrl': 'assets/images/BCAA.jpeg'},
    {'name': 'Protein Shake', 'price': 'Rs 6,000.00', 'imageUrl': 'assets/images/protein_shake.jpg'},
    {'name': 'Mass Gainer', 'price': 'Rs 5,500.00', 'imageUrl': 'assets/images/masstech.jpg'},
    {'name': 'Omega 3', 'price': 'Rs 2,000.00', 'imageUrl': 'assets/images/Hyper-Gain-6-lbs-New-400x400.jpg'},
    {'name': 'Multivitamin', 'price': 'Rs 3,000.00', 'imageUrl': 'assets/images/multi.jpg'},
  ];
  List<Map<String, String>> filteredProducts = [];

  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    // Initialize with all products
    filteredProducts = allProducts;
  }

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query.toLowerCase();
      filteredProducts = allProducts
          .where((product) => product['name']!.toLowerCase().contains(searchQuery))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomNav(currentIndex: 1), // Use the BottomNav widget
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            _buildSearchBar(),
            CategoryFilter(categories: ['All', 'Vitamin', 'Protein', 'Mass']),
            Expanded(
              child: _buildProductGrid(isLandscape),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          onChanged: updateSearchQuery,
          decoration: InputDecoration(
            hintText: 'Search products...',
            hintStyle: TextStyle(color: Colors.grey[600]),
            prefixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(vertical: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.grey.shade300, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(color: Colors.blue, width: 2),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductGrid(bool isLandscape) {
    int crossAxisCount = isLandscape ? 4 : 2;
    double aspectRatio = isLandscape ? (2 / 3) : (3 /4.5); // Increased height for cards

    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount, // Adjust items per row based on orientation
        childAspectRatio: aspectRatio, // Adjust aspect ratio for height
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: filteredProducts.length,
      itemBuilder: (context, index) {
        final product = filteredProducts[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(
                  name: product['name']!,
                  price: product['price']!,
                  imageUrl: product['imageUrl']!,
                  description: "Designed for Advanced Athletics and Bodybuilders",
                ),
              ),
            );
          },
          child: ProductCard(
            name: product['name']!,
            price: product['price']!,
            imageUrl: product['imageUrl']!,
          ),
        );
      },
    );
  }
}
