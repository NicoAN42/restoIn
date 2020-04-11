import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RestoMenuScreen extends StatefulWidget {
  @override
  _RestoMenuScreenState createState() => _RestoMenuScreenState();
}

class _RestoMenuScreenState extends State<RestoMenuScreen> {
  int menu;

  List<FlatButton> createCategory() {
    //TODO : Make category bold when selected + Display menu according to selected category
    List<FlatButton> list = new List();
    list.add(
      new FlatButton(
        onPressed: null, 
        child: Text("Recommended", style: Styles.customStyle("mediumblack"))
      )
    );
    list.add(
      new FlatButton(
        onPressed: null, 
        child: Text("Main", style: Styles.customStyle("mediumblack"))
      )
    );
    list.add(
      new FlatButton(
        onPressed: null, 
        child: Text("Dessert", style: Styles.customStyle("mediumblack"))
      )
    );
    list.add(
      new FlatButton(
        onPressed: null, 
        child: Text("Lunch", style: Styles.customStyle("mediumblack"))
      )
    );
    list.add(
      new FlatButton(
        onPressed: null, 
        child: Text("Breakfast", style: Styles.customStyle("mediumblack"))
      )
    );
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
                  width: screenWidth * 0.9,
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      GestureDetector(
                        onTap: () {
                          //TODO : Burger menu
                        },
                        child: Container(
                          child: new Icon(
                            FontAwesomeIcons.bars,
                            color: Styles.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),

            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  Text("Louise Branz", style: Styles.customStyle("largeboldblack"),),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("35 ", style: Styles.customStyle("largeboldblack"),),
                      Text("MINS", style: Styles.customStyle("midblack"),),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    height: 2,
                    color: Styles.white,
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(bottom: 20),
              color: Colors.white,
              child: SizedBox(
                height: 30,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: createCategory(),
                ),
              ),
            ),

            Container(
              padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05, bottom: screenWidth * 0.05),
              color: Colors.white,
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  RestoMenuSection(
                    image: "assets/food/square/chunkyPie.jpg",
                    name: "Chunky Pie",
                    desc: "Chocolate, milk, cream, waffle, honey",
                    price: 75000,
                    screenWidth: screenWidth,
                  ),
                  RestoMenuSection(
                    image: "assets/food/square/fBreadTofu.jpg",
                    name: "F' Bread Tofu",
                    desc: "Tofu, garlic, chicken, egg, mayo",
                    price: 35000,
                    screenWidth: screenWidth,
                  ),
                  RestoMenuSection(
                    image: "assets/food/square/eggplant-curry-202.jpg",
                    name: "Egg Plant Curry",
                    desc: "Egg, garlic, chicken, curry, rice, eggplant",
                    price: 55000,
                    screenWidth: screenWidth,
                  ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}

class RestoMenuSection extends StatefulWidget {
  final String image;
  final String name;
  final String desc;
  final int price;
  final double screenWidth;

  const RestoMenuSection({Key key, this.image, this.name, this.desc, this.price, this.screenWidth}) : super(key: key);
  @override
  _RestoMenuSectionState createState() => _RestoMenuSectionState();
}

class _RestoMenuSectionState extends State<RestoMenuSection> {
  final formatter = NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: widget.screenWidth * 0.4,
              height: widget.screenWidth * 0.36,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.image),
                  ),
                  borderRadius:
                      BorderRadius.all(Radius.circular(8.0))),
            ),
            SizedBox(width: 20),
            Container(
              height: widget.screenWidth * 0.36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(widget.name, style: Styles.customStyle("mediumboldblack")),
                      Container(
                        width: widget.screenWidth * 0.4,
                        child: Text(widget.desc, style: Styles.customStyle("smallgray"),),
                      ),
                    ],
                  ),
                  Text("IDR " + formatter.format(widget.price), style: Styles.customStyle("mediumboldblack")),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: widget.screenWidth * 0.05),
        Container(
          width: widget.screenWidth * 0.9,
          height: 2,
          color: Styles.white,
        ),
        SizedBox(height: widget.screenWidth * 0.05),
      ]
    );
  }
}