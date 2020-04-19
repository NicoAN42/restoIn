import 'package:flutter/material.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/models/food.dart';

import 'package:restoin/models/restaurant.dart';
import 'package:restoin/screens/change_order_type_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'order_status_screen.dart';

class OrderReceiptScreen extends StatefulWidget {
  final Cart c;
  final OrderTypeResult otr;
  final String status;

  const OrderReceiptScreen({Key key, this.c, this.otr, this.status})
      : super(key: key);

  @override
  _OrderReceiptScreenState createState() => _OrderReceiptScreenState();
}

class _OrderReceiptScreenState extends State<OrderReceiptScreen> {
  Cart _bufferCart;

  @override
  void initState() {
    _bufferCart = widget.c;
    if (widget.c == null) {
      _bufferCart = new Cart(
          foods: [],
          extras: [],
          qtys: [],
          notes: [],
          resto: new Restaurant(
            name: "Louise Branz",
          ));
      _bufferCart.foods.add(new Food(name: "Chunky Pie", price: 75000));
      _bufferCart.qtys.add(1);
      _bufferCart.notes.add("Don't use too much milk");
      _bufferCart.extras.add(new Extra(name: "Wafflepuff", price: 7500));
    }
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
          Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                screenHeight * 0.05, screenWidth * 0.05, 20),
            child: Stack(
              children: <Widget>[
                Container(width: screenWidth, height: 20),
                Positioned(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: new Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Styles.black,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                Align(
                  child: Text(
                    "Order Receipt",
                    style: Styles.customStyle("largeboldblack"),
                  ),
                )
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 10,
            color: Styles.white,
          ),
          OrderReceiptSection(
            date: "21/06/2020 12:10",
            orderId: "LB-018271",
            restaurantName: _bufferCart.resto.name,
            orderType: widget.otr?.orderType ?? "Take Away",
            paymentType: "Cash",
            screenWidth: screenWidth,
            cart: _bufferCart,
          )
        ],
      )),
      floatingActionButton: Container(
          width: screenWidth * 0.9,
          child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderStatusScreen(
                              c: _bufferCart,
                              status: widget.status,
                            )));
              },
              backgroundColor: Styles.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              label: Text(
                "Order Status",
                style: Styles.customStyle("mediumboldwhite"),
              ))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
      ),
    );
  }
}

class OrderReceiptSection extends StatelessWidget {
  final String orderId;
  final String date;
  final String restaurantName;
  final String orderType;
  final String paymentType;
  final double screenWidth;
  final Cart cart;

  OrderReceiptSection(
      {this.orderId,
      this.date,
      this.restaurantName,
      this.orderType,
      this.paymentType,
      this.screenWidth,
      this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: screenWidth,
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
                    Widget>[
                  Text("Order Id", style: Styles.customStyle("mediumblack")),
                  SizedBox(height: 5),
                  Text(orderId, style: Styles.customStyle("mediumboldblack")),
                ]),
                Text(date, style: Styles.customStyle("midblack")),
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Restaurant",
                          style: Styles.customStyle("mediumblack")),
                      SizedBox(height: 5),
                      Text(restaurantName,
                          style: Styles.customStyle("largeboldorange")),
                    ]),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 20),
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: screenWidth,
            child: Text(
              "Order list",
              style: Styles.customStyle("mediumblack"),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                  itemCount: cart.foods.length,
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return orderListTile(i, context);
                  }),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                  child: Image.asset("assets/icon/food.png",
                      width: 15, height: 15),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                ),
                SizedBox(width: 10),
                Text(orderType, style: Styles.customStyle("mediumblack"))
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(5, 1, 5, 3),
                  child: new Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Colors.black,
                    size: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1)),
                ),
                SizedBox(width: 10),
                Text(paymentType, style: Styles.customStyle("mediumblack"))
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Total", style: Styles.customStyle("largeboldblack")),
                Text("IDR ${cart.getTotal()}",
                    style: Styles.customStyle("largeboldblack"))
              ],
            ),
          ),
          Container(
            width: screenWidth,
            height: 2,
            color: Styles.white,
          ),
          Container(
            width: screenWidth,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 1, 5, 3),
                      child: Image.asset("assets/icon/qr.png",
                          width: 20, height: 20),
                    ),
                    SizedBox(width: 10),
                    Text("QR Code", style: Styles.customStyle("mediumblack"))
                  ],
                ),
                Text("Show", style: Styles.customStyle("mediumgray"))
              ],
            ),
          ),
        ],
      ),
    );
  }

  orderListTile(int i, BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: screenWidth * 0.15,
                child: Center(
                    child: Text("${cart.qtys[i]}",
                        style: Styles.customStyle("mediumboldblack"))),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.75,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${cart.foods[i].name}",
                            style: Styles.customStyle("mediumblack")),
                        Text("${cart.foods[i].getPrice()}",
                            style: Styles.customStyle("mediumblack")),
                      ],
                    ),
                  ),
                  SizedBox(height: 5),
                  cart.extras.isNotEmpty && cart.foods[i].name == "Chunky Pie"
                      ? Container(
                          width: screenWidth * 0.75,
                          child: MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                itemCount: cart.extras.length,
                                shrinkWrap: true,
                                itemBuilder: (context, int j) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 5),
                                          Text("${cart.extras[j].name}",
                                              style: Styles.customStyle(
                                                  "smallblack")),
                                        ],
                                      ),
                                      Text("${cart.extras[j].getPrice()}",
                                          style: Styles.customStyle(
                                              "mediumblack")),
                                    ],
                                  );
                                }),
                          ),
                        )
                      : Container(),
                  SizedBox(height: 5),
                  Text("${cart.notes[i]}",
                      style: Styles.customStyle("smallgray")),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
