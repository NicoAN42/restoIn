import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/widgets/custom_check_box.dart';
import 'package:intl/intl.dart';

class FoodDetailScreen extends StatefulWidget {
  @override
  _FoodDetailScreenState createState() => _FoodDetailScreenState();
}

class _FoodDetailScreenState extends State<FoodDetailScreen> {
  bool isFav = false;
  int counter = 1;
  int price = 75000;
  final formatter =
      NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);

  bool isCheck1 = false;
  bool isCheck2 = false;

  FocusNode _focus;
  TextEditingController _controller;

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
                height: screenHeight * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/food/square/chunkyPie.jpg")),
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
              Positioned(
                top: screenWidth * 0.1,
                right: screenWidth * 0.05,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFav = !isFav;
                    });
                  },
                  child: Container(
                    child: isFav
                        ? Image.asset("assets/icon/fav.png",
                            width: 28, height: 28)
                        : new Icon(
                            FontAwesomeIcons.heart,
                            color: Styles.white,
                            size: 28,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Container(
            color: Colors.white,
            width: screenWidth,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              children: <Widget>[
                Text(
                  "Chunky Pie",
                  style: Styles.customStyle("largerboldblack"),
                ),
                SizedBox(height: 5),
                Container(
                  width: screenWidth * 0.5,
                  child: Text(
                    "Chocolate, milk, cream, waffle, honey",
                    style: Styles.customStyle("mediumlightGray"),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 5,
            color: Styles.white,
          ),
          Container(
            padding: EdgeInsets.only(
                top: 20,
                left: screenWidth * 0.05,
                bottom: 0,
                right: screenWidth * 0.05),
            width: screenWidth,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Extra",
                  style: Styles.customStyle("mediumboldblack"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      CustomCheckBox(
                        price: 10000,
                        addPrice: addPrice1,
                        isChecked: isCheck1,
                      ),
                      Text(
                        "Choco Cream",
                        style: Styles.customStyle("mediumblack"),
                      ),
                    ]),
                    Text("+ 10.000", style: Styles.customStyle("mediumgray"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      CustomCheckBox(
                        price: 7500,
                        addPrice: addPrice2,
                        isChecked: isCheck2,
                      ),
                      Text(
                        "Wafflepuff",
                        style: Styles.customStyle("mediumblack"),
                      ),
                    ]),
                    Text("+ 7.500", style: Styles.customStyle("mediumgray"))
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 20,
                left: screenWidth * 0.05,
                bottom: 20,
                right: screenWidth * 0.05),
            width: screenWidth,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Note",
                  style: Styles.customStyle("mediumboldblack"),
                ),
                SizedBox(height: 20),
                TextField(
                  onTap: () => noteDialog(),
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "ex. Don't use so much milk",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Styles.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
            width: screenWidth,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTheme(
                  minWidth: 0,
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    color: counter < 2 ? Colors.white : Styles.orange,
                    onPressed: () {
                      setState(() {
                        if (counter > 1) counter--;
                      });
                    },
                    child: new Icon(
                      FontAwesomeIcons.minus,
                      color: counter < 2 ? Styles.orange : Styles.white,
                      size: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: counter < 2
                          ? BorderSide(color: Colors.white)
                          : BorderSide(color: Styles.orange),
                    ),
                  ),
                ),
                Text(" " + counter.toString() + " ",
                    style: Styles.customStyle("largeboldblack")),
                ButtonTheme(
                  minWidth: 0,
                  child: FlatButton(
                    padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                    color: Styles.orange,
                    onPressed: () {
                      setState(() {
                        counter++;
                      });
                    },
                    child: new Icon(
                      FontAwesomeIcons.plus,
                      color: Styles.white,
                      size: 14,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                      side: BorderSide(color: Styles.orange),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 5,
            color: Styles.white,
          ),
          Container(
              padding: EdgeInsets.only(
                  top: 20,
                  left: screenWidth * 0.05,
                  bottom: 20,
                  right: screenWidth * 0.05),
              color: Colors.white,
              child: ButtonTheme(
                minWidth: screenWidth * 0.9,
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: (FlatButton(
                  child: Text(
                      "Add to Cart - IDR " + formatter.format(price * counter),
                      maxLines: 1,
                      style: Styles.customStyle("mediumboldwhite")),
                  color: Styles.orange,
                  onPressed: () {
                    //TODO : Add to Cart
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                )),
              )),
        ],
      )),
    );
  }

  addPrice1(int p) {
    setState(() {
      isCheck1 = !isCheck1;
      if (isCheck1)
        price += p;
      else
        price -= p;
    });
  }

  addPrice2(int p) {
    setState(() {
      isCheck2 = !isCheck2;
      if (isCheck2)
        price += p;
      else
        price -= p;
    });
  }

  Future<void> noteDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text("Note", style: Styles.customStyle("mediumBoldBlack")),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 40,
                    child: TextField(
                      style: Styles.customStyle("smallBlack"),
                      focusNode: _focus,
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        hintText: "ex: Don't use so much milk",
                        hintStyle: Styles.customStyle("smallGray"),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Styles.gray),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Styles.black),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 400,
                    child: RaisedButton(
                      child: Text("Confirm",
                          style: Styles.customStyle("mediumBoldWhite")),
                      color: Styles.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
