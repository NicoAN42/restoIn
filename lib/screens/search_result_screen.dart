import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/food.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _searchController = new TextEditingController();

List<String> searchHistory = [];

List<Restaurant> restoList = [];

class SearchResultScreen extends StatefulWidget {
  @override
  _SearchResultScreenState createState() => new _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> _sortScroller = [
    "Sort By",
    "Popularity",
    "Distance",
    "Rating",
    "Name",
    "Recommended"
  ];

  @override
  void initState() {
    restoList.clear();
    restoList.add(new Restaurant(
        image: "assets/restaurant/louiseBranz.jpg",
        name: "Louise Branz",
        open: "7am",
        close: "11pm",
        location: "No. 17 Large River, Tangerang",
        type: ["Western", "Indonesian"],
        distance: 40,
        featuredFoods: [
          new Food(
              image: "assets/food/square/chunkyPie.jpg",
              name: "Chunky Pie",
              price: 75000,
              type: ["Western"],
              rating: 5.0),
          new Food(
              image: "assets/food/square/fBreadTofu.jpg",
              name: "F' Bread Tofu",
              price: 35000,
              type: ["Western", "Indonesian"],
              rating: 5.0),
        ]));
    restoList.add(new Restaurant(
        image: "assets/restaurant/geraldVenue.jpg",
        name: "Gerald Venue",
        open: "10am",
        close: "10pm",
        location: "Plaza Terra, Fl. 5, Bandung",
        type: ["Western", "Soup"],
        distance: 145,
        featuredFoods: [
          new Food(
              image: "assets/food/square/fruteLaMina.jpg",
              name: "Frute La Mina",
              price: 195000,
              type: ["Western", "Breakfast"],
              rating: 4.9),
        ]));
    restoList.add(new Restaurant(
        image: "assets/restaurant/queenRe.png",
        name: "Queen Re",
        open: "7am",
        close: "11pm",
        location: "No. 11 Long River, Banten",
        type: ["Western", "Indonesian"],
        distance: 10,
        featuredFoods: [
          new Food(
              image: "assets/food/square/mackCorne.jpg",
              name: "Mack Corne",
              price: 75000,
              type: ["Western", "Indonesian"],
              rating: 5.0),
        ]));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _addHistory(String s) {
      _searchController.clear();
      s.trim();
      if (s.isNotEmpty)
        // setState(() {
        searchHistory.add(s);
      // });
    }

    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        color: Colors.white,
        width: screenWidth,
        height: screenHeight,
        child: Column(children: <Widget>[
          Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.05),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                              child: new Icon(
                                FontAwesomeIcons.angleLeft,
                                color: Styles.black,
                                size: 28,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: screenWidth * 0.9 - 28,
                              height: 37,
                              child: CustomSearchField(
                                controller: _searchController,
                                addHistory: _addHistory,
                              )),
                        ],
                      ),
                    )),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: screenHeight * 0.02, bottom: screenHeight * 0.01),
                    child: ListView.builder(
                        itemCount: _sortScroller.length,
                        scrollDirection: Axis.horizontal,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.01),
                            child: index == 0
                                ? CustomSearchSortButton(
                                    text: "${_sortScroller[index]}",
                                    isSortBy: true,
                                  )
                                : CustomSearchSortButton(
                                    text: "${_sortScroller[index]}",
                                  ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          Expanded(flex: 5, child: ListView.builder(itemBuilder: null)),
        ]),
      ),
    );
  }
}
