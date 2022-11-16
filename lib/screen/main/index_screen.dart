import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:troubleskiller_mall/config/index.dart';
import 'package:troubleskiller_mall/provider/current_index_provider.dart';
import 'package:troubleskiller_mall/screen/category/category_main-screen.dart';
import 'package:troubleskiller_mall/screen/home/home_screen.dart';
import 'package:troubleskiller_mall/screen/shop_cart/shop_cart_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  final List<BottomNavigationBarItem> bottomTabs = [
    //首页
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.home,
        color: Colors.black,
      ),
      icon: Icon(
        Icons.home_outlined,
        color: Colors.black,
      ),
      label: MallString.home,
    ),
    //新品
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.shopping_basket,
        color: Colors.black,
      ),
      icon: Icon(
        Icons.shopping_basket_outlined,
        color: Colors.black,
      ),
      label: MallString.shop,
    ),
    //购物车
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.shopping_cart,
        color: Colors.black,
      ),
      icon: Icon(
        Icons.shopping_cart_outlined,
        color: Colors.black,
      ),
      label: MallString.shopCart,
    ),
    //我的
    BottomNavigationBarItem(
      activeIcon: Icon(
        Icons.person,
        color: Colors.black,
      ),
      icon: Icon(
        Icons.person_outline,
        color: Colors.black,
      ),
      label: MallString.user,
    ),
  ];

  final List<Widget> tabBodies = [
    HomeScreen(),
    CategoryMainScreen(),
    ShopCartScreen(),
    ShopCartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    var current = context.watch<CurrentIndexProvider>();
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: tabBodies[current.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          currentIndex: current.currentIndex,
          items: bottomTabs,
          onTap: (index) {
            context.read<CurrentIndexProvider>().changeIndex(index);
          },
        ),
      ),
    );
  }
}
