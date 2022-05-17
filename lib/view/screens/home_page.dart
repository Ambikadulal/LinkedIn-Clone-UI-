import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../constants.dart';
import '../../controller/service/demo_data.dart';
import '../custom/app_bar.dart';
import '../custom/button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _post = Data.postList;
  bool _showAppNavBar = true;
  late ScrollController _scrollController;
  bool _isScrollDown = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _initialScroll();
  }

  void _initialScroll() async {
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        if (!_isScrollDown) {
          _isScrollDown = true;
          _hideAppNavBar();
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        if (_isScrollDown) {
          _isScrollDown = false;
          _showAppNvBar();
          setState(() {});
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (BuildContext context, SizingInformation sizingInformation) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          color: Colors.black12,
          child: Column(
            children: [
              _showAppNavBar
                  ? CustomAppBar(
                      sizingInformation: sizingInformation,
                    )
                  : const SizedBox(
                      height: 0.0,
                      width: 0.0,
                    ),
              _listPostWidget(sizingInformation),
            ],
          ),
        ),
      );
    });
  }

  Widget _listPostWidget(SizingInformation sizingInformation) {
    return Expanded(
        child: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _post.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            margin: const EdgeInsets.only(bottom: 0.0, top: 8),
            decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                    top: BorderSide(color: Colors.black54, width: 0.50),
                    bottom: BorderSide(color: Colors.black54, width: 0.50))),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(_post[index].profileUrl),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _post[index].name,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: sizingInformation.screenSize.width / 1.5,
                          child: Text(
                            _post[index].headline,
                            style: const TextStyle(fontSize: 12, color: Colors.black54),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.more_vert)
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  _post[index].description,
                  style: const TextStyle(fontSize: 14),
                ),
                Text(
                  _post[index].tags,
                  style: const TextStyle(color: kPrimaryColor),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: sizingInformation.screenSize.width,
                  child: Image.asset(
                    _post[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 25, height: 25, child: Image.asset('assets/icons/like_icon.png')),
                        SizedBox(width: 25, height: 25, child: Image.asset('assets/icons/celebrate_icon.png')),
                        if (index == 0 || index == 4 || index == 6)
                          SizedBox(width: 25, height: 25, child: Image.asset('assets/icons/love_icon.png')),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _post[index].likes,
                          style: const TextStyle(fontSize: 14),
                        )
                      ],
                    ),
                    Row(
                      children: [Text(_post[index].comments), const Text(" comments")],
                    )
                  ],
                ),
                const Divider(
                  thickness: 0.50,
                  color: Colors.black26,
                ),
                _rowButton(),
              ],
            ),
          );
        },
      ),
    ));
  }

  void _hideAppNavBar() {
    setState(() {
      _showAppNavBar = false;
    });
  }

  void _showAppNvBar() {
    setState(() {
      _showAppNavBar = true;
    });
  }

  Widget _rowButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {},
          child: rowSingleButton(
              color: Colors.black, name: "Like", iconImage: "assets/icons/like_icon_white.png", isHover: false),
        ),
        InkWell(
          onTap: () {},
          child: rowSingleButton(
              color: Colors.black, name: "Comment", iconImage: "assets/icons/comment_icon.png", isHover: false),
        ),
        InkWell(
          onTap: () {},
          child: rowSingleButton(
              color: Colors.black, name: "Share", iconImage: "assets/icons/share_icon.png", isHover: false),
        ),
      ],
    );
  }
}
