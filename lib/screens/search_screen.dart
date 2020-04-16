import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/styles.dart';
import 'package:restoin/widgets/custom_button.dart';
import 'package:restoin/widgets/custom_text_field.dart';

TextEditingController _searchController = new TextEditingController();

List<String> searchHistory = [];

class SearchScreen extends StatefulWidget {
  final Function addToCart;
  final Cart lastCart;
  final Function addSearchHistory;
  final Function deleteSearchHistory;
  final Function clearSearchHistory;
  final Function getSearchHistory;

  const SearchScreen(
      {Key key,
      this.addToCart,
      this.lastCart,
      this.addSearchHistory,
      this.deleteSearchHistory,
      this.clearSearchHistory,
      this.getSearchHistory})
      : super(key: key);

  @override
  _SearchScreenState createState() => new _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // searchHistory.clear();
    // searchHistory.insert(0, "Ice Cream Sandwich");
    // searchHistory.insert(0, "Dalgona Coffee");
    // searchHistory.insert(0, "Beef BBQ");
    // searchHistory.insert(0, "Vanilla Cake");
    super.initState();
  }

  void _deleteHistory(String s) {
    setState(() {
      widget.deleteSearchHistory(s);
    });
  }

  void _clearAllHistory() {
    setState(() {
      widget.clearSearchHistory();
    });
  }

  @override
  void didUpdateWidget(SearchScreen oldWidget) {
    setState(() => searchHistory = widget.getSearchHistory());

    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

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
                                addSearchHistory: widget.addSearchHistory,
                                addToCart: widget.addToCart,
                                lastCart: widget.lastCart,
                                isPop: false,
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
                        CustomButton(
                            text: "Bowl", addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Sea Food",
                            addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Pancake",
                            addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Cafe", addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Vegetarian",
                            addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Soup", addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Open Now",
                            addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Tea", addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Sushi", addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Bubble Drink",
                            addHistory: widget.addSearchHistory),
                        CustomButton(
                            text: "Pizza", addHistory: widget.addSearchHistory),
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
                                addHistory: widget.addSearchHistory,
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
