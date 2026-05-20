// lib/home_page.dart

import 'package:flutter/material.dart';
import 'bottom_nav.dart';
import 'perfume_model.dart';
import 'category_chips.dart';
import 'perfume_card.dart';
import 'perfume_grid_card.dart';
import 'detail_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selected = 0;
  int _navIndex = 0;

  final PageController _pageController = PageController(
    viewportFraction: 0.85,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onChipTapped(int index) {
    setState(() => _selected = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Perfume current = perfumeList[_selected];

    // Your exact background color formula — kept as-is
    final Color aBitLighterColor = Color.lerp(current.second_color, Colors.white, 0.5)!;

    return Scaffold(
      backgroundColor: aBitLighterColor,

      appBar: AppBar(
        backgroundColor: aBitLighterColor,
        elevation: 0,
        leading: const Icon(Icons.menu, color: Color(0xFF2A1A1A)),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const SizedBox(height: 20),
            const Text('Featured',
                style: TextStyle(
                    fontSize: 13,
                    color: Color.fromARGB(255, 83, 83, 83))),

            const SizedBox(height: 10),
            const Text('Category',
                style: TextStyle(
                    fontSize: 26, fontWeight: FontWeight.bold)),

            const SizedBox(height: 50),

            CategoryChips(
              selectedIndex: _selected,
              selectedColor: current.second_color,
              onChipTapped: _onChipTapped,
            ),

            const SizedBox(height: 50),

            // PageView replaces ListView — snaps cleanly,
            // no ScrollController or math needed
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: _pageController,
                itemCount: perfumeList.length,
                onPageChanged: (index) {
                  setState(() => _selected = index);
                },
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            DetailPage(perfume: perfumeList[index]),
                      ),
                    ),
                    child: PerfumeCard(
                      perfume: perfumeList[index],
                      perfumeColor: perfumeList[index].color,
                      isSelected: index == _selected,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 50),

            PerfumeGridCard(selectedColor: current.second_color),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        selectedIndex: _navIndex,
        onItemTapped: (i) => setState(() => _navIndex = i),
      ),
    );
  }
}