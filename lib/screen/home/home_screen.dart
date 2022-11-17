import 'package:flutter/material.dart';
import 'package:troubleskiller_mall/controller/category_controller.dart';
import 'package:troubleskiller_mall/model/CategoryModel.dart';
import 'package:troubleskiller_mall/widget/common_widget/common_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final CategoryController _categoryController = CategoryController();
  late TabController _tabController;
  //商品列表（Tab）
  List<CategoryModel> categories = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryTab();
  }

  void getCategoryTab() async {
    categories = await _categoryController.getCategory();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainScreenAppBar(),
        body: GestureDetector(
          onTap: () {
            getCategoryTab();
          },
          child: Container(
            height: 100,
            width: 100,
            color: Colors.blue,
          ),
        ));
  }
}
