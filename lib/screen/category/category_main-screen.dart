import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:troubleskiller_mall/model/CategoryModel.dart';
import 'package:troubleskiller_mall/widget/common_widget/common_app_bar.dart';

class CategoryMainScreen extends StatefulWidget {
  const CategoryMainScreen({Key? key, required this.categories})
      : super(key: key);
  final List<CategoryModel> categories;

  @override
  State<CategoryMainScreen> createState() => _CategoryMainScreenState();
}

class _CategoryMainScreenState extends State<CategoryMainScreen> {
  final FocusNode _focus = FocusNode();
  bool isLoadingContent = true;
  List<SidebarXItem> sideBars = [];
  final SidebarXController controller = SidebarXController(selectedIndex: 0);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  void _init() {
    sideBars = widget.categories
        .map((e) => SidebarXItem(
              iconWidget: Text(e.name ?? '', textAlign: TextAlign.center),
            ))
        .toList();
    setState(() {
      isLoadingContent = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _focus.dispose();
    super.dispose();
  }

  Widget _buildLeftBar() {
    return SidebarX(
      controller: controller,
      items: sideBars,
      showToggleButton: false,
      theme: SidebarXTheme(
        width: 100,
        hoverColor: Colors.white,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.pinkAccent.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [Colors.pinkAccent, Colors.white],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildGridViewChildren(int i) {
    List<Widget> children = [];
    CategoryJSONModel.fromJson(widget.categories[i].children)
        .result
        ?.forEach((element) {
      children.add(Text(element.name ?? ''));
    });

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.pinkAccent, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: SearchAppBar(
            focusNode: _focus,
            onCancel: () {
              Navigator.maybePop(context);
            },
          ),
          body: isLoadingContent
              ? Container()
              : Row(
                  children: [
                    _buildLeftBar(),
                    Expanded(
                        child: _SideScreen(
                      controller: controller,
                      categories: widget.categories,
                    )),
                  ],
                )),
    );
  }
}

class _SideScreen extends StatelessWidget {
  const _SideScreen({
    Key? key,
    required this.controller,
    required this.categories,
  }) : super(key: key);

  final SidebarXController controller;

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final List<CategoryModel> secCategories = CategoryJSONModel.fromJson(
                    categories[controller.selectedIndex].children)
                .result ??
            [];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
          child: SingleChildScrollView(
              controller: ScrollController(),
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.network(
                          "https://via.placeholder.com/350x150",
                          fit: BoxFit.fill,
                        );
                      },
                      itemCount: 3,
                      pagination: SwiperPagination(),
                      control: SwiperControl(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  _SideTabScreen(
                    categories: secCategories,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: secCategories.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        List<CategoryModel> thirdCategories =
                            CategoryJSONModel.fromJson(
                                        secCategories[index].children)
                                    .result ??
                                [];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              secCategories[index].name ?? '',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GridView.builder(
                              shrinkWrap: true,
                              itemCount: thirdCategories.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (_, index) {
                                return Text(thirdCategories[index].name ?? '');
                              },
                            ),
                          ],
                        );
                      }),
                  Container(
                    height: 500,
                    color: Colors.blue,
                  )
                ],
              )),
        );
      },
    );
  }
}

class _SideTabScreen extends StatelessWidget {
  const _SideTabScreen({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<CategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
          children: categories
              .map((e) => Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(e.name ?? '')))
              .toList()),
    );
  }
}
