import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_comment.dart';

class RestoInfoReviewScreen extends StatefulWidget {
  @override
  _RestoInfoReviewScreenState createState() => _RestoInfoReviewScreenState();
}

class _RestoInfoReviewScreenState extends State<RestoInfoReviewScreen> {
  int menu = 0;

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
                image: AssetImage(
                    "assets/food/square/fruteLaMina.jpg"),
              ),
              borderRadius:
                  BorderRadius.all(Radius.circular(8.0))),
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
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/restaurant/louiseBranz.jpg")),
                  ),
                ),

                Positioned(
                  top: screenWidth * 0.1,
                  left: screenWidth * 0.05,
                  child: 
                  Row(
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
                      SizedBox(width: 20,),
                      Text("Louise Branz", style: Styles.customStyle("largeboldwhite")),
                    ],
                  )
                ),
              ],
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              child: Column(
                children: <Widget>[
                  Text("Reviews", style: Styles.customStyle("largeboldblack"),),
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
                        child: Text("Comment", style: menu == 0 ? Styles.customStyle("mediumboldblack") : Styles.customStyle("mediumblack")),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            menu = 1;
                          });
                        },
                        child: Text("Gallery", style: menu == 1 ? Styles.customStyle("mediumboldblack") : Styles.customStyle("mediumblack")),
                      ),
                    ],
                  )
                ],
              ),
            ),
      
            Container(
              width: screenWidth,
              padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
              color: Colors.white,
              child: menu == 0 ? 
                Container(
                color: Colors.white,
                width: screenWidth,
                child: Column(
                  children: <Widget>[
                    CustomComment(
                      profilePic: "assets/food/square/fruteLaMina.jpg",
                      name: "Frute La Mina",
                      comment: "So delicious,,, maknyusssss, and also with place i'm so excited",
                      image: ["assets/food/square/fruteLaMina.jpg", "assets/food/square/fruteLaMina.jpg", "assets/food/square/fruteLaMina.jpg", "assets/food/square/fruteLaMina.jpg"],
                      star: 5,
                      screenWidth: screenWidth, 
                      screenHeight: screenHeight,
                    ),
                    CustomComment(
                      profilePic: "assets/food/square/fruteLaMina.jpg",
                      name: "Frute La Mina",
                      comment: "Enak cuy",
                      star: 4,
                      screenWidth: screenWidth, 
                      screenHeight: screenHeight,
                    ),
                    CustomComment(
                      profilePic: "assets/food/square/fruteLaMina.jpg",
                      name: "Frute La Mina",
                      comment: "Mantap slur",
                      star: 5,
                      screenWidth: screenWidth, 
                      screenHeight: screenHeight,
                    ),
                    CustomComment(
                      profilePic: "assets/food/square/fruteLaMina.jpg",
                      name: "Frute La Mina",
                      comment: "Screennya banyak sekali :((",
                      star: 3,
                      screenWidth: screenWidth, 
                      screenHeight: screenHeight,
                    ),
                    CustomComment(
                      profilePic: "assets/food/square/fruteLaMina.jpg",
                      name: "Frute La Mina",
                      comment: "Acel tolong carry ya",
                      star: 5,
                      screenWidth: screenWidth, 
                      screenHeight: screenHeight,
                    ),
                    SizedBox(height: 50),
                  ]
                ),
              )
              : Wrap(
                spacing: screenWidth * 0.05,
                runSpacing: screenWidth * 0.05,
                children: createGalleryList(screenWidth)
              ),
            ),

          ],
        ),
      ),

      floatingActionButton: Container(
        width: screenWidth * 0.8,
        child: CustomReviewButton(text: "Write a review"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
      ),
    );
  }
}