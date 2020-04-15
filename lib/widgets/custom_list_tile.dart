import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/screens/resto_menu_screen.dart';

import '../styles.dart';

class CustomRestoTile extends StatefulWidget {
  final Restaurant r;
  final double screenWidth;
  final double screenHeight;
  final Function addToCart;
  final Cart lastCart;

  const CustomRestoTile(
      {Key key,
      this.r,
      this.screenWidth,
      this.screenHeight,
      this.addToCart,
      this.lastCart})
      : super(key: key);

  @override
  _CustomRestoTileState createState() => new _CustomRestoTileState();
}

class _CustomRestoTileState extends State<CustomRestoTile> {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          height: 12, width: widget.screenWidth * 0.9, color: Styles.white),
      GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RestoMenuScreen(
                      addToCart: widget.addToCart,
                      r: widget.r,
                      lastCart: widget.lastCart,
                    ))),
        child: Container(
            width: widget.screenWidth * 0.9,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(children: <Widget>[
                Container(
                  height: 100,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 5,
                        child: Stack(overflow: Overflow.visible, children: <
                            Widget>[
                          Positioned(
                            left: 4,
                            child: Container(
                              width: widget.screenWidth * 0.24,
                              height: widget.screenWidth * 0.24,
                              decoration: BoxDecoration(
                                  image: widget.r.getImage(),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                            ),
                          ),
                          Positioned(
                            top: 10,
                            left: 0,
                            child: Container(
                                width: 40,
                                height: 18,
                                child:
                                    Image.asset("assets/icon/rating_page.png")),
                          ),
                          Positioned(
                            top: 11,
                            left: 3,
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  widget.r.getRatingText(),
                                  Image.asset("assets/icon/w_star.png",
                                      width: 12, height: 12)
                                ],
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: EdgeInsets.only(left: 16, top: 4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              widget.r.getNameText(),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 8),
                                child: widget.r.getTimeText(),
                              ),
                              widget.r.getLocationText(),
                              widget.r.getTypeText(),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            widget.r.getDistanceText(),
                            //TODO: Database, isFav ??
                            Icon(
                              FontAwesomeIcons.solidHeart,
                              color: Styles.orange,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 50),
                  child: ListView.builder(
                      itemCount: widget.r.featuredFoods.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 80,
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    image: widget.r.featuredFoods[index]
                                        .getImage(),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0))),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        widget.r.featuredFoods[index]
                                            .getNameText(),
                                        Container(
                                          margin: EdgeInsets.only(left: 16),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: widget.r.featuredFoods[index]
                                              .getRatingText(),
                                          decoration: BoxDecoration(
                                              color: Styles.lightOrange,
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0))),
                                        )
                                      ],
                                    ),
                                    widget.r.featuredFoods[index]
                                        .getPriceText(),
                                    widget.r.featuredFoods[index].getTypeText(),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                )
              ]),
            )),
      ),
    ]);
  }
}

class CustomRestoRecommendedTile extends StatefulWidget {
  final Restaurant r;
  final double screenWidth;
  final double screenHeight;
  final Function addToCart;
  final Cart c;

  const CustomRestoRecommendedTile(
      {Key key,
      this.r,
      this.screenWidth,
      this.screenHeight,
      this.addToCart,
      this.c})
      : super(key: key);

  @override
  _CustomRestoRecommendedTileState createState() =>
      new _CustomRestoRecommendedTileState();
}

class _CustomRestoRecommendedTileState
    extends State<CustomRestoRecommendedTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => RestoMenuScreen(
                    r: widget.r,
                    addToCart: widget.addToCart,
                    lastCart: widget.c,
                  ))),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              padding: EdgeInsets.all(10),
              width: widget.screenWidth * 0.9,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
              ),
              child: Row(children: <Widget>[
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    image: widget.r.getImage(),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                ),
                Container(
                  width: 210,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("${widget.r.name}",
                                style: Styles.customStyle("mediumBlack")),
                            Row(
                              children: <Widget>[
                                Text("${widget.r.getRating()}",
                                    style:
                                        Styles.customStyle("mediumBoldOrange")),
                                Image.asset("assets/icon/o_star.png",
                                    width: 16, height: 16),
                              ],
                            )
                          ]),
                      widget.r.getTimeText(),
                      widget.r.getTypeText(),
                    ],
                  ),
                ),
                Container(
                  width: 60,
                  padding: EdgeInsets.only(left: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("${widget.r.distance}",
                            style: Styles.customStyle("largeBoldBlack")),
                        Text("KM", style: Styles.customStyle("mediumBlack")),
                      ]),
                  decoration: BoxDecoration(
                    border: Border(left: BorderSide(color: Styles.gray)),
                  ),
                ),
              ])),
          //Dot
          Positioned(
            top: -5,
            right: -5,
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: widget.r.isClosed ? Styles.red : Styles.green,
              ),
            ),
          ),
          widget.r.isClosed
              ? Positioned(
                  top: 5,
                  left: 0,
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                      width: widget.screenWidth * 0.9,
                      height: widget.screenWidth * 0.15 + 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          color: Styles.black),
                    ),
                  ),
                )
              : Container(),
          widget.r.isClosed
              ? Positioned(
                  top: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("Restaurant is Closed",
                            style: Styles.customStyle("largeboldwhite")),
                        Text("Open 8am - 9pm",
                            style: Styles.customStyle("mediumwhite")),
                      ],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
