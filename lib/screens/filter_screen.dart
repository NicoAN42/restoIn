import 'package:flutter/material.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/screens/search_result_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:restoin/widgets/custom_button.dart';

class FilterScreen extends StatefulWidget {
  final Function addToCart;
  final Cart lastCart;

  const FilterScreen({Key key, this.addToCart, this.lastCart})
      : super(key: key);

  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  static bool _clearOrderType = false;
  static bool _clearCategories = false;
  static bool _clearCuisine = false;
  static bool _clearDistance = false;

  static bool _showMoreCategories = false;
  static bool _showMoreCuisine = false;

  // Price
  static final RangeThumbSelector customRangeThumbSelector = (
    TextDirection textDirection,
    RangeValues values,
    double tapValue,
    Size thumbSize,
    Size trackSize,
    double dx,
  ) {
    final double start = (tapValue - values.start).abs();
    final double end = (tapValue - values.end).abs();
    return start < end ? Thumb.start : Thumb.end;
  };

  RangeValues values = RangeValues(0, 500000);
  RangeLabels labels = RangeLabels('0', '500000');

  // Distance
  CustomSmallButton onetothreeButton = CustomSmallButton(text: "1-3km");
  CustomSmallButton threetosixButton = CustomSmallButton(text: "3-6km");
  CustomSmallButton sixtotenButton = CustomSmallButton(text: "6-10km");
  CustomSmallButton greatertenButton = CustomSmallButton(text: ">10km");

  List<Widget> createOrderType() {
    List<Widget> list = new List();
    list.add(new CustomSmallButton(text: "Eat In", isClear: _clearOrderType));
    list.add(new CustomSmallButton(text: "Booking", isClear: _clearOrderType));
    list.add(new CustomSmallButton(text: "Pick Up", isClear: _clearOrderType));
    return list;
  }

  List<Widget> createCategories() {
    List<Widget> list = new List();

    list.add(CustomSmallButton(text: "All", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Fast Food", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Sushi", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Dinner", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Soup", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Coffee", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Pasta", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Pizza", isClear: _clearCategories));
    if (!_showMoreCategories) return list;
    list.add(CustomSmallButton(text: "Noodle", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Healthy", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Vegan", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Ice Cream", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Breakfast", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Lunch", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Tea", isClear: _clearCategories));
    list.add(CustomSmallButton(text: "Dessert", isClear: _clearCategories));

    return list;
  }

  List<Widget> createCuisine() {
    List<Widget> list = new List();
    list.add(CustomSmallButton(text: "Arabic", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "American", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Western", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Chinese", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Indonesian", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Japanese", isClear: _clearCuisine));
    if (!_showMoreCuisine) return list;
    list.add(CustomSmallButton(text: "Korean", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Turki", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Taiwanese", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Peruvian", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "India", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "France", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Balinese", isClear: _clearCuisine));
    list.add(CustomSmallButton(text: "Javanese", isClear: _clearCuisine));

    return list;
  }

  List<Widget> createDistance() {
    List<Widget> list = new List();
    list.add(new CustomSmallButton(text: "1-3km", isClear: _clearDistance));
    list.add(new CustomSmallButton(text: "3-6km", isClear: _clearDistance));
    list.add(new CustomSmallButton(text: "6-10km", isClear: _clearDistance));
    list.add(new CustomSmallButton(text: ">10km", isClear: _clearDistance));

    return list;
  }

  void clearOrderType() {
    setState(() {
      _clearOrderType = true;
      _clearCategories = false;
      _clearCuisine = false;
      _clearDistance = false;
    });
  }

  void clearCategories() {
    setState(() {
      _clearOrderType = false;
      _clearCategories = true;
      _clearCuisine = false;
      _clearDistance = false;
    });
  }

  void clearCuisine() {
    setState(() {
      _clearOrderType = false;
      _clearCategories = false;
      _clearCuisine = true;
      _clearDistance = false;
    });
  }

  void clearPrice() {
    setState(() {
      turnAllOff();
      values = RangeValues(0, 500000);
      labels = RangeLabels('0', '500000');
    });
  }

  void clearDistance() {
    setState(() {
      _clearOrderType = false;
      _clearCategories = false;
      _clearCuisine = false;
      _clearDistance = true;
    });
  }

  void reset() {
    setState(() {
      _clearOrderType = true;
      _clearCategories = true;
      _clearCuisine = true;
      values = RangeValues(0, 500000);
      labels = RangeLabels('0', '500000');
      _clearDistance = true;
    });
  }

  void turnAllOff() {
    setState(() {
      _clearOrderType = false;
      _clearCategories = false;
      _clearCuisine = false;
      _clearDistance = false;
    });
  }

  String getPrice(int price) {
    String p = price.toString();
    List<String> res = [];
    for (int i = p.length; i > 0; i -= 3) {
      if (i - 3 >= 0) {
        res.insert(0, "${p.substring(i - 3, i)}");
      } else {
        res.insert(0, "${p.substring(0, i)}");
      }
    }
    String r = res.join(".");

    return r;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Header
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  screenHeight * 0.05, screenWidth * 0.05, 20),
              child: Stack(
                children: <Widget>[
                  Container(width: screenWidth, height: 21),
                  Positioned(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        child: Image.asset("assets/icon/close.png",
                            width: 21, height: 21),
                      ),
                    ),
                  ),
                  Align(
                    child: Text(
                      "Filter",
                      style: Styles.customStyle("largeboldblack"),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () => reset(),
                      child: Container(
                        child: Text(
                          "Reset",
                          style: Styles.customStyle("mediumorange"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Line
            Container(width: screenWidth, height: 10, color: Styles.white),

            // Content
            Container(
              padding: EdgeInsets.all(screenWidth * 0.05),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  // Order Type
                  Container(
                    padding: EdgeInsets.only(bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Order Type",
                          style: Styles.customStyle("mediumboldblack"),
                        ),
                        GestureDetector(
                          onTap: () => clearOrderType(),
                          child: Text(
                            "Clear All",
                            style: Styles.customStyle("mediumorange"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: createOrderType(),
                    ),
                  ),

                  // Categories
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Categories",
                          style: Styles.customStyle("mediumboldblack"),
                        ),
                        GestureDetector(
                          onTap: () => clearCategories(),
                          child: Text(
                            "Clear All",
                            style: Styles.customStyle("mediumorange"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: createCategories(),
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Column(
                  //       children: createCategories(),
                  //     ),
                  //     _showMoreCategories ? categoriesContainer : Container(),
                  //   ],
                  // ),

                  // Categories Show More
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            turnAllOff();
                            setState(() {
                              _showMoreCategories = !_showMoreCategories;
                            });
                          },
                          child: _showMoreCategories
                              ? Text("Hide",
                                  style: Styles.customStyle("mediumgray"))
                              : Text("Show More",
                                  style: Styles.customStyle("mediumgray")),
                        ),
                      ],
                    ),
                  ),

                  // Cuisine
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Cuisine",
                          style: Styles.customStyle("mediumboldblack"),
                        ),
                        GestureDetector(
                          onTap: () => clearCuisine(),
                          child: Text(
                            "Clear All",
                            style: Styles.customStyle("mediumorange"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: createCuisine(),
                    ),
                  ),
                  // Column(
                  //   children: <Widget>[
                  //     Column(
                  //       children: createCuisine(),
                  //     ),
                  //     _showMoreCuisine ? cuisineContainer : Container(),
                  //   ],
                  // ),

                  // Cuisine Show More
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            turnAllOff();
                            setState(() {
                              _showMoreCuisine = !_showMoreCuisine;
                            });
                          },
                          child: _showMoreCuisine
                              ? Text("Hide",
                                  style: Styles.customStyle("mediumgray"))
                              : Text("Show More",
                                  style: Styles.customStyle("mediumgray")),
                        ),
                      ],
                    ),
                  ),

                  // Price
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Price",
                          style: Styles.customStyle("mediumboldblack"),
                        ),
                        GestureDetector(
                          onTap: () => clearPrice(),
                          child: Text(
                            "Clear All",
                            style: Styles.customStyle("mediumorange"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    child: SliderTheme(
                      data: SliderThemeData(
                        thumbSelector: customRangeThumbSelector,
                        activeTrackColor: Styles.lightOrange,
                        activeTickMarkColor: Styles.lightOrange,
                        thumbColor: Styles.darkOrange,
                        inactiveTrackColor: Styles.white,
                        inactiveTickMarkColor: Styles.white,
                        overlayColor: Styles.orange,
                        valueIndicatorColor: Styles.gray,
                      ),
                      child: RangeSlider(
                        min: 0,
                        max: 500000,
                        values: values,
                        divisions: 50,
                        labels: labels,
                        onChanged: (value) {
                          setState(() {
                            if (value.end - value.start >= 50000) {
                              values = value;
                              labels = RangeLabels(
                                  getPrice(value.start.toInt()),
                                  getPrice(value.end.toInt()));
                              // value.start.toInt().toString(),
                              // value.end.toInt().toString());
                            } else {
                              if (value.start == values.start) {
                                values = RangeValues(
                                    values.start, values.start + 50000);
                                labels = RangeLabels(
                                    getPrice(values.start.toInt()),
                                    getPrice((values.start + 50000).toInt())
                                    // values.start.toInt().toString(),
                                    // (values.start + 50000).toInt().toString()
                                    );
                              } else {
                                values =
                                    RangeValues(values.end - 50000, values.end);
                                labels = RangeLabels(
                                    getPrice((values.end - 50000).toInt()),
                                    getPrice(values.end.toInt())

                                    // (values.end - 50000).toInt().toString(),
                                    // values.end.toInt().toString()
                                    );
                              }
                            }
                          });
                        },
                      ),
                    ),
                  ),

                  // Price
                  Container(
                    padding: EdgeInsets.only(
                        left: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "IDR",
                          style: Styles.customStyle("midgray"),
                        ),
                      ],
                    ),
                  ),

                  // Distance
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Distance from your location",
                          style: Styles.customStyle("mediumboldblack"),
                        ),
                        GestureDetector(
                          onTap: () => clearDistance(),
                          child: Text(
                            "Clear All",
                            style: Styles.customStyle("mediumorange"),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      spacing: 5,
                      direction: Axis.horizontal,
                      children: createDistance(),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(left: 80, right: 80),
                    onPressed: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SearchResultScreen(
                                    query: "",
                                    addToCart: widget.addToCart,
                                    lastCart: widget.lastCart)));
                      });
                    },
                    child: Text(
                      "Apply",
                      style: Styles.customStyle("mediumwhite"),
                    ),
                    color: Styles.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
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
