import 'package:flutter/material.dart';

class ShopCartScreen extends StatefulWidget {
  const ShopCartScreen({Key? key}) : super(key: key);

  @override
  State<ShopCartScreen> createState() => _ShopCartScreenState();
}

class _ShopCartScreenState extends State<ShopCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('shopCart'),
    );
  }
}
