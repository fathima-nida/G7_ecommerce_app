import 'dart:nativewrappers/_internal/vm/bin/socket_patch.dart';

import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/theme/app_colors.dart';
import 'package:g7_comerce_app/core/theme/asset_resources.dart';
import 'package:g7_comerce_app/core/theme/textstyle.dart';
import 'package:g7_comerce_app/presentation/screens/cart/cartlists.dart';
import 'package:g7_comerce_app/presentation/screens/category/categorypage.dart';
import 'package:g7_comerce_app/presentation/screens/home/homescreen.dart';
import 'package:g7_comerce_app/presentation/screens/profile/profile.dart';
import 'package:g7_comerce_app/presentation/screens/favourite/favourite.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Homescreen(),
    CategoryPage(),
    CartScreen(),
   FavouriteScreen(),
    ProfileScreen()
  ];

  final List<_NavItem> _navItems = [
    _NavItem(
      label: 'Home',
      icon: AssetResources.home,
      activeIcon: AssetResources.homeWhite,
    ),
    _NavItem(
      label: 'Category',
      icon: AssetResources.category,
      activeIcon: AssetResources.categoryWhite,
    ),
    _NavItem(
      label: 'Cart',
      icon: AssetResources.cart,
      activeIcon: AssetResources.cartWhite,
    ),
    _NavItem(
      label: 'Favourite',
      icon: AssetResources.favorite,
      activeIcon: AssetResources.favoriteWhite,
    ),
    _NavItem(
      label: 'Profile',
      icon: AssetResources.prfle,
      activeIcon: AssetResources.prfleWhite,
    ),
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_currentIndex],

      // 👇 CUSTOM NAV BAR
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _navItems.length,
            (index) => _buildNavItem(index),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    final isSelected = _currentIndex == index;
    final item = _navItems[index];

    return GestureDetector(
      onTap: () {
        setState(() => _currentIndex = index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOutCubic,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.pink : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(isSelected ? item.activeIcon : item.icon, height: 22),
            if (isSelected) ...[
              Text(
                item.label,
                style: AppTextstyle.small(
                  fontSize: 9,
                  fontWeight: FontWeight.w600,
                  fontColor: AppColors.white,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class _NavItem {
  final String label;
  final String icon;
  final String activeIcon;

  const _NavItem({
    required this.label,
    required this.icon,
    required this.activeIcon,
  });
}
