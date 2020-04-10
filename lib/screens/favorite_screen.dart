import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Code the contents here
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.05, screenWidth * 0.05, 20),
              child: Stack(
                children: <Widget>[
                  Container(width: screenWidth, height: 20),
                  Positioned(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: new Icon(
                          FontAwesomeIcons.angleLeft,
                          color: Styles.black,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      "Favorites",
                      style: Styles.customStyle("largeboldblack"),
                    ),
                  )
                ],
              ),
            ),

            // Content
            Container(
                color: Color(0xFFF7F7F7),
                child: Column(
                  children: <Widget>[
                    // Restaurant 1
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          // Favorite's Content
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: screenWidth * 0.9,
                                      height: screenWidth * 0.22,
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Stack(
                                          children: <Widget>[
                                            // Restaurant Image
                                            Container(
                                                width: screenWidth * 0.22 + 4,
                                                height: screenWidth * 0.22),
                                            Positioned(
                                                left: 4,
                                                child: Container(
                                                  width: screenWidth * 0.22,
                                                  height: screenWidth * 0.22,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/restaurant/chineseResident.png"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                                )),
                                            Positioned(
                                              top: 10,
                                              left: 0,
                                              child: Container(
                                                  width: 40,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icon/rating_page.png")),
                                            ),
                                            Positioned(
                                              top: 11,
                                              left: 3,
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "4.9 ",
                                                      style: Styles.customStyle(
                                                          "smallwhite"),
                                                    ),
                                                    Image.asset(
                                                        "assets/icon/w_star.png",
                                                        width: 12,
                                                        height: 12)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // End of image
                                          ],
                                        )),
                                    // Text
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        left: screenWidth * 0.22 + 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Kung Fa Pan",
                                              style: Styles.customStyle(
                                                  "mediumboldblack"),
                                            ),
                                            Text("Open 7am - 11pm",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(
                                                "No. 20 Queen Street, Tangerang",
                                                style: Styles.customStyle(
                                                    "smallgray")),
                                            Text(
                                              "Thailand Chinese",
                                              style: Styles.customStyle(
                                                  "smallgray"),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        right: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text("40",
                                                    style: Styles.customStyle(
                                                        "mediumboldblack")),
                                                Text("MINS",
                                                    style: Styles.customStyle(
                                                        "smallblack")),
                                              ],
                                            ),
                                            Image.asset("assets/icon/fav.png",
                                                width: 18, height: 18)
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ), // End of Favorite Content
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          // Favorite's Content
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: screenWidth * 0.9,
                                      height: screenWidth * 0.22,
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Stack(
                                          children: <Widget>[
                                            // Restaurant Image
                                            Container(
                                                width: screenWidth * 0.22 + 4,
                                                height: screenWidth * 0.22),
                                            Positioned(
                                                left: 4,
                                                child: Container(
                                                  width: screenWidth * 0.22,
                                                  height: screenWidth * 0.22,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/restaurant/louiseBranz.jpg"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                                )),
                                            Positioned(
                                              top: 10,
                                              left: 0,
                                              child: Container(
                                                  width: 40,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icon/rating_page.png")),
                                            ),
                                            Positioned(
                                              top: 11,
                                              left: 3,
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "4.9 ",
                                                      style: Styles.customStyle(
                                                          "smallwhite"),
                                                    ),
                                                    Image.asset(
                                                        "assets/icon/w_star.png",
                                                        width: 12,
                                                        height: 12)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // End of image
                                          ],
                                        )),
                                    // Text
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        left: screenWidth * 0.22 + 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Louise Branz",
                                              style: Styles.customStyle(
                                                  "mediumboldblack"),
                                            ),
                                            Text("Open 7am - 11pm",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text(
                                                "No. 17 Large River, Tangerang",
                                                style: Styles.customStyle(
                                                    "smallgray")),
                                            Text(
                                              "Western Indonesian",
                                              style: Styles.customStyle(
                                                  "smallgray"),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        right: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text("40",
                                                    style: Styles.customStyle(
                                                        "mediumboldblack")),
                                                Text("MINS",
                                                    style: Styles.customStyle(
                                                        "smallblack")),
                                              ],
                                            ),
                                            Image.asset("assets/icon/fav.png",
                                                width: 18, height: 18)
                                          ],
                                        )),
                                  ],
                                ),

                                // Food from Restaurant
                                Container(
                                  padding:
                                      EdgeInsets.only(top: screenWidth * 0.05),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.14,
                                      ),
                                      Positioned(
                                          left: screenWidth * 0.18,
                                          child: Container(
                                            width: screenWidth * 0.14,
                                            height: screenWidth * 0.14,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/food/square/roasted-cherry-double-chocolate-buckwheat-ice-cream-sandwiches-gluten-free-10.jpg"),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                          )),
                                      Positioned(
                                          left: screenWidth * 0.32 + 20,
                                          height: screenWidth * 0.14,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Chunky Pie  ",
                                                    style: Styles.customStyle(
                                                        "mediumblack"),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 2, 4, 2),
                                                    child: Text(
                                                      "5.0",
                                                      style: Styles.customStyle(
                                                          "smallboldwhite"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      color: Styles.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text("IDR 75.000",
                                                  style: Styles.customStyle(
                                                      "smallblack")),
                                              Text(
                                                "Western",
                                                style: Styles.customStyle(
                                                    "smallgray"),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.only(top: screenWidth * 0.05),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.14,
                                      ),
                                      Positioned(
                                          left: screenWidth * 0.18,
                                          child: Container(
                                            width: screenWidth * 0.14,
                                            height: screenWidth * 0.14,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/food/square/fBreadTofu.jpg"),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                          )),
                                      Positioned(
                                          left: screenWidth * 0.32 + 20,
                                          height: screenWidth * 0.14,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "F' Bread Tofu  ",
                                                    style: Styles.customStyle(
                                                        "mediumblack"),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 2, 4, 2),
                                                    child: Text(
                                                      "5.0",
                                                      style: Styles.customStyle(
                                                          "smallboldwhite"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      color: Styles.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text("IDR 35.000",
                                                  style: Styles.customStyle(
                                                      "smallblack")),
                                              Text(
                                                "Western Indonesian",
                                                style: Styles.customStyle(
                                                    "smallgray"),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                // End of Food Content
                              ],
                            ),
                          ), // End of Favorite Content
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          // Favorite's Content
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: screenWidth * 0.9,
                                      height: screenWidth * 0.22,
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Stack(
                                          children: <Widget>[
                                            // Restaurant Image
                                            Container(
                                                width: screenWidth * 0.22 + 4,
                                                height: screenWidth * 0.22),
                                            Positioned(
                                                left: 4,
                                                child: Container(
                                                  width: screenWidth * 0.22,
                                                  height: screenWidth * 0.22,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/restaurant/hakagureRamen.jpg"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                                )),
                                            Positioned(
                                              top: 10,
                                              left: 0,
                                              child: Container(
                                                  width: 40,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icon/rating_page.png")),
                                            ),
                                            Positioned(
                                              top: 11,
                                              left: 3,
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "4.9 ",
                                                      style: Styles.customStyle(
                                                          "smallwhite"),
                                                    ),
                                                    Image.asset(
                                                        "assets/icon/w_star.png",
                                                        width: 12,
                                                        height: 12)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // End of image
                                          ],
                                        )),
                                    // Text
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        left: screenWidth * 0.22 + 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Hakagure Ramen",
                                              style: Styles.customStyle(
                                                  "mediumboldblack"),
                                            ),
                                            Text("Open 10am - 10pm",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text("No. 61 Tokyo Ghoul, Sentul",
                                                style: Styles.customStyle(
                                                    "smallgray")),
                                            Text(
                                              "Japanese",
                                              style: Styles.customStyle(
                                                  "smallgray"),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        right: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text("30",
                                                    style: Styles.customStyle(
                                                        "mediumboldblack")),
                                                Text("MINS",
                                                    style: Styles.customStyle(
                                                        "smallblack")),
                                              ],
                                            ),
                                            Image.asset("assets/icon/fav.png",
                                                width: 18, height: 18)
                                          ],
                                        )),
                                  ],
                                ),

                                // Food from Restaurant
                                Container(
                                  padding:
                                      EdgeInsets.only(top: screenWidth * 0.05),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        width: screenWidth * 0.9,
                                        height: screenWidth * 0.14,
                                      ),
                                      Positioned(
                                          left: screenWidth * 0.18,
                                          child: Container(
                                            width: screenWidth * 0.14,
                                            height: screenWidth * 0.14,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      "assets/food/square/miso-rice-noodle-ramen-vegetarian-lede-62.jpg"),
                                                ),
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(8.0))),
                                          )),
                                      Positioned(
                                          left: screenWidth * 0.32 + 20,
                                          height: screenWidth * 0.14,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Text(
                                                    "Ramen Yu Na  ",
                                                    style: Styles.customStyle(
                                                        "mediumblack"),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            4, 2, 4, 2),
                                                    child: Text(
                                                      "4.9",
                                                      style: Styles.customStyle(
                                                          "smallboldwhite"),
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  4)),
                                                      color: Styles.orange,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Text("IDR 195.000",
                                                  style: Styles.customStyle(
                                                      "smallblack")),
                                              Text(
                                                "Japanese",
                                                style: Styles.customStyle(
                                                    "smallgray"),
                                              )
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                                // End of Food Content
                              ],
                            ),
                          ), // End of Favorite Content
                        ],
                      ),
                    ),

                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(top: 10),
                      child: Column(
                        children: <Widget>[
                          // Favorite's Content
                          Container(
                            padding: EdgeInsets.fromLTRB(
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05,
                                screenWidth * 0.05),
                            child: Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    Container(
                                      width: screenWidth * 0.9,
                                      height: screenWidth * 0.22,
                                    ),
                                    Positioned(
                                        top: 0,
                                        left: 0,
                                        child: Stack(
                                          children: <Widget>[
                                            // Restaurant Image
                                            Container(
                                                width: screenWidth * 0.22 + 4,
                                                height: screenWidth * 0.22),
                                            Positioned(
                                                left: 4,
                                                child: Container(
                                                  width: screenWidth * 0.22,
                                                  height: screenWidth * 0.22,
                                                  decoration: BoxDecoration(
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: AssetImage(
                                                            "assets/restaurant/5cf3dc9b57ad28bc6434f828e11fd83f.jpg"),
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  8.0))),
                                                )),
                                            Positioned(
                                              top: 10,
                                              left: 0,
                                              child: Container(
                                                  width: 40,
                                                  height: 18,
                                                  child: Image.asset(
                                                      "assets/icon/rating_page.png")),
                                            ),
                                            Positioned(
                                              top: 11,
                                              left: 3,
                                              child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "4.2 ",
                                                      style: Styles.customStyle(
                                                          "smallwhite"),
                                                    ),
                                                    Image.asset(
                                                        "assets/icon/w_star.png",
                                                        width: 12,
                                                        height: 12)
                                                  ],
                                                ),
                                              ),
                                            ),
                                            // End of image
                                          ],
                                        )),
                                    // Text
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        left: screenWidth * 0.22 + 20,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "Mexican Rud",
                                              style: Styles.customStyle(
                                                  "mediumboldblack"),
                                            ),
                                            Text("Open 7am - 11pm",
                                                style: Styles.customStyle(
                                                    "smallblack")),
                                            Text("No. 1 Snow Street, Surabaya",
                                                style: Styles.customStyle(
                                                    "smallgray")),
                                            Text(
                                              "American Coffee",
                                              style: Styles.customStyle(
                                                  "smallgray"),
                                            )
                                          ],
                                        )),
                                    Positioned(
                                        height: screenWidth * 0.22,
                                        right: 0,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: <Widget>[
                                            Column(
                                              children: <Widget>[
                                                Text("16",
                                                    style: Styles.customStyle(
                                                        "mediumboldblack")),
                                                Text("MINS",
                                                    style: Styles.customStyle(
                                                        "smallblack")),
                                              ],
                                            ),
                                            Image.asset("assets/icon/fav.png",
                                                width: 18, height: 18)
                                          ],
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ), // End of Favorite Content
                        ],
                      ),
                    ),
                  ],
                ))

            // Code the contents here
          ],
        ),
      ),
    );
  }
}
