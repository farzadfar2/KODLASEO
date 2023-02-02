import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scroll_to_index/scroll_to_index.dart';






class LanguegeScreen extends StatefulWidget {
  @override
  _LanguegeScreenState createState() => _LanguegeScreenState();
}

class _LanguegeScreenState extends State<LanguegeScreen> {

  late AutoScrollController _autoScrollController;
  final scrollDirection = Axis.vertical;

  bool isExpaned = true;

  bool get _isAppBarExpanded {
    return _autoScrollController.hasClients &&
        _autoScrollController.offset > (160 - kToolbarHeight);
  }

  @override
  void initState() {
    _autoScrollController = AutoScrollController(
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
      axis: scrollDirection,
    )..addListener(
          () => _isAppBarExpanded
          ? isExpaned != false
          ? setState(
            () {
          isExpaned = false;
          print('setState is called');
        },
      )
          : {}
          : isExpaned != true
          ? setState(() {
        print('setState is called');
        isExpaned = true;
      })
          : {},
    );
    super.initState();
  }

  Future _scrollToIndex(int index) async {
    await _autoScrollController.scrollToIndex(index,
        preferPosition: AutoScrollPosition.begin);
    _autoScrollController.highlight(index);
  }

  Widget _wrapScrollTag({required int index, required Widget child}) {
    return AutoScrollTag(
      key: ValueKey(index),
      controller: _autoScrollController,
      index: index,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(


        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.grey.shade300,
                  Colors.white,
                ],
              )
          ),

          child: SingleChildScrollView(
            physics: ScrollPhysics(),
            primary: true,
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                //Mavigation Bar
                Container(

                  height: size.height * 0.14,
                  width: size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        Container(
                          child: Image(
                            image: AssetImage("images/logo.png"),
                            width: 120,
                          ),
                        ),
                        Spacer(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DefaultTabController(
                              length: 4,
                              child: TabBar(
                                indicatorColor: Colors.transparent,
                                unselectedLabelColor: Color.fromARGB(255, 124, 152, 41),

                                onTap: (index) async {
                                  _scrollToIndex(index);
                                },
                                tabs: [
                                  Tab(

                                  ),
                                  Tab(

                                  ),
                                  Tab(

                                  ),
                                  Tab(

                                  ),

                                ],

                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Row(
                  children: [
                    //Social Icon
                    Container(
                      width: size.width * 0.10,
                      height: size.height - 82,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          IconButton(
                              icon: FaIcon(FontAwesomeIcons.twitter),
                              color: Color.fromARGB(255, 124, 152, 41),
                              iconSize: 16.0,
                              onPressed: () {

                              }),
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.linkedin),
                            color:  Color.fromARGB(255, 124, 152, 41),
                            onPressed: () {

                            },
                            iconSize: 16.0,
                          ),

                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Container(
                              height: size.height * 0.20,
                              width: 2,
                              color: Color.fromARGB(255, 124, 152, 41),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: size.height - 82,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: CustomScrollView(
                            controller: _autoScrollController,
                            slivers: <Widget>[
                              SliverList(
                                  delegate: SliverChildListDelegate([
                                    //About Me
                                   // _wrapScrollTag(
                                   //   index: 0,
                                  //   child: About(),
                                   // ),

                                  ])),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.07,
                      height: MediaQuery.of(context).size.height - 82,
                      //color: Colors.orange,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RotatedBox(
                            quarterTurns: 45,
                            child: Text(
                              "Create By Kodlateknoloji",
                              style: TextStyle(
                                color: Color.fromARGB(255, 124, 152, 41),
                                letterSpacing: 3.0,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Container(
                              height: 100,
                              width: 2,
                              color: Color.fromARGB(255, 124, 152, 41),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
