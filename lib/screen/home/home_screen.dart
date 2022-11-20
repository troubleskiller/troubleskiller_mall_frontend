import 'package:flutter/material.dart';
import 'package:troubleskiller_mall/controller/category_controller.dart';
import 'package:troubleskiller_mall/model/CategoryModel.dart';
import 'package:troubleskiller_mall/screen/category/category_main-screen.dart';
import 'package:troubleskiller_mall/widget/common_widget/common_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final CategoryController _categoryController = CategoryController();

  bool isLoadingContent = true;

  //商品列表
  List<CategoryModel> categories = [];
  List<Tab> categoriesTabs = [];

  int selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryTab();
  }

  void getCategoryTab() async {
    categories = await _categoryController.getLevel1Category();
    categoriesTabs = categories
        .map((e) => Tab(
              text: e.name,
            ))
        .toList();

    setState(() {
      isLoadingContent = false;
    });
  }

  Widget _buildTabBar(BuildContext context) {
    Color primaryColour = Theme.of(context).primaryColor;

    return DefaultTabController(
      length: categoriesTabs.length,
      child: Column(
        children: [
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                flex: 6,
                child: TabBar(
                  isScrollable: true,
                  labelColor: Colors.white,
                  indicatorColor: Colors.grey,
                  indicatorPadding: const EdgeInsets.only(bottom: 0),
                  onTap: (value) {
                    setState(() {
                      selectedIndex = value;
                    });
                  },
                  //controller: tickerTabController,
                  tabs: categoriesTabs,
                ),
              ),
              Expanded(
                flex: 1,
                child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) =>
                              CategoryMainScreen(categories: categories)));
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                        Text(
                          '分类',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )),
              )
            ],
          )
          // Expanded(
          //   child: TabBarView(children: [
          //
          //   ]),
          // ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return isLoadingContent
        ? const CircularProgressIndicator()
        : _buildTabBar(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: MainScreenAppBar(),
        body: _buildContent());
  }
}
