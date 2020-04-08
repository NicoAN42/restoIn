import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:restoin/widgets/custom_button.dart';

class FilterScreen extends StatefulWidget {
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  static bool _clearOrderType = false;
  static bool _clearCategories = false;
  static bool _clearCuisine = false;
  static bool _clearPrice = false;
  static bool _clearDistance = false;

  List<CustomSmallButton> orderType;
  //tambahin list lainnya

  // Categories
  CustomSmallButton allButton = CustomSmallButton(text: "All");
  CustomSmallButton fastfoodButton = CustomSmallButton(text: "Fast Food");
  CustomSmallButton sushiButton = CustomSmallButton(text: "Sushi");
  CustomSmallButton dinnerButton = CustomSmallButton(text: "Dinner");

  CustomSmallButton soupButton = CustomSmallButton(text: "Soup");
  CustomSmallButton coffeeButton = CustomSmallButton(text: "Coffee");
  CustomSmallButton pastaButton = CustomSmallButton(text: "Pasta");
  CustomSmallButton pizzaButton = CustomSmallButton(text: "Pizza");

  CustomSmallButton noodleButton = CustomSmallButton(text: "Noodle");
  CustomSmallButton healthyButton = CustomSmallButton(text: "Healthy");
  CustomSmallButton veganButton = CustomSmallButton(text: "Vegan");
  CustomSmallButton icecreamButton = CustomSmallButton(text: "Ice Cream");

  CustomSmallButton breakfastButton = CustomSmallButton(text: "Breakfast");
  CustomSmallButton lunchButton = CustomSmallButton(text: "Lunch");
  CustomSmallButton teaButton = CustomSmallButton(text: "Tea");
  CustomSmallButton dessertButton = CustomSmallButton(text: "Dessert");

  // Cuisine
  CustomSmallButton arabicButton = CustomSmallButton(text: "Arabic");
  CustomSmallButton americanButton = CustomSmallButton(text: "American");
  CustomSmallButton westernButton = CustomSmallButton(text: "Western");
  CustomSmallButton chineseButton = CustomSmallButton(text: "Chinese");

  CustomSmallButton indonesianButton = CustomSmallButton(text: "Indonesian");
  CustomSmallButton japaneseButton = CustomSmallButton(text: "Japanese");
  CustomSmallButton koreanButton = CustomSmallButton(text: "Korean");

  CustomSmallButton turkiButton = CustomSmallButton(text: "Turki");
  CustomSmallButton taiwaneseButton = CustomSmallButton(text: "Taiwanese");
  CustomSmallButton peruvianButton = CustomSmallButton(text: "Peruvian");
  CustomSmallButton indiaButton = CustomSmallButton(text: "India");

  CustomSmallButton franceButton = CustomSmallButton(text: "France");
  CustomSmallButton balineseButton = CustomSmallButton(text: "Balinese");
  CustomSmallButton javaneseButton = CustomSmallButton(text: "Javanese");

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
    list.add(new CustomSmallButton(
      text: "Eat In",
      isClear: _clearOrderType,
    ));
    list.add(new CustomSmallButton(
      text: "Booking",
      isClear: _clearOrderType,
    ));
    list.add(new CustomSmallButton(
      text: "Pick Up",
      isClear: _clearOrderType,
    ));
    return list;
  }

  List<Widget> createDistance() {
    List<Widget> list = new List();
    list.add(new CustomSmallButton(
      text: "1-3km",
      isClear: _clearDistance,
    ));
    list.add(new CustomSmallButton(
      text: "3-6km",
      isClear: _clearDistance,
    ));
    list.add(new CustomSmallButton(
      text: "6-10km",
      isClear: _clearDistance,
    ));
    list.add(new CustomSmallButton(
      text: ">10km",
      isClear: _clearDistance,
    ));

    return list;
  }

  void clearOrderType() {
    setState(() {
      //Sisanya false
      _clearDistance = false;

      //cuman dia yang true
      _clearOrderType = true;
    });
  }

  void clearCategories() {
    // TODO: Clear categories
  }

  void clearCuisine() {
    // TODO: Clear cuisine
  }

  void clearPrice() {
    // TODO: Clear price
  }

  void clearDistance() {
    setState(() {
      _clearOrderType = false;
      _clearDistance = true;
    });
  }

  void reset() {
    clearOrderType();
    clearCategories();
    clearCuisine();
    clearPrice();
    clearDistance();
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
                  screenHeight * 0.1, screenWidth * 0.05, 20),
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
                      onTap: () => clearOrderType(),
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
            Container(
              width: screenWidth,
              height: 10,
              color: Color(0xFFF7F7F7),
            ),

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

                  Row(
                    children: createOrderType(),
                    // <Widget>[

                    //   eatInButton,
                    //   SizedBox(width: 5),
                    //   bookingButton,
                    //   SizedBox(width: 5),
                    //   pickUpButton
                    // ],
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

                  Row(
                    children: <Widget>[
                      allButton,
                      SizedBox(width: 5),
                      fastfoodButton,
                      SizedBox(width: 5),
                      sushiButton,
                      SizedBox(width: 5),
                      dinnerButton,
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      soupButton,
                      SizedBox(width: 5),
                      coffeeButton,
                      SizedBox(width: 5),
                      pastaButton,
                      SizedBox(width: 5),
                      pizzaButton,
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      noodleButton,
                      SizedBox(width: 5),
                      healthyButton,
                      SizedBox(width: 5),
                      veganButton,
                      SizedBox(width: 5),
                      icecreamButton
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      breakfastButton,
                      SizedBox(width: 5),
                      lunchButton,
                      SizedBox(width: 5),
                      teaButton,
                      SizedBox(width: 5),
                      dessertButton,
                    ],
                  ),

                  // Categories Show More
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          // TODO: Ontap Here (Hide / Show More)
                          child: Text(
                            "Show More",
                            style: Styles.customStyle("mediumgray"),
                          ),
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

                  Row(
                    children: <Widget>[
                      arabicButton,
                      SizedBox(width: 5),
                      americanButton,
                      SizedBox(width: 5),
                      westernButton,
                      SizedBox(width: 5),
                      chineseButton,
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      indonesianButton,
                      SizedBox(width: 5),
                      japaneseButton,
                      SizedBox(width: 5),
                      koreanButton,
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      turkiButton,
                      SizedBox(width: 5),
                      taiwaneseButton,
                      SizedBox(width: 5),
                      peruvianButton,
                      SizedBox(width: 5),
                      indiaButton
                    ],
                  ),

                  Row(
                    children: <Widget>[
                      franceButton,
                      SizedBox(width: 5),
                      balineseButton,
                      SizedBox(width: 5),
                      javaneseButton,
                    ],
                  ),

                  Row(
                    children: <Widget>[],
                  ),

                  // Cuisine Show More
                  Container(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.05, bottom: screenWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        GestureDetector(
                          // TODO: Ontap Here (Hide / Show More)
                          child: Text(
                            "Show More",
                            style: Styles.customStyle("mediumgray"),
                          ),
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
                                  value.start.toInt().toString(),
                                  value.end.toInt().toString());
                            } else {
                              if (value.start == values.start) {
                                values = RangeValues(
                                    values.start, values.start + 50000);
                                labels = RangeLabels(
                                    values.start.toInt().toString(),
                                    (values.start + 50000).toInt().toString());
                              } else {
                                values =
                                    RangeValues(values.end - 50000, values.end);
                                labels = RangeLabels(
                                    (values.end - 50000).toInt().toString(),
                                    values.end.toInt().toString());
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

                  Row(
                    children: createDistance(),
                    // <Widget>[
                    //   onetothreeButton,
                    //   SizedBox(width: 5),
                    //   threetosixButton,
                    //   SizedBox(width: 5),
                    //   sixtotenButton,
                    //   SizedBox(width: 5),
                    //   greatertenButton
                    // ],
                  ),
                ],
              ),
            ),

            ButtonTheme(
              minWidth: screenWidth * 0.6,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    //TODO : Transition
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
            )
          ],
        ),
      ),
    );
  }
}
