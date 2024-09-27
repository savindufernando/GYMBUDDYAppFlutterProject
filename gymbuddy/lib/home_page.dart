import 'package:flutter/material.dart';
import 'shop_page.dart';
import 'services_page.dart';
import 'widgets/bottom_nav.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  String searchQuery = '';
  bool isSearchBarVisible = false;

  final List<Map<String, String>> supplements = [
    {'imageUrl': 'assets/images/wheyprotein.jpg', 'title': 'Whey Protein', 'price': 'RS 5,000.00'},
    {'imageUrl': 'assets/images/BCAA.jpeg', 'title': 'BCAA', 'price': 'RS 4,000.00'},
    {'imageUrl': 'assets/images/creatine.jpg', 'title': 'Creatine', 'price': 'RS 3,500.00'},
    {'imageUrl': 'assets/images/fatburner.jpeg', 'title': 'Fat Burner', 'price': 'RS 6,500.00'},
  ];

  final List<Map<String, String>> products = [
    {'imageUrl': 'assets/images/bodybuiling.png', 'title': 'Body Building', 'price': 'RS 4,000.00'},
    {'imageUrl': 'assets/images/wrestling.jpg', 'title': 'Wrestling', 'price': 'RS 4,500.00'},
    {'imageUrl': 'assets/images/images.jpeg', 'title': 'MMA', 'price': 'RS 5,000.00'},
    {'imageUrl': 'assets/images/swimming.jpg', 'title': 'Swimming', 'price': 'RS 5,500.00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Image.asset(
          'assets/images/logo2.png',
          height: 40,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              setState(() {
                isSearchBarVisible = !isSearchBarVisible;
                _searchController.clear();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),
      drawer: _buildDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isLandscape = constraints.maxWidth > constraints.maxHeight;
          return _buildBody(context, isLandscape);
        },
      ),
      bottomNavigationBar: BottomNav(currentIndex: 0),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Image.asset('assets/images/logo2.png'),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          _buildDrawerItem(Icons.star, 'Featured'),
          _buildDrawerItem(Icons.store, 'Collections'),
          _buildDrawerItem(Icons.shopping_cart, 'Cart'),
          _buildDrawerItem(Icons.history, 'Orders'),
          _buildDrawerItem(Icons.person, 'Account'),
          _buildDrawerItem(Icons.notifications, 'Notifications'),
          _buildDrawerItem(Icons.local_shipping, 'Shipping Policy'),
        ],
      ),
    );
  }

  ListTile _buildDrawerItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {},
    );
  }

  Widget _buildBody(BuildContext context, bool isLandscape) {
    List<Map<String, String>> filteredSupplements = supplements
        .where((supplement) => supplement['title']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/banner_home.jpg',
                fit: BoxFit.cover,
                height: isLandscape ? 150 : 200,
                width: double.infinity,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                right: 20,
                child: Column(
                  children: [
                    Text(
                      "Find the best supplements and services tailored for your health!",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(blurRadius: 10, color: Colors.black)],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    if (isSearchBarVisible)
                      TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search for products...',
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.search),
                            onPressed: () {
                              setState(() {
                                searchQuery = _searchController.text;
                              });
                            },
                          ),
                        ),
                      ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ShopPage()),
                            );
                          },
                          child: Text('Shop'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ServicesPage()),
                            );
                          },
                          child: Text('Services'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Best Selling Supplements',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          _buildSupplementGrid(filteredSupplements, isLandscape),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Training Sessions',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
          _buildProductGrid(isLandscape),
        ],
      ),
    );
  }

  Widget _buildProductGrid(bool isLandscape) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandscape ? 4 : 2,  // Adjust columns based on orientation
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return _buildProductCard(
            imageUrl: product['imageUrl']!,
            title: product['title']!,
            price: product['price']!,
          );
        },
      ),
    );
  }

  Widget _buildSupplementGrid(List<Map<String, String>> filteredSupplements, bool isLandscape) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isLandscape ? 4 : 2,  // Adjust columns based on orientation
          childAspectRatio: 0.8,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: filteredSupplements.length,
        itemBuilder: (context, index) {
          final supplement = filteredSupplements[index];
          return _buildProductCard(
            imageUrl: supplement['imageUrl']!,
            title: supplement['title']!,
            price: supplement['price']!,
          );
        },
      ),
    );
  }

  Widget _buildProductCard({required String imageUrl, required String title, required String price}) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(imageUrl, fit: BoxFit.cover),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              price,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
