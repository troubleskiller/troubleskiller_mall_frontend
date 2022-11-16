import 'package:flutter/material.dart';
import 'package:troubleskiller_mall/widget/common_widget/common_app_bar.dart';

class CategoryMainScreen extends StatefulWidget {
  const CategoryMainScreen({Key? key}) : super(key: key);

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  final FocusNode _focus = FocusNode();
  @override
  void dispose() {
    // TODO: implement dispose
    _focus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        focusNode: _focus,
        onCancel: () {
          Navigator.maybePop(context);
        },
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          color: Colors.grey,
        ),
      ),
    );
  }
}
