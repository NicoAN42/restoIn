import 'package:flutter/material.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_comment.dart';

class RestoInfoReviewScreen extends StatefulWidget {
  final Restaurant r;

  const RestoInfoReviewScreen({Key key, this.r}) : super(key: key);

  @override
  _RestoInfoReviewScreenState createState() => _RestoInfoReviewScreenState();
}

class _RestoInfoReviewScreenState extends State<RestoInfoReviewScreen> {
  int menu = 0;
  FocusNode _focus = new FocusNode();
  TextEditingController _controller = new TextEditingController();

  List<Widget> createGalleryList(double screenWidth) {
    List<Widget> list = new List();
    for (int i = 0; i < 18; i++) {
      list.add(
        Container(
          width: screenWidth * 0.2666,
          height: screenWidth * 0.2666,
          decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/food/square/fruteLaMina.jpg"),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
      );
    }
    list.add(SizedBox(height: 50));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.23,
                  decoration: BoxDecoration(image: widget.r.getImage()),
                ),
                Positioned(
                    top: screenWidth * 0.1,
                    left: screenWidth * 0.05,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            child: new Icon(
                              FontAwesomeIcons.angleLeft,
                              color: Styles.white,
                              size: 28,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text("${widget.r.name}",
                            style: Styles.customStyle("largeboldwhite")),
                      ],
                    )),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: <Widget>[
                  Text(
                    "Reviews",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    width: screenWidth * 0.9,
                    height: 2,
                    color: Styles.white,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            menu = 0;
                          });
                        },
                        child: Text("Comment",
                            style: menu == 0
                                ? Styles.customStyle("mediumboldblack")
                                : Styles.customStyle("mediumblack")),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            menu = 1;
                          });
                        },
                        child: Text("Gallery",
                            style: menu == 1
                                ? Styles.customStyle("mediumboldblack")
                                : Styles.customStyle("mediumblack")),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: screenWidth,
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05, right: screenWidth * 0.05),
              color: Colors.white,
              child: menu == 0
                  ? Container(
                      color: Colors.white,
                      width: screenWidth,
                      child: Column(children: <Widget>[
                        CustomComment(
                          profilePic: "assets/food/square/fruteLaMina.jpg",
                          name: "Frute La Mina",
                          comment: "Great food, great place, i'm satisfied!",
                          image: [
                            "assets/food/square/fruteLaMina.jpg",
                            "assets/food/square/fruteLaMina.jpg",
                            "assets/food/square/fruteLaMina.jpg",
                            "assets/food/square/fruteLaMina.jpg"
                          ],
                          star: 5,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        CustomComment(
                          profilePic: "assets/food/square/fruteLaMina.jpg",
                          name: "Frute La Mina",
                          comment: "It's too sweet for me.",
                          star: 4,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        CustomComment(
                          profilePic: "assets/food/square/fruteLaMina.jpg",
                          name: "Frute La Mina",
                          comment: "Lovin' it!",
                          star: 5,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        CustomComment(
                          profilePic: "assets/food/square/fruteLaMina.jpg",
                          name: "Frute La Mina",
                          comment: "So sweet :D",
                          star: 3,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        CustomComment(
                          profilePic: "assets/food/square/fruteLaMina.jpg",
                          name: "Frute La Mina",
                          comment: "I love it!",
                          star: 5,
                          screenWidth: screenWidth,
                          screenHeight: screenHeight,
                        ),
                        SizedBox(height: 50),
                      ]),
                    )
                  : Wrap(
                      spacing: screenWidth * 0.05,
                      runSpacing: screenWidth * 0.05,
                      children: createGalleryList(screenWidth)),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        width: screenWidth * 0.8,
        child: FloatingActionButton.extended(
            onPressed: () {
              _showReviewDialog();
            },
            backgroundColor: Styles.orange,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            label: Text(
              "Write a review",
              style: Styles.customStyle("mediumboldwhite"),
            )),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _showReviewDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        int stars = 0;
        return StatefulBuilder(builder: (context, setState) {
          return SimpleDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            "assets/icon/close.png",
                            width: 12,
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text("Write a review",
                                style: Styles.customStyle("mediumBoldBlack")),
                          )
                        ],
                      ),
                    ),
                    Container(
                      // height: 40,
                      child: TextField(
                        style: Styles.customStyle("smallBlack"),
                        focusNode: _focus,
                        controller: _controller,
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                          hintText: "ex: Love this place",
                          hintStyle: Styles.customStyle("smallGray"),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Styles.gray),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Styles.black),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 24),
                            child: Text("Upload Picture/Video",
                                style: Styles.customStyle("mediumBoldBlack")),
                          ),
                          Image.asset(
                            "assets/icon/upload.png",
                            width: 24,
                            height: 24,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 24),
                              child: Text("Rate",
                                  style: Styles.customStyle("mediumBoldBlack")),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                stars != 1 ? stars = 1 : stars = 0;
                              }),
                              child: Icon(
                                stars >= 1
                                    ? FontAwesomeIcons.solidStar
                                    : FontAwesomeIcons.star,
                                color: Styles.orange,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                stars != 2 ? stars = 2 : stars = 0;
                              }),
                              child: Icon(
                                stars >= 2
                                    ? FontAwesomeIcons.solidStar
                                    : FontAwesomeIcons.star,
                                color: Styles.orange,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                stars != 3 ? stars = 3 : stars = 0;
                              }),
                              child: Icon(
                                stars >= 3
                                    ? FontAwesomeIcons.solidStar
                                    : FontAwesomeIcons.star,
                                color: Styles.orange,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                stars != 4 ? stars = 4 : stars = 0;
                              }),
                              child: Icon(
                                stars >= 4
                                    ? FontAwesomeIcons.solidStar
                                    : FontAwesomeIcons.star,
                                color: Styles.orange,
                                size: 24,
                              ),
                            ),
                            GestureDetector(
                              onTap: () => setState(() {
                                stars != 5 ? stars = 5 : stars = 0;
                              }),
                              child: Icon(
                                stars >= 5
                                    ? FontAwesomeIcons.solidStar
                                    : FontAwesomeIcons.star,
                                color: Styles.orange,
                                size: 24,
                              ),
                            ),
                          ],
                        )),
                    Container(
                      width: 400,
                      child: RaisedButton(
                        child: Text("Confirm",
                            style: Styles.customStyle("mediumBoldWhite")),
                        color: Styles.orange,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {
                          Navigator.of(context, rootNavigator: true).pop();
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        });
      },
    );
  }
}
