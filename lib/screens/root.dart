import 'package:flutter/material.dart';
import 'package:plant_app/const/constants.dart';
import 'package:plant_app/screens/cart_page.dart';
import 'package:plant_app/screens/favorite_page.dart';
import 'package:plant_app/screens/home_page.dart';
import 'package:plant_app/screens/profile_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int bottomIndex = 0;

  List<Widget> page = [HomePage(), FavoritePage(), CartPage(), ProfilePage()];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.people,
  ];

  List<String> appBarTitle = ["خانه", "علاقه‌مندی‌ها", "سبد‌خرید", "پروفایل"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.notifications, color: Constants.blackColor, size: 30),
              Text(
                appBarTitle[bottomIndex],
                style: TextStyle(
                  color: Constants.blackColor,
                  fontFamily: "Lalezar",
                  fontSize: 24,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
