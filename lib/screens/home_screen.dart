import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _value = "Sentul";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    bool foodButton = false;
    bool restaurantButton = false;
    bool nearbyButton = false;
    bool opennowButton = false;
    bool rateButton = false;
    bool discountButton = false;

    DropdownButton _myLocation() => DropdownButton<String>(
          style: Styles.customStyle("mediumboldblack"),
          underline: SizedBox(),
          items: [
            DropdownMenuItem<String>(
              value: "Sentul",
              child: Text("Sentul"),
            ),
            DropdownMenuItem<String>(
              value: "Jakarta",
              child: Text("Jakarta"),
            ),
          ],
          onChanged: (value) {
            setState(() {
              _value = value;
            });
          },
          value: _value,
        );

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.1, screenWidth * 0.05, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Text(
                          "My Location",
                          style: Styles.customStyle("mediumblack"),
                        ),
                      ),
                      _myLocation(),
                    ],
                  ),
                  Image.asset('assets/icon/fav.png', width: 20, height: 20)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 0, screenWidth * 0.05, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.8,
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Search food or restaurant",
                          filled: true,
                          contentPadding: EdgeInsets.all(4),
                          fillColor: Styles.lightGray,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                                width: 0, 
                                style: BorderStyle.none,
                              ),
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(10),
                            child: Image.asset('assets/icon/g_search.png',
                                width: 14, height: 14, fit: BoxFit.fill),
                          )),
                    ),
                  ),
                  Image.asset('assets/icon/g_filter.png', width: 24, height: 24)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 0, 0, 20),
              child: SizedBox(
                height: 40,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FlatButton(
                          child: Text("Food",
                              style: foodButton ? Styles.customStyle("mediumgray") : Styles.customStyle("mediumwhite")),
                          onPressed: () {
                            setState(() {
                              foodButton = !foodButton;
                            });
                          },
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FlatButton(
                          child: Text("Restaurant",
                              style: Styles.customStyle("mediumWhite")),
                          onPressed: () => null,
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FlatButton(
                          child: Text("Near By",
                              style: Styles.customStyle("mediumWhite")),
                          onPressed: () => null,
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FlatButton(
                          child: Text("Open Now",
                              style: Styles.customStyle("mediumWhite")),
                          onPressed: () => null,
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: FlatButton(
                          child: Text("Rate: 4.0+",
                              style: Styles.customStyle("mediumWhite")),
                          onPressed: () => null,
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.05),
                        child: FlatButton(
                          child: Text("Discount",
                              style: Styles.customStyle("mediumWhite")),
                          onPressed: () => null,
                          color: Styles.orange,
                          highlightColor: Styles.darkOrange,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            Container(
              height: 10,
              color: Styles.lightGray,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(
                  screenWidth * 0.05, 20, screenWidth * 0.05, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Big Deals",
                  style: Styles.customStyle("largeboldblack"),),
                  Text("Show All",
                  style: Styles.customStyle("mediumorange"),),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: screenWidth,
                        height: screenWidth * 0.50,
                      ),
                      Positioned(
                        left: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.425,
                          height: screenWidth * 0.50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/food/square/roasted-cherry-double-chocolate-buckwheat-ice-cream-sandwiches-gluten-free-10.jpg")
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.05,
                        left: screenWidth * 0.05 - 6,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Image.asset("assets/icon/rating_page.png")
                        ),
                      ),
                      Positioned(
                        right: screenWidth * 0.05,
                        child: Container(
                          width: screenWidth * 0.425,
                          height: screenWidth * 0.50,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/food/square/miso-rice-noodle-ramen-vegetarian-lede-62.jpg")
                              ),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.05,
                        right: screenWidth * 0.45 - 54,
                        child: Container(
                          width: 60,
                          height: 28,
                          child: Image.asset("assets/icon/rating_page.png")
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.05 + 3,
                        left: screenWidth * 0.05 + 3,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text("5.0 ", style: Styles.customStyle("mediumwhite"),),
                              Image.asset("assets/icon/w_star.png", width: 16, height: 16)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.05 + 3,
                        right: screenWidth * 0.45 - 47,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Text("4.9 ", style: Styles.customStyle("mediumwhite"),),
                              Image.asset("assets/icon/w_star.png", width: 16, height: 16)
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.02,
                        left: screenWidth * 0.3 + 2,
                        child: Container(
                          width: 50,
                          height: 52,
                          child: Image.asset("assets/icon/disc_circle.png")
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.02,
                        right: screenWidth * 0.04 + 10,
                        child: Container(
                          width: 50,
                          height: 52,
                          child: Image.asset("assets/icon/disc_circle.png")
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.05,
                        left: screenWidth * 0.3 + 10,
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text("30%", style: Styles.customStyle("mediumboldorange")),
                              Text("Off", style: Styles.customStyle("smallorange"))
                            ],
                          )
                        ),
                      ),
                      Positioned(
                        top: screenWidth * 0.04,
                        right: screenWidth * 0.04 + 14,
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  Text("Buy", style: Styles.customStyle("smallorange")),
                                  Text("Get", style: Styles.customStyle("smallorange")),
                                ],
                              ),
                              Text("1", style: Styles.customStyle("largerboldorange"))
                            ],
                          )
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 0, screenWidth * 0.05, 20),
              child: Row(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.425,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Chunky Pie", style: Styles.customStyle("mediumblack")),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("IDR 75.000", style: Styles.customStyle("smallblack")),
                                Text(" • Western", style: Styles.customStyle("smallGray"))
                              ],
                            )
                          ],
                        ), 
                        Container(
                          width: 2,
                          height: 30,
                          color: Styles.gray,
                        ),
                        Column(
                          children: <Widget>[
                            Text("40", style: Styles.customStyle("mediumboldblack")),
                            Text("MINS", style: Styles.customStyle("smallblack")),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    width: screenWidth * 0.475,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Chunky Pie", style: Styles.customStyle("mediumblack")),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("IDR 75.000", style: Styles.customStyle("smallblack")),
                                Text(" Japanese", style: Styles.customStyle("smallGray"))
                              ],
                            )
                          ],
                        ),
                        Container(
                          width: 2,
                          height: 30,
                          color: Styles.gray,
                        ),
                        Column(
                          children: <Widget>[
                            Text("30", style: Styles.customStyle("mediumboldblack")),
                            Text("MINS", style: Styles.customStyle("smallblack")),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
