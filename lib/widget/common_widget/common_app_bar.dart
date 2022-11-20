import 'package:flutter/material.dart';
import 'package:troubleskiller_mall/widget/common_widget/common_button.dart';
import 'package:troubleskiller_mall/widget/text_field/text_filed_widget.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppBar({
    Key? key,
    this.child,
    this.searchTextController,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onCancel,
    this.focusNode,
    this.paddingOverride,
    this.showCancel = true,
  })  : preferredSize = const Size.fromHeight(50),
        super(key: key);
  final Widget? child;
  final TextEditingController? searchTextController;
  final String? hintText;
  final Function? onChanged;
  final Function? onSubmitted;
  final FocusNode? focusNode;
  final Function? onCancel;
  final EdgeInsets? paddingOverride;
  final bool showCancel;

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  final Size preferredSize;
}

class _SearchAppBarState extends State<SearchAppBar> {
  void onFocusNodeChange() {
    setState(() {});
  }

  @override
  void initState() {
    if (widget.focusNode != null) {
      widget.focusNode!.addListener(onFocusNodeChange);
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.focusNode != null) {
      widget.focusNode!.removeListener(onFocusNodeChange);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      // Remove the automatically displayed leading back button
      automaticallyImplyLeading: false,
      title: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StandardIconButton(
              icon: Icons.keyboard_arrow_left,
              onPressed: () {},
              iconColor: Colors.black,
              iconSize: 25,
            ),
            Expanded(
              child: Padding(
                padding: widget.paddingOverride ??
                    const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                child: TextInputField(
                  controller: widget.searchTextController,
                  focusNode: widget.focusNode,
                  onChanged: widget.onChanged,
                  onSubmitted: widget.onSubmitted,
                  textInputAction: TextInputAction.search,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(6),
                    child: StandardIconButton(
                      icon: Icons.search,
                      iconColor: Colors.blueGrey,
                      onPressed: () {},
                    ),
                  ),
                  suffixIcon: Offstage(
                    offstage: !(widget.searchTextController != null &&
                        widget.searchTextController!.text.isNotEmpty),
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: StandardIconButton(
                        icon: Icons.clear,
                        iconColor: Colors.blueGrey,
                        onPressed: () {
                          widget.searchTextController?.clear();
                          if (widget.onChanged != null) {
                            widget.onChanged?.call('');
                          }
                        },
                      ),
                    ),
                  ),
                  hintText: widget.hintText,
                ),
              ),
            ),
            // Actions
            StandardIconButton(
              icon: Icons.qr_code_scanner,
              onPressed: () {},
              iconColor: Colors.black,
              iconSize: 25,
            ),
          ],
        ),
      ),
      toolbarHeight: 50,
    );
  }
}

class MainScreenAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainScreenAppBar({Key? key})
      : preferredSize = const Size.fromHeight(70),
        super(key: key);

  @override
  State<MainScreenAppBar> createState() => _MainScreenAppBarState();

  @override
  final Size preferredSize;
}

class _MainScreenAppBarState extends State<MainScreenAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleSpacing: 0,
      // Remove the automatically displayed leading back button
      automaticallyImplyLeading: false,
      title: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Spacer(),
                Row(
                  children: [],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.group,
                      color: Colors.black,
                      size: 25,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.redAccent,
                        size: 25,
                      ),
                      Text('data'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: 1,
                        height: 10,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.qr_code_scanner,
                        color: Colors.blueGrey,
                        size: 25,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      toolbarHeight: 70,
    );
  }
}
