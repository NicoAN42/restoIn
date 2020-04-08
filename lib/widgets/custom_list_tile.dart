import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/restaurant.dart';

import '../styles.dart';

class CustomRestoTile extends StatefulWidget {
  final Restaurant r;
  final double screenWidth;
  final double screenHeight;

  const CustomRestoTile({Key key, this.r, this.screenWidth, this.screenHeight})
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
      Container(
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
                      child:
                          Stack(overflow: Overflow.visible, children: <Widget>[
                        Positioned(
                          left: 4,
                          child: Container(
                            width: 96,
                            height: 96,
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
                                widget.r.getRating(),
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
                // color: Styles.peach,
                padding: EdgeInsets.symmetric(horizontal: 60),
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
                                  image:
                                      widget.r.featuredFoods[index].getImage(),
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
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
                                        child: widget.r.featuredFoods[index]
                                            .getRatingText(),
                                        decoration: BoxDecoration(
                                            color: Styles.lightOrange,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(4.0))),
                                      )
                                    ],
                                  ),
                                  widget.r.featuredFoods[index].getPriceText(),
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
    ]);
  }
}
