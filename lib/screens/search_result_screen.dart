import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/food.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_list_tile.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _searchController = new TextEditingController();

List<String> searchHistory = [];

List<Restaurant> restoList = [];

class SearchResultScreen extends StatefulWidget {
  final String query;
  final Function addHistory;

  const SearchResultScreen({Key key, this.query, this.addHistory})
      : super(key: key);

  @override
  _SearchResultScreenState createState() => new _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Future _getSearch;
  static bool isSortByDescending = true;
  static bool isSortByName = true;
  static bool isSortByPopularity = false;
  static bool isSortByDistance = false;
  static bool isSortByRating = false;
  static bool isSortByRecommended = false;

  final List<String> _sortScroller = [
    "Sort By",
    "Name",
    "Popularity",
    "Distance",
    "Rating",
    "Recommended",
  ];

  List<bool> _sortScrollerIsPressed = [];
  List<Function> _sortScrollerChanger = [];

  int counter = 0;

  void changeIsSortByDescending() => setState(() {
        isSortByDescending = !isSortByDescending;
        sort();
      });

  void changeIsSortByName() => setState(() {
        turnOffOthers();
        isSortByName = !isSortByName;
        sort();
      });
  void changeIsSortByPopularity() => setState(() {
        turnOffOthers();
        isSortByPopularity = !isSortByPopularity;
        sort();
      });
  void changeIsSortByDistance() => setState(() {
        turnOffOthers();
        isSortByDistance = !isSortByDistance;
        sort();
      });
  void changeIsSortByRating() => setState(() {
        turnOffOthers();
        isSortByRating = !isSortByRating;
        sort();
      });
  void changeIsSortByRecommended() => setState(() {
        turnOffOthers();
        isSortByRecommended = !isSortByRecommended;
        sort();
      });

  void sort() {
    resetList();
    if (isSortByName && isSortByDescending) {
      restoList.sort((a, b) => a.name.compareTo(b.name));
    } else if (isSortByName && !isSortByDescending) {
      restoList.sort((a, b) => b.name.compareTo(a.name));
    } else if (isSortByDistance && isSortByDescending) {
      restoList.sort((a, b) => a.distance.compareTo(b.distance));
    } else if (isSortByDistance && !isSortByDescending) {
      restoList.sort((a, b) => b.distance.compareTo(a.distance));
    } else if (isSortByRating && isSortByDescending) {
      restoList.sort((a, b) => a.rating[0].compareTo(b.rating[0]));
    } else if (isSortByRating && !isSortByDescending) {
      restoList.sort((a, b) => b.rating[0].compareTo(a.rating[0]));
    }
  }

  void turnOffOthers() {
    if (isSortByName == true) isSortByName = false;
    if (isSortByPopularity == true) isSortByPopularity = false;
    if (isSortByDistance == true) isSortByDistance = false;
    if (isSortByRating == true) isSortByRating = false;
    if (isSortByRecommended == true) isSortByRecommended = false;
  }

  void resetList() {
    _sortScrollerIsPressed = [
      isSortByDescending,
      isSortByName,
      isSortByPopularity,
      isSortByDistance,
      isSortByRating,
      isSortByRecommended,
    ];
  }

  void _addHistory(String s) {
    _searchController.clear();
    s.trim();
    if (s.isNotEmpty)
      // setState(() {
      searchHistory.add(s);
    // });
  }

  @override
  void initState() {
    restoList.clear();

    _getSearch = search(widget.query);

    _sortScrollerChanger = [
      changeIsSortByDescending,
      changeIsSortByName,
      changeIsSortByPopularity,
      changeIsSortByDistance,
      changeIsSortByRating,
      changeIsSortByRecommended
    ];

    _sortScrollerIsPressed = [
      isSortByDescending,
      isSortByName,
      isSortByPopularity,
      isSortByDistance,
      isSortByRating,
      isSortByRecommended,
    ];

    _searchController.text = widget.query;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        color: Colors.white,
        width: screenWidth,
        height: screenHeight,
        child: Column(children: <Widget>[
          SizedBox(
            height: screenHeight / 6,
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
                                    change: _sortScrollerChanger[index],
                                    isPressed: _sortScrollerIsPressed[index],
                                  )
                                : CustomSearchSortButton(
                                    text: "${_sortScroller[index]}",
                                    change: _sortScrollerChanger[index],
                                    isPressed: _sortScrollerIsPressed[index],
                                  ),
                          );
                        }),
                  ),
                )
              ],
            ),
          ),
          FutureBuilder<String>(
              future: _getSearch,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (restoList.isEmpty)
                    return Text(
                      "We can't find what you're searching for. Please try to search another dish or restaurant.",
                      style: Styles.customStyle("mediumGray"),
                      textAlign: TextAlign.center,
                    );

                  return Container(
                      height: screenHeight * 5 / 6,
                      child: MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              itemCount: restoList.length,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return CustomRestoTile(
                                  r: restoList[index],
                                  screenWidth: screenWidth,
                                  screenHeight: screenHeight,
                                );
                              })));
                }
                return Text(
                  "Please Wait...",
                  style: Styles.customStyle("mediumGray"),
                  textAlign: TextAlign.center,
                );
              }),
        ]),
      ),
    );
  }

  Future<String> search(String query) async {
    restoList.clear();
    List<DocumentSnapshot> foodList;
    List<DocumentSnapshot> restaurantList;

    foodList =
        (await Firestore.instance.collection('food').getDocuments()).documents;
    restaurantList =
        (await Firestore.instance.collection('restaurant').getDocuments())
            .documents;

//search name food
    for (int i = 0; i < foodList.length; i++) {
      DocumentSnapshot food = foodList[i];

      String s = food["name"].toString();
      s = s.toLowerCase();

      if (s.contains(query.toLowerCase())) {
        DocumentSnapshot resto = await Firestore.instance
            .collection('restaurant')
            .document(food["restoRef"])
            .get();

        String duplicatedName = "";

        for (int i = 0; i < restoList.length; i++) {
          if (restoList[i].name == resto["name"]) {
            duplicatedName = restoList[i].name;
            break;
          }
        }

        if (duplicatedName.isEmpty) {
          restoList.add(new Restaurant(
              image: resto["image"],
              rating: resto["rating"].cast<double>(),
              name: resto["name"],
              open: resto["open"],
              close: resto["close"],
              location: resto["location"],
              type: resto["type"].cast<String>(),
              distance: resto["distance"],
              featuredFoods: [
                new Food(
                  image: food["image"],
                  name: food["name"],
                  price: food["price"],
                  type: food["type"].cast<String>(),
                  rating: food["rating"].cast<double>(),
                )
              ]));
        } else {
          for (int i = 0; i < restoList.length; i++) {
            if (restoList[i].name == duplicatedName) {
              restoList[i].featuredFoods.add(new Food(
                    image: food["image"],
                    name: food["name"],
                    price: food["price"],
                    type: food["type"].cast<String>(),
                    rating: food["rating"].cast<double>(),
                  ));
              break;
            }
          }
        }
      }
    }

//search name resto
    for (int i = 0; i < restaurantList.length; i++) {
      DocumentSnapshot resto = restaurantList[i];
      String s = resto["name"];
      s = s.toLowerCase();

      if (s.contains(query.toLowerCase())) {
        bool isDuplicate = false;
        for (int i = 0; i < restoList.length; i++) {
          if (restoList[i].name == resto["name"]) {
            isDuplicate = true;
            break;
          }
        }
        if (!isDuplicate) {
          restoList.add(new Restaurant(
            image: resto["image"].cast<double>(),
            rating: resto["rating"],
            name: resto["name"],
            open: resto["open"],
            close: resto["close"],
            location: resto["location"],
            type: resto["type"].cast<String>(),
            distance: resto["distance"],
            featuredFoods: [],
          ));
        }
      }
    }

    //sort
    restoList.sort((a, b) => a.name.compareTo(b.name));

    return "Done";
  }
}
