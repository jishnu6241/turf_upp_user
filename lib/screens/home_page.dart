import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:turf_upp_user/screens/favorite_page.dart';
import 'package:turf_upp_user/screens/history_page.dart';
import 'package:turf_upp_user/screens/profile_page.dart';
import 'package:turf_upp_user/screens/turf_list_page.dart';
import 'package:turf_upp_user/theme/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = const [
      TurfListPage(),
      HistoryPage(),
      FavoritePage(),
      ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      /// ✅ PREVENT NAV BAR FROM MOVING UP
      resizeToAvoidBottomInset: false,

      body: Stack(
        children: [
          /// PAGE CONTENT
          Positioned.fill(child: _pages[_currentIndex]),

          /// FIXED GLASS NAV BAR
          SafeArea(
            bottom: true,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Colors.green.withOpacity(0.12),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.25),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          /// HOME
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() => _currentIndex = 0);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == 0
                                    ? Colors.green.withOpacity(0.25)
                                    : Colors.transparent,
                              ),
                              child: Image.asset(
                                'assets/icons/home.png',
                                height: 24,
                                width: 24,
                                color: _currentIndex == 0
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                          ),

                          /// HISTORY
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() => _currentIndex = 1);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == 1
                                    ? Colors.green.withOpacity(0.25)
                                    : Colors.transparent,
                              ),
                              child: Image.asset(
                                'assets/icons/history.png',
                                height: 24,
                                width: 24,
                                color: _currentIndex == 1
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                          ),

                          /// FAVORITE
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() => _currentIndex = 2);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == 2
                                    ? Colors.green.withOpacity(0.25)
                                    : Colors.transparent,
                              ),
                              child: Image.asset(
                                'assets/icons/heart.png',
                                height: 24,
                                width: 24,
                                color: _currentIndex == 2
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                          ),

                          /// PROFILE
                          GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              setState(() => _currentIndex = 3);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == 3
                                    ? Colors.green.withOpacity(0.25)
                                    : Colors.transparent,
                              ),
                              child: Image.asset(
                                'assets/icons/user.png',
                                height: 24,
                                width: 24,
                                color: _currentIndex == 3
                                    ? Colors.white
                                    : Colors.white70,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
