import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:owlnews/constant/utils.dart';
import 'package:owlnews/controllers/home_controller.dart';
import 'package:owlnews/helper/category_data.dart';
import 'package:owlnews/helper/news_data.dart';
import 'package:owlnews/models/article_model.dart';
import 'package:owlnews/models/category_model.dart';
import 'package:owlnews/views/profil_view.dart';
import 'package:owlnews/widgets/blog_tile.dart';
import 'package:owlnews/widgets/botnavbar_widget.dart';
import 'package:owlnews/widgets/category_tile.dart';
import 'package:owlnews/widgets/textfield_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<HomeController>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: Container(
            margin: EdgeInsets.all(8),
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              Icons.notifications,
              color: Colors.grey,
            )),
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: 'Owl', style: poppinsbold12.copyWith(color: Colors.black)),
          TextSpan(
              text: 'News',
              style: poppinsbold12.copyWith(color: const Color(0xff00B2C7))),
        ])),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => MenuProfil()));
            },
            child: Container(
                padding: const EdgeInsets.all(5),
                child: Image.asset('assets/images/Ellipse1.png')),
          ),
        ],
        elevation: 0.3,
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                  prefixIcon: true,
                  isPass: false,
                  hintext: 'Search',
                  style: poppinsLight,
                  textInputType: TextInputType.text),
              const SizedBox(
                height: 10,
              ),
              _controller.loading.value
                  ? Center(
                      child: Container(
                      child: const CircularProgressIndicator(),
                    ))
                  : Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 70,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _controller.categories.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(
                                categoryName:
                                    _controller.categories[index].categoryName,
                                onTap: () async {
                                  _controller.repository = Repository(
                                      category: _controller
                                          .categories[index].categoryName);
                                  setState(() {
                                    _controller.getNews();
                                  });
                                },
                              );
                            }),
                      ),
                    ),
              Flexible(
                flex: 10,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(top: 16),
                    child: ListView.builder(
                        itemCount: _controller.articles.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl:
                                _controller.articles[index].urlToImage ?? "",
                            title: _controller.articles[index].title ?? "",
                            desc: _controller.articles[index].description ?? "",
                            url: _controller.articles[index].url ?? "",
                            content: _controller.articles[index].content ?? "",
                            author: _controller.articles[index].author ?? "",
                            // content: articles[index].content ?? "",
                            // posturl: articles[index].articleUrl ?? "",
                          );
                        }),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

class CustomBottomNavigationBar extends StatefulWidget {
  final int defaultSelectedIndex;
  final Function(int) onChange;
  final List<IconData> iconList;

  CustomBottomNavigationBar(
      {this.defaultSelectedIndex = 0,
      required this.iconList,
      required this.onChange});

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;
  List<IconData> _iconList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _selectedIndex = widget.defaultSelectedIndex;
    _iconList = widget.iconList;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _navBarItemList = [];

    for (var i = 0; i < _iconList.length; i++) {
      _navBarItemList.add(buildNavBarItem(_iconList[i], i));
    }

    return Row(
      children: _navBarItemList,
    );
  }

  Widget buildNavBarItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        widget.onChange(index);
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / _iconList.length,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 4, color: Color(0xff00B2C7)),
                ),
                gradient: LinearGradient(colors: [
                  Color(0xff00B2C7).withOpacity(0.3),
                  Color(0xff00B2C7).withOpacity(0.015),
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)
                // color: index == _selectedItemIndex ? Colors.green : Colors.white,
                )
            : BoxDecoration(),
        child: Icon(
          icon,
          color: index == _selectedIndex ? Colors.black : Colors.grey,
        ),
      ),
    );
  }
}
