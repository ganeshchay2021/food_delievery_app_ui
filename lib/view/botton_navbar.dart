import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/otherscreens/favourite_screen.dart';
import 'package:food_delivery_app/view/home/home_screen.dart';
import 'package:food_delivery_app/view/otherscreens/notification_screen.dart';
import 'package:food_delivery_app/view/otherscreens/profile_screen.dart';
import 'package:food_delivery_app/view/otherscreens/search_screen.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> bottonNavBarItem = [
    {"contColor": Colors.red, "icon": Icons.home, "isCenterIcon": false},
    {
      "contColor": Colors.red,
      "icon": Icons.favorite_outline,
      "isCenterIcon": false,
    },
    {"contColor": Colors.red, "icon": Icons.search, "isCenterIcon": true},
    {
      "contColor": Colors.red,
      "icon": Icons.notifications_on_outlined,
      "isCenterIcon": false,
    },
    {"contColor": Colors.red, "icon": Icons.person_outline, "isCenterIcon": false},
  ];

  final List<Widget> screens = const [
    HomeScreen(),
    FavouriteScreen(),
    SearchScreen(),
    NotificationScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(bottonNavBarItem.length, (index) {
            return bottomNavBarItem(
              contColor: bottonNavBarItem[index]["contColor"],
              isCenterIcon: bottonNavBarItem[index]["isCenterIcon"],
              icon: bottonNavBarItem[index]["icon"],
              idx: index,
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }

  Widget bottomNavBarItem({
    required Color contColor,
    required bool isCenterIcon,
    required IconData icon,
    required VoidCallback onTap,
    required int idx,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
      
        decoration: BoxDecoration(
          color: isCenterIcon ? contColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: isCenterIcon ? Colors.white : null, size: 30),
            if (selectedIndex == idx && !isCenterIcon)
              Container(
                height: 7,
                width: 7,
                decoration: BoxDecoration(
                  color: !isCenterIcon ? Colors.red : null,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
