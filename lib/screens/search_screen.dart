import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _searchController = new TextEditingController();

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    List<String> searchHistory = [
      "Ice Cream Sandwich",
      "Dalgona Coffee",
      "Beef BBQ",
      "Vanilla Cake"
    ];
    List<String> searchTimestamp = [
      "13/04/20",
      "Yesterday",
      "Today",
      "10 min ago"
    ];

    return new Scaffold(
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Container(
            color: Colors.white,
            width: screenWidth,
            height: screenHeight,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.05),
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
                              //TODO: get text from search and add to history
                              child: CustomSearchField(
                                  controller: _searchController)),
                        ],
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: screenHeight * 0.02,
                        horizontal: screenWidth * 0.03),
                    child: Text("Popular Search",
                        style: Styles.customStyle("largeBoldBlack")),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                    child: Wrap(
                      spacing: 10,
                      children: <Widget>[
                        CustomButton(text: "Bowl"),
                        CustomButton(text: "Sea Food"),
                        CustomButton(text: "Pancake"),
                        CustomButton(text: "Cafe"),
                        CustomButton(text: "Vegetarian"),
                        CustomButton(text: "Soup"),
                        CustomButton(text: "Open Now"),
                        CustomButton(text: "Tea"),
                        CustomButton(text: "Sushi"),
                        CustomButton(text: "Bubble Drink"),
                        CustomButton(text: "Pizza"),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: screenHeight * 0.02,
                      left: screenWidth * 0.03,
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text("Latest Search",
                              style: Styles.customStyle("largeBoldBlack")),
                          FlatButton(
                            child: Text("Clear All",
                                style: Styles.customStyle("mediumOrange")),
                            //TODO: button clear all
                            onPressed: () {},
                          ),
                        ]),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(
                        top: 0,
                        left: screenWidth * 0.03,
                        right: screenWidth * 0.03),
                    itemCount: searchHistory.length,
                    shrinkWrap: true,
                    reverse: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(width: 1, color: Styles.gray))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CustomHistoryButton(
                              text: "${searchHistory[index]}",
                            ),
                            Text("${searchTimestamp[index]}",
                                style: Styles.customStyle("smallGray")),
                          ],
                        ),
                      );
                    },
                  )
                ],
              ),
            )),
      ),
    );
  }
}
