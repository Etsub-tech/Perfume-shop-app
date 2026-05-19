// lib/home_page.dart

import 'package:flutter/material.dart';
import 'dart:ui';
import 'bottom_nav.dart';
import 'perfume_model.dart';
import 'category_chips.dart';
import 'perfume_card.dart';
import 'perfume_grid_card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  // ── STATE VARIABLES ──────────────────────────────────

  int _selectedIndex = 0;     // bottom nav active tab
  int _selectedChipIndex = 0; // which perfume chip + card is active

  // ScrollController for the horizontal card ListView.
  // This lets us READ the scroll position as the user drags,
  // so we can detect which card is centered and update the theme.
  late ScrollController _cardScrollController;

  // AnimationController drives the background color transition.
  // It goes from 0.0 → 1.0 over 500ms when you switch perfumes.
  late AnimationController _bgAnimController;

  // These store the FROM and TO colors for the background blend.
  // Color.lerp() blends between them as the animation plays.
  Color _fromColor = perfumeList[0].color;
  Color _toColor   = perfumeList[0].color;

  // ── LIFECYCLE ────────────────────────────────────────

  @override
  void initState() {
    super.initState();

    // Create the scroll controller for the horizontal card row
    _cardScrollController = ScrollController();

    // Listen to every scroll event on the card ListView.
    // Every time the user drags, _onCardScroll() fires.
    _cardScrollController.addListener(_onCardScroll);

    // AnimationController: 500ms, requires vsync: this
    // (which needs SingleTickerProviderStateMixin on the class)
    _bgAnimController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // On every animation frame, call setState() so Flutter
    // redraws with the latest blended background color
    _bgAnimController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // Always dispose controllers when the widget is removed.
    // Forgetting this causes memory leaks.
    _cardScrollController.dispose();
    _bgAnimController.dispose();
    super.dispose();
  }

  // ── SCROLL DETECTION ─────────────────────────────────

  void _onCardScroll() {
    // Each card is 160px wide + 14px margin = 174px per card.
    // Dividing scroll offset by card width tells us which card
    // is currently closest to the left edge of the viewport.
    const double cardWidth = 174.0;

    // _cardScrollController.offset = how many pixels scrolled
    // Dividing by cardWidth gives us the card index as a decimal
    // .round() snaps it to the nearest whole number
    final int newIndex =
        (_cardScrollController.offset / cardWidth).round()
        .clamp(0, perfumeList.length - 1);
    // .clamp(min, max) prevents the index going below 0
    // or above the last perfume index

    if (newIndex != _selectedChipIndex) {
      // Save the current color as the animation start point
      _fromColor = perfumeList[_selectedChipIndex].color;
      // Set the new color as the animation end point
      _toColor = perfumeList[newIndex].color;

      setState(() {
        _selectedChipIndex = newIndex;
      });

      // Restart the animation from 0 → plays to 1 over 500ms
      _bgAnimController.forward(from: 0.0);
    }
  }

  // ── CHIP TAP: scroll cards to match selected chip ────

  void _onChipTapped(int index) {
    // Save colors for animation
    _fromColor = perfumeList[_selectedChipIndex].color;
    _toColor   = perfumeList[index].color;

    setState(() {
      _selectedChipIndex = index;
    });

    // Animate the background color
    _bgAnimController.forward(from: 0.0);

    // Animate the card ListView to scroll to the tapped chip's card.
    // Each card is 174px wide. Card at index N starts at N * 174px.
    _cardScrollController.animateTo(
      index * 174.0,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOut,
    );
  }

  // ── BUILD ─────────────────────────────────────────────

  @override
  Widget build(BuildContext context) {

    // Compute the current blended background color.
    // _bgAnimController.value goes from 0.0 to 1.0.
    // Color.lerp smoothly blends _fromColor → _toColor.
    final Color bgColor = Color.lerp(
      _fromColor,
      _toColor,
      _bgAnimController.value,
    )!.withOpacity(0.18);
    // The ! asserts Color.lerp won't return null here.
    // withOpacity(0.18) keeps it subtle — a very light tint.

    return Scaffold(
      // AnimatedContainer wraps the whole scaffold background.
      // It automatically animates color changes over 500ms.
      backgroundColor: Colors.transparent,

      body: AnimatedContainer(
        // This is the animated background — the whole screen tints
        // smoothly when you scroll to a different perfume.
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: bgColor,
        ),
        child: CustomScrollView(
          // CustomScrollView allows mixing pinned headers (Slivers)
          // with scrollable content in one unified scroll view.
          slivers: [

            // ── PINNED HEADER ────────────────────────────
            // SliverAppBar with pinned: true stays fixed at the top
            // even as content below scrolls. This is exactly what
            // you asked for — title and chips never scroll away.
            SliverAppBar(
              pinned: true,
              // pinned: true = header stays visible always
              // pinned: false = header scrolls away with content

              floating: false,
              // floating: false = header only reappears when you
              // scroll all the way back to the top.
              // floating: true = reappears as soon as you scroll up

              automaticallyImplyLeading: false,
              // Prevents Flutter adding a default back arrow

              backgroundColor: Colors.transparent,
              // Transparent so our animated background shows through

              elevation: 0, // no shadow under the app bar

              // expandedHeight: how tall the header is when fully expanded
              expandedHeight: 170,

              // flexibleSpace is what shows inside the SliverAppBar.
              // FlexibleSpaceBar handles the collapse animation.
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  // Frosted glass effect on the pinned header
                  // so the animated background tint shows through
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: ClipRect(
                    // ClipRect is required for BackdropFilter
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              // Menu icon row
                              Row(
                                children: [
                                  IconButton(
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.menu,
                                        color: Color(0xFF2A1A1A)),
                                    onPressed: () {},
                                  ),
                                ],
                              ),

                              // "Featured" small label
                              Text(
                                'Featured',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade500,
                                ),
                              ),

                              // "Categories" large bold heading
                              const Text(
                                'Categories',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF1A1010),
                                ),
                              ),

                              const SizedBox(height: 10),

                              // ── CHIPS ROW ────────────────────
                              // This is INSIDE the pinned header,
                              // so it NEVER scrolls away. ✓
                              CategoryChips(
                                selectedIndex: _selectedChipIndex,
                                selectedColor:
                                    perfumeList[_selectedChipIndex].color,
                                onChipTapped: _onChipTapped,
                              ),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // ── HORIZONTAL CARD ROW ───────────────────────
            // SliverToBoxAdapter wraps normal widgets for use
            // inside CustomScrollView
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 0, 0),
                child: SizedBox(
                  height: 250,
                  child: ListView.builder(
                    // This controller lets us READ + CONTROL
                    // the horizontal scroll position
                    controller: _cardScrollController,
                    scrollDirection: Axis.horizontal,
                    // physics: BouncingScrollPhysics gives iOS-style
                    // rubber-band effect at the edges
                    physics: const BouncingScrollPhysics(),
                    itemCount: perfumeList.length,
                    itemBuilder: (context, index) {
                      return PerfumeCard(
                        perfume: perfumeList[index],
                        isSelected: index == _selectedChipIndex,
                      );
                    },
                  ),
                ),
              ),
            ),

            // ── "ALL PERFUMES" SECTION TITLE ─────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 28, 20, 14),
                child: const Text(
                  'All Perfumes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF1A1010),
                  ),
                ),
              ),
            ),

            // ── 2-COLUMN GRID ─────────────────────────────
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
              sliver: SliverGrid(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,      // 2 columns
                  crossAxisSpacing: 14,   // gap between columns
                  mainAxisSpacing: 14,    // gap between rows
                  childAspectRatio: 0.85, // card width ÷ height
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return PerfumeGridCard(
                      perfume: perfumeList[index],
                    );
                  },
                  childCount: perfumeList.length,
                ),
              ),
            ),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: (index) {
          setState(() => _selectedIndex = index);
        },
      ),
    );
  }
}