import 'package:flutter/material.dart';
import 'package:g7_comerce_app/core/constant/app_colors.dart';
import 'package:g7_comerce_app/features/home/screens/homescreen.dart';

class BottomNavigationWidget extends StatefulWidget {
  int currentIndex;

  BottomNavigationWidget({super.key, required this.currentIndex});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  List<Widget> get _pages => [
    Center(child: Homescreen()),
    // Center(child: Searchingpage()),
    // Center(child: Notificationscreen()),
    // Center(child: Profilescreen()),
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: _pages[widget.currentIndex],
      bottomNavigationBar: SafeArea(
        child: BottomNavigationBar(
          currentIndex: widget.currentIndex,
          onTap: (newIndex) {
            setState(() {
              widget.currentIndex = newIndex;
            });
          },

          backgroundColor: AppColors.green,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color.fromARGB(130, 0, 0, 0),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(Icons.home_filled),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Icon(Icons.grid_view),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                // child: SvgPicture.asset(AssetResource.notification),
                child: Icon(Icons.shopping_bag_outlined),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                // child: SvgPicture.asset(AssetResource.profile),
                child: Icon(Icons.favorite_outline_rounded),
              ),
              label: '',
            ),
             BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                // child: SvgPicture.asset(AssetResource.profile),
                child: Icon(Icons.person_outline_rounded),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
