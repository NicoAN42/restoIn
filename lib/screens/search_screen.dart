import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _searchController = new TextEditingController();

List<String> searchHistory = [];

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    searchHistory.clear();
    searchHistory.insert(0, "Ice Cream Sandwich");
    searchHistory.insert(0, "Dalgona Coffee");
    searchHistory.insert(0, "Beef BBQ");
    searchHistory.insert(0, "Vanilla Cake");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    void _deleteHistory(String s) {
      setState(() {
        searchHistory.remove(s);
      });
    }

    void _clearAllHistory() {
      setState(() {
        searchHistory.clear();
      });
    }

    void _addHistory(String s) {
      _searchController.clear();
      s.trim();
      if (s.isNotEmpty)
        // setState(() {
        searchHistory.insert(0, s);
      // });
    }

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
                              child: CustomSearchField(
                                controller: _searchController,
                                addHistory: _addHistory,
                              )),
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
                          GestureDetector(
                            child: Text("Clear All",
                                style: Styles.customStyle("mediumOrange")),
                            onTap: () => _clearAllHistory(),
                          ),
                        ]),
                  ),
                  ListView.builder(
                    padding: EdgeInsets.only(
                        top: 0,
                        left: screenWidth * 0.03,
                        right: screenWidth * 0.03),
                    itemCount:
                        searchHistory.length > 10 ? 10 : searchHistory.length,
                    shrinkWrap: true,
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
                              GestureDetector(
                                child: new Icon(
                                  FontAwesomeIcons.times,
                                  size: 16,
                                  color: Styles.gray,
                                ),
                                onTap: () =>
                                    _deleteHistory("${searchHistory[index]}"),
                              ),
                            ]),
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
