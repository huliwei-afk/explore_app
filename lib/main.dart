import 'dart:developer';

import 'package:explore_app/StickyTabBarDelegate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:explore_app/CustomIndicator.dart';
import 'package:explore_app/mock_data.dart';
import 'package:explore_app/ServiceCardData.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  Widget lifeService() {
    return LifeServiceWidget();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  Widget scrollPage(BuildContext context) {
    // return ListView.builder(
    //     itemCount: 4,
    //     itemBuilder: (context, index){
    //       if(index == 0){
    //         return this.titleImage();
    //       }
    //       if(index == 1){
    //         return this.multiIconTab();
    //       }
    //       if(index == 2){
    //         return this.newerOnly();
    //       }
    //       if(index == 3){
    //         return this.lifeService();
    //       }
    //       return empty();
    //     }
    // );
    // return Column(children: <Widget>[
    //   CustomScrollView(
    //     slivers: <Widget>[
    //       SliverToBoxAdapter(
    //         child: Container(
    //           child: Column(
    //             children: <Widget>[
    //               this.titleImage(),
    //               this.multiIconTab(),
    //               this.newerOnly(),
    //             ],
    //           ),
    //         ),
    //       ),
    //     ],
    //   )
    // ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "蘑菇街识货",
        home: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.white,
              title: Text("生活服务", style: TextStyle(color: Colors.black)),
            ),
            // body: NestedScrollView(
            //   headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            //     return <Widget>[SliverAppBar(
            //       pinned: true,
            //       backgroundColor: Colors.white,
            //       centerTitle: true,
            //       title: Text("生活服务",style: TextStyle(color: Colors.black)),
            //     )];
            //   },
            body: lifeService()));
  }
}

//multiIconTab------------------------------------------------------------------
class TabBarStatefulWidget extends StatefulWidget {
  TabBarStatefulWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _TabBarStatefulWidget();
  }
}

class _TabBarStatefulWidget extends State<TabBarStatefulWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  Widget initGrid() {
    return GridView.count(
      crossAxisCount: 5,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Column(
          children: <Widget>[Icon(Icons.accessibility_sharp), Text('电影订票')],
        ),
        Column(
          children: <Widget>[Icon(Icons.access_time), Text('爱奇艺')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add_a_photo), Text('外卖红包')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add), Text('商超买单')],
        ),
        Column(
          children: <Widget>[Icon(Icons.ac_unit), Text('话费充值')],
        ),
        Column(
          children: <Widget>[Icon(Icons.accessibility_sharp), Text('电影订票')],
        ),
        Column(
          children: <Widget>[Icon(Icons.access_time), Text('爱奇艺')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add_a_photo), Text('外卖红包')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add), Text('商超买单')],
        ),
        Column(
          children: <Widget>[Icon(Icons.ac_unit), Text('话费充值')],
        ),
        Column(
          children: <Widget>[Icon(Icons.accessibility_sharp), Text('电影订票')],
        ),
        Column(
          children: <Widget>[Icon(Icons.access_time), Text('爱奇艺')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add_a_photo), Text('外卖红包')],
        ),
        Column(
          children: <Widget>[Icon(Icons.add), Text('商超买单')],
        ),
        Column(
          children: <Widget>[Icon(Icons.ac_unit), Text('话费充值')],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
          child: TabBar(
            labelColor: Colors.black,
            labelStyle: TextStyle(fontSize: 15),
            isScrollable: true,
            indicator: CustomIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.red)),
            tabs: <Widget>[
              Tab(text: '热门'),
              Tab(text: '影音会员'),
              Tab(text: '美食饮品'),
              Tab(text: '游戏专区'),
              Tab(text: '交通出行')
            ],
            controller: _tabController,
          ),
        ),
        Container(
            alignment: Alignment.center,
            height: 200,
            child: (TabBarView(controller: _tabController, children: <Widget>[
              initGrid(),
              initGrid(),
              initGrid(),
              initGrid(),
              initGrid()
            ])))
      ],
    ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
//multiIconTab------------------------------------------------------------------

//newerOnly---------------------------------------------------------------------
class NewerOnlyWidget extends StatefulWidget {
  NewerOnlyWidget({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NewerOnlyWidget();
  }
}

class _NewerOnlyWidget extends State<NewerOnlyWidget>
    with SingleTickerProviderStateMixin {
  // AnimationController animationController;
  //
  // @override
  // void initState(){
  //   super.initState();
  //   animationController = new AnimationController(lowerBound: 0, upperBound: 1, duration: const Duration(seconds: 1), vsync: this);
  //   animationController.forward();
  //   animationController.addStatusListener((status) {
  //     if(status == AnimationStatus.completed){
  //       animationController.reset();
  //       animationController.forward();
  //     }
  //   });
  // }
  //
  // @override
  // void dispose(){
  //   animationController.dispose();
  //   super.dispose();
  // }

  Widget buildTransition() {
    return Container(
        width: 70,
        height: 80,

        ///过渡
        //opacity: animationController,
        //将要执行动画的子view
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return new Image.network(
              imgList[index]["url"],
              fit: BoxFit.fill, //图片填充
            );
          },
          autoplay: true, //自动能播放
          loop: true, //循环播放
          itemCount: imgList.length,
          scrollDirection: Axis.vertical,
        ));
    //   child: Container(
    //     width: 70,
    //     height: 80,
    //     child: Swiper(
    //     itemBuilder: (BuildContext context, int index) {
    //       return new Image.network(
    //         imgList[index]["url"],
    //         fit: BoxFit.fill,//图片填充
    //      );
    //     },
    //     autoplay: true,//自动能播放
    //     loop: true,//循环播放
    //     itemCount: imgList.length,
    //     scrollDirection: Axis.vertical,
    //   )
    //     //color: Color.fromARGB(alpha, R, G, B),
    //   ),
    // );
  }

  List<Map> imgList = [
    {
      "url":
          "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/f9198618367adab48acc62a189d4b31c8701e430.jpg",
    },
    {
      "url":
          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fattach.bbs.miui.com%2Fforum%2F201104%2F16%2F2136492e16kpc6oqcz1rie.jpg&refer=http%3A%2F%2Fattach.bbs.miui.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1630564359&t=d54f4591b787561f6dff975572f1ba3f",
    },
    {
      "url":
          "https://ss0.baidu.com/94o3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item/8d5494eef01f3a29bde7e3c69a25bc315c607c8e.jpg",
    },
    {
      "url":
          "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic27.nipic.com%2F20130129%2F11507979_020415120167_2.jpg&refer=http%3A%2F%2Fpic27.nipic.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1630564399&t=53ea95ded1921661cc7105fce357ec6c",
    },
  ];

  Widget initGrid(BuildContext context) {
    return Container(
      height: 110,
      width: 320,
      decoration: BoxDecoration(
          border:
              Border.all(width: 0, color: Color.fromARGB(255, 250, 230, 210)),
          color: Color.fromARGB(255, 250, 230, 210),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTransition(),
              Text('¥0.01'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTransition(),
              Text('¥99.9'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTransition(),
              Text('¥50.0'),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              buildTransition(),
              Text('¥30.0'),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 340,
      decoration: BoxDecoration(
          border:
              Border.all(width: 0, color: Color.fromARGB(100, 250, 210, 210)),
          color: Color.fromARGB(100, 250, 210, 210),
          borderRadius: BorderRadius.circular(10)),
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 10,
            top: 10,
            child: Text(
              '新人专享',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Positioned(
            right: 10,
            top: 10,
            child: Text(
              '更多专属优惠',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.8),
            child: initGrid(context),
          )
        ],
      ),
    );
  }
}
//newerOnly---------------------------------------------------------------------

//lifeService-------------------------------------------------------------------
class LifeServiceWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LifeServiceWidget();
  }
}

class _LifeServiceWidget extends State<LifeServiceWidget>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  //加载更多
  ScrollController _controller = new ScrollController();

  bool isLoading = false; //是否正在加载数据

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
          loadMoreData();
      }
    });
  }

  Future loadMoreData() async {
    if (!isLoading) {
      setState(() {
        isLoading = true;
      });
      await Future.delayed(Duration(seconds: 1), () {
        print('加载更多');
        setState(() {
          serviceCardList.addAll(serviceCardList);

          isLoading = false;
        });
      });
    }
  }

  Widget renderRow(BuildContext context, int index) {
    if (index < serviceCardList.length) {
      return ServiceCardData(data: serviceCardList[index]);
    }
    return _getMoreWidget();
  }

  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }

  Widget initList() {
    return ListView.builder(
        itemCount: serviceCardList.length + 1,
        // itemBuilder: (context, index) {
        //   return ServiceCardData(data: serviceCardList[index]);
        // }
        itemBuilder: renderRow
    );
  }

  Widget titleImage() {
    return Column(
      children: <Widget>[Image.asset('image/titleImage.jpg')],
    );
  }

  Widget multiIconTab() {
    return TabBarStatefulWidget();
  }

  Widget newerOnly() {
    return NewerOnlyWidget();
  }

  @override
  Widget build(BuildContext context) {
    // return CustomScrollView(
    //   slivers: <Widget>[
    //     SliverToBoxAdapter(
    //       child: Container(
    //         child: Column(
    //           children: <Widget>[
    //             titleImage(),
    //             multiIconTab(),
    //             newerOnly(),
    //           ],
    //         ),
    //       ),
    //     ),
    //     SliverPersistentHeader(
    //       pinned: true,
    //       delegate: StickyTabBarDelegate(
    //         TabBar(
    //           labelColor: Colors.black,
    //           labelStyle: TextStyle(fontSize: 15),
    //           isScrollable: true,
    //           indicator: CustomIndicator(
    //               borderSide: BorderSide(width: 3.0, color: Colors.red)),
    //           tabs: <Widget>[
    //             Tab(text: '美食餐饮'),
    //             // Tab(text: '点外卖'),
    //             // Tab(text: '商超优惠'),
    //             // Tab(text: '优惠充值')
    //           ],
    //           controller: _tabController,
    //         ),
    //       ),
    //     ),
    //     SliverFillRemaining(
    //         child: TabBarView(
    //       controller: _tabController,
    //       children: <Widget>[
    //         ListView.builder(
    //             itemCount: serviceCardList.length,
    //             itemBuilder: (context, index) {
    //               return ServiceCardData(data: serviceCardList[index]);
    //             })
    //       ],
    //     ))
    //   ],
    // );
    return NestedScrollView(
        controller: _controller,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                //加了pinned就出问题，不加又没效果
                //pinned: true,
                expandedHeight: 200,
                backgroundColor: Color(0xffffffff),
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                  child: Container(),
                  preferredSize: Size.fromHeight(450),
                ),
                flexibleSpace: Column(
                  children: <Widget>[
                    this.titleImage(),
                    this.multiIconTab(),
                    this.newerOnly()
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: StickyTabBarDelegate(
                    TabBar(
                      labelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: 15),
                      isScrollable: true,
                      indicator: CustomIndicator(
                          borderSide:
                              BorderSide(width: 3.0, color: Colors.red)),
                      tabs: <Widget>[
                        Tab(text: '美食餐饮'),
                        Tab(text: '点外卖'),
                        Tab(text: '商超优惠'),
                        Tab(text: '优惠充值')
                      ],
                      controller: _tabController,
                    ),
                    color: Colors.white))
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[initList(), initList(), initList(), initList()],
        ));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _controller.dispose();
    super.dispose();
  }
}
//lifeService-------------------------------------------------------------------
