import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestoInfoScreen extends StatefulWidget {
  @override
  _RestoInfoScreenState createState() => _RestoInfoScreenState();
}

class _RestoInfoScreenState extends State<RestoInfoScreen> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              width: screenWidth,
              height: screenHeight,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/restaurant/louiseBranz.jpg")),
              ),
            ),

            Positioned(
              top: screenWidth * 0.1,
              left: screenWidth * 0.05,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  child: new Icon(
                    FontAwesomeIcons.angleLeft,
                    color: Styles.white,
                    size: 28,
                  ),
                ),
              ),
            ),

            Container(
              height: screenHeight,
              decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                    begin: FractionalOffset.center,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Styles.black.withOpacity(0.0),
                      Styles.black,
                    ],
                    stops: [
                      0.0,
                      0.5
                    ]
                  )
              ),
            ),


            Positioned(
              width: screenWidth * 0.5,
              left: screenWidth * 0.05,
              top: screenHeight * 0.5,
              child: Text("Louise Branz", style: Styles.customStyle("xlargeboldwhite"),)
            ),
            
            Positioned(
              right: screenWidth * 0.05,
              top: screenHeight * 0.5,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isFav = !isFav;
                  });
                },
                child: Container(
                  child: isFav ? Image.asset("assets/icon/fav.png", width: 40, height: 40) : 
                    new Icon(
                    FontAwesomeIcons.heart,
                    color: Styles.white,
                    size: 40,
                  ),
                ),
              ),
            ),

            Positioned(
              top: screenHeight * 0.625,
              left: screenWidth * 0.05,
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Western", style: Styles.customStyle("largewhite")),
                  Row(
                    children: <Widget>[
                      ButtonTheme(
                        minWidth: 0,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          onPressed: () {
                            //TODO : Calling
                          },
                          child: new Icon(
                            FontAwesomeIcons.phone,
                            color: Styles.white,
                            size: 20,
                          ),
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      ButtonTheme(
                        minWidth: 0,
                        child: FlatButton(
                          padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                          onPressed: () {
                            //TODO : Location
                          },
                          child: Image.asset("assets/icon/pin_location.png", width: 20, height: 20,),
                          shape: CircleBorder(
                            side: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),

            Positioned(
              top: screenHeight * 0.7,
              left: screenWidth * 0.05,
              child: Container(
                width: screenWidth * 0.9,
                height: 1,
                color: Colors.white,
              )
            ),

            Positioned(
              top: screenHeight * 0.7 + 10,
              left: screenWidth * 0.05,
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Opening Hours", style: Styles.customStyle("mediumboldwhite"),),
                  SizedBox(height: 5,),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Mon - Sat", style: Styles.customStyle("mediumwhite"),),
                        Text("7 AM - 11 PM", style: Styles.customStyle("mediumwhite"),),
                      ],
                    ),
                  )
                ],
              ),
            ),

            Positioned(
              top: screenHeight * 0.8,
              left: screenWidth * 0.05,
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("4.9", style: Styles.customStyle("largeboldwhite"),),
                      Text("Rating", style: Styles.customStyle("mediumwhite"),),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                  Column(
                    children: <Widget>[
                      Text("417", style: Styles.customStyle("largeboldwhite"),),
                      Text("Review", style: Styles.customStyle("mediumwhite"),),
                    ],
                  ),
                  Container(
                    width: 1,
                    height: 30,
                    color: Colors.white,
                  ),
                  Column(
                    children: <Widget>[
                      Text("174", style: Styles.customStyle("largeboldwhite"),),
                      Text("Favorites", style: Styles.customStyle("mediumwhite"),),
                    ],
                  ),
                ],
              ),
            ),

            Positioned(
              bottom: screenHeight * 0.05,
              left: screenWidth * 0.3,
              width: screenWidth * 0.4,
              child: OutlineButton(
                borderSide: BorderSide(color: Colors.white),
                color: Colors.white,
                child: Text("Show reviews", style: Styles.customStyle("mediumWhite")),
                onPressed: () {
                  //TODO : Show reviews
                },
                highlightColor: Styles.orange,
                highlightedBorderColor: Styles.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}