import 'package:flutter/material.dart';

class ServiceCardData extends StatelessWidget {
  final ServiceCardViewModel data;

  const ServiceCardData({
    Key key,
    this.data,
  }) : super(key: key);

  Widget titleImage() {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
      child: Container(
        height: 60,
        width: 60,
        color: data.image,
      ),
    );
  }

  Widget titleName() {
    // final article = this.data.articles[0];
    // final shouldClip = this.data.articles.length <= 1;
    final name = this.data.name;
    final overview = this.data.overview;
    return Container(
      width: 250,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Align(child: Text(name, style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),alignment: Alignment.topLeft,),
          Align(child: Text(overview,style: TextStyle(color: Colors.black, fontSize: 10)),alignment: Alignment.topLeft,),
        ]
      )
    );
  }

  Widget allCoupons() {
    final coupons = this.data.coupons;
    return Container(
        width: 250,
        child: Column(
            children: <Widget>[
              Align(child: Text(coupons[0].title, ),alignment: Alignment.topLeft,),
              Align(child: Text(coupons[1].title,),alignment: Alignment.topLeft,),
              Align(child: Text(coupons[2].title,),alignment: Alignment.topLeft,),
            ]
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          this.titleImage(),
          Column(
            children: <Widget>[
              this.titleName(),
              this.allCoupons(),
            ],
          )
        ],
      ),
    );
  }
}

class ServiceCardViewModel {
  /// 左侧图片
  final Color image;

  /// 商店名字
  final String name;

  /// 概述
  final String overview;

  /// 优惠列表
  final List<Coupon> coupons;

  const ServiceCardViewModel({
    this.image,
    this.name,
    this.overview,
    this.coupons,
  });
}

class Coupon {
  /// 文章标题
  final String title;

  const Coupon({
    this.title,
  });
}
