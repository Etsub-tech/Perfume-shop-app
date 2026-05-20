import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'perfume_model.dart';
import 'category_chips.dart';
import 'perfume_card.dart';
import 'perfume_grid_card.dart';
import 'detail_page.dart';
import 'cart_page.dart';
import 'search_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedCategoryIndex = 0;
  int _selectedBottomNavIndex = 0;
  final List<Perfume> _cart = [];

  List<Perfume> get _selectedPerfumes {
    if (categoryList[_selectedCategoryIndex] == 'All') {
      return perfumeList;
    }
    return perfumeList
        .where((perfume) => perfume.category == categoryList[_selectedCategoryIndex])
        .toList();
  }

  void _openCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CartPage(
          cartItems: _cart,
          onRemove: _removeFromCart,
        ),
      ),
    );
  }

  void _openSearch() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SearchPage(
          allPerfumes: perfumeList,
          onAddToCart: (perfume) {
            _addToCart(perfume);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${perfume.name} added to cart')),
            );
          },
        ),
      ),
    );
  }

  void _addToCart(Perfume perfume) {
    setState(() {
      _cart.add(perfume);
    });
  }

  void _removeFromCart(Perfume perfume) {
    setState(() {
      _cart.remove(perfume);
    });
  }

  void _onCategoryTapped(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Perfume current = _selectedPerfumes.isNotEmpty
        ? _selectedPerfumes.first
        : perfumeList.first;

    final Color aBitLighterColor =
        Color.lerp(current.secondColor, Colors.white, 0.5)!;

    return Scaffold(
      backgroundColor: aBitLighterColor,
      appBar: AppBar(
        backgroundColor: aBitLighterColor,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Color(0xFF2A1A1A)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF2A1A1A)),
            onPressed: _openSearch,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text('Featured',
                style: TextStyle(
                    fontSize: 13, color: Color.fromARGB(255, 83, 83, 83))),
            const SizedBox(height: 10),
            const Text('Category',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            const SizedBox(height: 50),
            CategoryChips(
              categories: categoryList,
              selectedIndex: _selectedCategoryIndex,
              selectedColor: current.secondColor,
              onChipTapped: _onCategoryTapped,
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 360,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: _selectedPerfumes.length,
                padding: const EdgeInsets.only(right: 16),
                separatorBuilder: (context, index) => const SizedBox(width: 16),
                itemBuilder: (context, index) {
                  final perfume = _selectedPerfumes[index];
                  return PerfumeCard(
                    perfume: perfume,
                    perfumeColor: perfume.color,
                    isSelected: false,
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                          perfume: perfume,
                          onAddToCart: () {
                            _addToCart(perfume);
                            _openCart();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            PerfumeGridCard(
              selectedColor: current.secondColor,
              category: categoryList[_selectedCategoryIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedBottomNavIndex,
        onItemTapped: (i) {
          setState(() => _selectedBottomNavIndex = i);
          if (i == 1) {
            _openCart();
          }
        },
      ),
    );
  }
}
