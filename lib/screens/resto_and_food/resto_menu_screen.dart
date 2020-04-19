import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/models/food.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/screens/resto_and_food/food_detail_screen.dart';
import 'package:restoin/screens/resto_and_food/resto_info_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../order_main_screen.dart';

class RestoMenuScreen extends StatefulWidget {
  final Restaurant r;
  final Function addToCart;
  final Cart lastCart;
  final Function addActivity;

  const RestoMenuScreen(
      {Key key, this.r, this.addToCart, this.lastCart, this.addActivity})
      : super(key: key);

  @override
  _RestoMenuScreenState createState() => _RestoMenuScreenState();
}

class _RestoMenuScreenState extends State<RestoMenuScreen> {
  int menu;
  Future _getMenu;
  Cart _curCart = new Cart();
  List<bool> pressedList = [true, false, false, false, false];

  List<FlatButton> createCategory() {
    List<FlatButton> list = new List();
    TextStyle bold = Styles.customStyle("mediumBoldBlack");
    TextStyle normal = Styles.customStyle("mediumBlack");

    list.add(new FlatButton(
        onPressed: () => setState(() {
              pressedList = [false, false, false, false, false];
              pressedList[0] = !pressedList[0];
            }),
        child: Text("Recommended", style: pressedList[0] ? bold : normal)));
    list.add(new FlatButton(
        onPressed: () => setState(() {
              pressedList = [false, false, false, false, false];
              pressedList[1] = !pressedList[1];
            }),
        child: Text("Main", style: pressedList[1] ? bold : normal)));
    list.add(new FlatButton(
        onPressed: () => setState(() {
              pressedList = [false, false, false, false, false];
              pressedList[2] = !pressedList[2];
            }),
        child: Text("Dessert", style: pressedList[2] ? bold : normal)));
    list.add(new FlatButton(
        onPressed: () => setState(() {
              pressedList = [false, false, false, false, false];
              pressedList[3] = !pressedList[3];
            }),
        child: Text("Lunch", style: pressedList[3] ? bold : normal)));
    list.add(new FlatButton(
        onPressed: () => setState(() {
              pressedList = [false, false, false, false, false];
              pressedList[4] = !pressedList[4];
            }),
        child: Text("Breakfast", style: pressedList[4] ? bold : normal)));
    return list;
  }

  Future<String> getMenu() async {
    List<DocumentSnapshot> foodList;

    foodList =
        (await Firestore.instance.collection('food').getDocuments()).documents;
    if (widget.r.featuredFoods != null) widget.r.featuredFoods.clear();

    for (int i = 0; i < foodList.length; i++) {
      DocumentSnapshot food = foodList[i];
      if (widget.r.menu.contains(food.documentID)) {
        widget.r.featuredFoods.add(new Food(
            image: food["image"],
            name: food["name"],
            price: food["price"],
            type: food["type"].cast<String>(),
            rating: food["rating"].cast<double>(),
            desc: food["desc"]));
      }
    }
    return "done";
  }

  _addToCurCart(Food f, int qty, String note, List<Extra> e) {
    print(qty);
    setState(() {
      if (_curCart.foods.contains(f)) {
        int idx = _curCart.foods.indexOf(f);
        if (e != null) _curCart.extras = e;
        _curCart.qtys[idx] = qty;
        _curCart.notes[idx] = note;
      } else {
        _curCart.foods.add(f);
        if (e != null) _curCart.extras = e;
        _curCart.qtys.add(qty);
        _curCart.notes.add(note);
      }
    });
    widget.addToCart(_curCart);
  }

  @override
  void initState() {
    _getMenu = getMenu();
    _curCart.resto = widget.r;
    _curCart.foods = [];
    _curCart.extras = [];
    _curCart.qtys = [];
    _curCart.notes = [];

    if (widget.lastCart != null && widget.lastCart.resto == _curCart.resto)
      _curCart = widget.lastCart;

    super.initState();
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
                    image: widget.r.getImage(),
                  ),
                ),
                Positioned(
                    top: screenWidth * 0.1,
                    left: screenWidth * 0.05,
                    width: screenWidth * 0.9,
                    child: Row(
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
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RestoInfoScreen(
                                        r: widget.r,
                                      ))),
                          child: Container(
                            child: new Icon(
                              FontAwesomeIcons.bars,
                              color: Styles.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(screenWidth * 0.05),
              width: screenWidth,
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.r.name}",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${widget.r.distance} ",
                        style: Styles.customStyle("largeboldblack"),
                      ),
                      Text(
                        " KM",
                        style: Styles.customStyle("midblack"),
                      ),
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
              padding: EdgeInsets.only(
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05,
                  bottom: screenWidth * 0.05),
              color: Colors.white,
              width: screenWidth,
              child: FutureBuilder<String>(
                  future: _getMenu,
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return MediaQuery.removePadding(
                          context: context,
                          removeTop: true,
                          child: ListView.builder(
                              itemCount: widget.r.featuredFoods.length,
                              shrinkWrap: true,
                              physics: ClampingScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FoodDetailScreen(
                                                  f: widget
                                                      .r.featuredFoods[index],
                                                  addToCurCart: _addToCurCart,
                                                )));
                                  },
                                  child: RestoMenuSection(
                                    image: widget.r.featuredFoods[index].image,
                                    name: widget.r.featuredFoods[index].name,
                                    price: widget.r.featuredFoods[index].price,
                                    desc: widget.r.featuredFoods[index].desc,
                                    screenWidth: screenWidth,
                                  ),
                                );
                              }));
                    }
                    return Text(
                      "Please Wait...",
                      style: Styles.customStyle("mediumGray"),
                      textAlign: TextAlign.center,
                    );
                  }),

              // Column(
              //   children: <Widget>[
              //     RestoMenuSection(
              //       image: "assets/food/square/chunkyPie.jpg",
              //       name: "Chunky Pie",
              //       desc: "Chocolate, milk, cream, waffle, honey",
              //       price: 75000,
              //       screenWidth: screenWidth,
              //     ),
              //     RestoMenuSection(
              //       image: "assets/food/square/fBreadTofu.jpg",
              //       name: "F' Bread Tofu",
              //       desc: "Tofu, garlic, chicken, egg, mayo",
              //       price: 35000,
              //       screenWidth: screenWidth,
              //     ),
              //     RestoMenuSection(
              //       image: "assets/food/square/eggplant-curry-202.jpg",
              //       name: "Egg Plant Curry",
              //       desc: "Egg, garlic, chicken, curry, rice, eggplant",
              //       price: 55000,
              //       screenWidth: screenWidth,
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
      floatingActionButton: _curCart.foods.isNotEmpty
          ? FloatingActionButton.extended(
              label: Text(
                "View Cart - IDR ${_curCart.getPrice()}",
                style: Styles.customStyle("mediumWhite"),
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderMainScreen(
                              c: _curCart,
                              addToCart: widget.addToCart,
                              addActivity: widget.addActivity,
                            )));
              },
              backgroundColor: Styles.orange,
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class RestoMenuSection extends StatefulWidget {
  final String image;
  final String name;
  final int price;
  final String desc;
  final double screenWidth;

  const RestoMenuSection(
      {Key key, this.image, this.name, this.price, this.screenWidth, this.desc})
      : super(key: key);
  @override
  _RestoMenuSectionState createState() => _RestoMenuSectionState();
}

class _RestoMenuSectionState extends State<RestoMenuSection> {
  final formatter =
      NumberFormat.currency(locale: "id", symbol: "", decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
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
                borderRadius: BorderRadius.all(Radius.circular(8.0))),
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
                    Container(
                      constraints: new BoxConstraints(
                          maxWidth: widget.screenWidth - 220),
                      child: Text(
                        widget.name,
                        style: Styles.customStyle("mediumboldblack"),
                      ),
                    ),
                    Container(
                      width: widget.screenWidth * 0.4,
                      child: Text(
                        widget.desc,
                        style: Styles.customStyle("smallgray"),
                      ),
                    ),
                  ],
                ),
                Text("IDR " + formatter.format(widget.price),
                    style: Styles.customStyle("mediumboldblack")),
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
    ]);
  }
}
