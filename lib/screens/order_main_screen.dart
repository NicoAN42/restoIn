import 'package:flutter/material.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/screens/change_order_type_screen.dart';
import 'package:restoin/screens/order_receipt_screen.dart';
import 'package:restoin/screens/voucher_search_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'change_payment_screen.dart';

class OrderMainScreen extends StatefulWidget {
  final Cart c;
  final Function addToCart;
  final Function addActivity;

  OrderMainScreen({this.c, this.addToCart, this.addActivity});

  @override
  _OrderMainScreenState createState() => _OrderMainScreenState();
}

class _OrderMainScreenState extends State<OrderMainScreen> {
  OrderTypeResult _orderTypeResult = OrderTypeResult(
    orderType: "Take Away",
    date: "21/6/20",
    time: "6:30pm",
    guest: 77,
  );

  int _paymentType = 0;

  Cart _curCart;
  String _voucherCode = "";

  void updateOrderType() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChangeOrderTypeScreen(editOrderType: _editOrderType)));
  }

  _editOrderType(OrderTypeResult o) => setState(() => _orderTypeResult = o);

  void updatePaymentType() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ChangePaymentScreen(editPaymentType: _editPaymentType)));
  }

  _editPaymentType(int pt) => setState(() => _paymentType = pt);

  void updateVoucherCode() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => VoucherSearchScreen(
                  voucherCode: _voucherCode,
                  editVoucherCode: _editVoucherCode,
                )));
  }

  _editVoucherCode(String s) => setState(() => _voucherCode = s);

  String getVoucherCode() {
    if (_voucherCode.isEmpty)
      return "Voucher";
    else
      return _voucherCode;
  }

  @override
  void initState() {
    _curCart = widget.c;
    super.initState();
  }

  Future<bool> _willPopCallback() async {
    widget.addToCart(_curCart);
    return true;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: _willPopCallback,
      child: new Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
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
                        "Cart",
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
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 20, screenWidth * 0.05, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Restaurant",
                            style: Styles.customStyle("mediumblack")),
                        SizedBox(height: 5),
                        Text("${_curCart.resto.name}",
                            style: Styles.customStyle("largeboldorange")),
                        Text("${_curCart.resto.location} (110 minutes)",
                            style: Styles.customStyle("smallgray"))
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("${_curCart.resto.distance}",
                            style: Styles.customStyle("largeboldblack")),
                        Text("KM", style: Styles.customStyle("mediumblack")),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: screenWidth,
                height: 10,
                color: Styles.white,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05, 20, screenWidth * 0.05, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Order List",
                          style: Styles.customStyle("mediumblack")),
                      SizedBox(height: 10),
                      Container(
                        width: screenWidth,
                        height: 2,
                        color: Styles.white,
                      ),
                    ],
                  )),
              MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                    itemCount: _curCart.foods.length,
                    shrinkWrap: true,
                    itemBuilder: (context, int i) {
                      return getFoodTile(screenWidth, i);
                    }),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Subtotal",
                                style: Styles.customStyle("mediumblack")),
                            Text("${_curCart.getPrice()}",
                                style: Styles.customStyle("mediumblack")),
                          ]),
                    ),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Tax (10%)",
                                style: Styles.customStyle("mediumblack")),
                            Text("${_curCart.getTax()}",
                                style: Styles.customStyle("mediumblack")),
                          ]),
                    ),
                    SizedBox(height: 10),
                    // Garis
                    Container(
                      width: screenWidth * 0.9,
                      height: 1,
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Total",
                                style: Styles.customStyle("mediumboldblack")),
                            Stack(
                                overflow: Overflow.visible,
                                children: <Widget>[
                                  _voucherCode.isEmpty
                                      ? Text("IDR ${_curCart.getTotal()}",
                                          style: Styles.customStyle(
                                              "mediumboldblack"))
                                      : Text("IDR ${_curCart.getTotalDisc()}",
                                          style: Styles.customStyle(
                                              "mediumboldblack")),
                                  Positioned(
                                    bottom: -10,
                                    right: 0,
                                    child: _voucherCode.isEmpty
                                        ? Container()
                                        : Text("IDR ${_curCart.getTotal()}",
                                            style: Styles.customStyle(
                                                "smallboldLineThroughgray")),
                                  ),
                                ])
                          ]),
                    ),
                    SizedBox(height: 10),
                    // Garis
                    Container(
                      width: screenWidth * 0.9,
                      height: 1,
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Image.asset("assets/icon/food.png",
                                    width: 15, height: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                              ),
                              SizedBox(width: 10),
                              Text(_orderTypeResult.orderType ?? "Take Away",
                                  style: Styles.customStyle("mediumblack"))
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              updateOrderType();
                            },
                            child: Text("Change",
                                style: Styles.customStyle("midgray")),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Garis
                    Container(
                      width: screenWidth * 0.9,
                      height: 1,
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: !(_orderTypeResult.orderType == "Take Away"),
                child: Container(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Date",
                                  style: Styles.customStyle("mediumblack")),
                              Text(_orderTypeResult.date ?? "Null",
                                  style: Styles.customStyle("mediumblack")),
                            ]),
                      ),
                      Container(
                        width: screenWidth * 0.9,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Time",
                                  style: Styles.customStyle("mediumblack")),
                              Text(_orderTypeResult.time ?? "Null",
                                  style: Styles.customStyle("mediumblack")),
                            ]),
                      ),
                      Visibility(
                        visible: _orderTypeResult.orderType == "Dine In" ||
                            _orderTypeResult.orderType == "Book Place",
                        child: Container(
                          width: screenWidth * 0.9,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Guest",
                                    style: Styles.customStyle("mediumblack")),
                                Text(
                                    _orderTypeResult.guest == null
                                        ? 0
                                        : _orderTypeResult.guest.toString(),
                                    style: Styles.customStyle("mediumblack")),
                              ]),
                        ),
                      ),
                      SizedBox(height: 10),
                      // Garis
                      Container(
                        width: screenWidth * 0.9,
                        height: 1,
                        color: Styles.white,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          _paymentType == 0
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                      child: new Icon(
                                        FontAwesomeIcons.dollarSign,
                                        color: Colors.black,
                                        size: 15,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                    SizedBox(width: 10),
                                    Text("Cash",
                                        style:
                                            Styles.customStyle("mediumblack"))
                                  ],
                                )
                              : Row(
                                  children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      child: Text(
                                        "UVU",
                                        style: TextStyle(
                                            color: Styles.black, fontSize: 8),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.black, width: 1)),
                                    ),
                                    SizedBox(width: 10),
                                    Text("129.500",
                                        style:
                                            Styles.customStyle("mediumblack"))
                                  ],
                                ),
                          GestureDetector(
                            onTap: () {
                              updatePaymentType();
                            },
                            child: Text("Change",
                                style: Styles.customStyle("midgray")),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Garis
                    Container(
                      width: screenWidth * 0.9,
                      height: 1,
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    screenWidth * 0.05, 10, screenWidth * 0.05, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.fromLTRB(5, 2, 5, 2),
                                child: Image.asset("assets/icon/voucher.png",
                                    width: 15, height: 15),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 1)),
                              ),
                              SizedBox(width: 10),
                              Text(getVoucherCode(),
                                  style: Styles.customStyle("mediumblack"))
                            ],
                          ),
                          GestureDetector(
                            onTap: () => updateVoucherCode(),
                            child: Text("Use Voucher",
                                style: Styles.customStyle("midgray")),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    // Garis
                    Container(
                      width: screenWidth * 0.9,
                      height: 1,
                      color: Styles.white,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        floatingActionButton: Container(
          width: screenWidth * 0.9,
          child: FloatingActionButton.extended(
              onPressed: () {
                widget.addActivity(_curCart, _orderTypeResult);
                widget.addToCart(new Cart());
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => OrderReceiptScreen(
                              c: _curCart,
                              otr: _orderTypeResult,
                            )));
              },
              backgroundColor: Styles.orange,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              label: Text(
                "Place Order",
                style: Styles.customStyle("mediumboldwhite"),
              )),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.yellow,
          child: Container(height: 0),
        ),
      ),
    );
  }

  getFoodTile(double screenWidth, int i) {
    return Container(
      padding: EdgeInsets.only(left: screenWidth * 0.05 - 16, top: 10),
      child: Column(
        children: <Widget>[
          //Item
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Tombol
              Container(
                width: screenWidth * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 10,
                      height: 20,
                      child: (FlatButton(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Icon(
                          FontAwesomeIcons.minus,
                          color: Styles.orange,
                          size: 12,
                        ),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            if (_curCart.qtys[i] == 1) {
                              if (_curCart.foods.length > 1)
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Wait",
                                            style: Styles.customStyle(
                                                "largeBoldBlack")),
                                        content: Text(
                                          "This action will discard the item from the cart. Are you sure?",
                                          style:
                                              Styles.customStyle("mediumGray"),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () => Navigator.of(
                                                      context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              child: Text("Cancel",
                                                  style: Styles.customStyle(
                                                      "mediumOrange"))),
                                          FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  _curCart.foods.remove(
                                                      _curCart.foods[i]);
                                                  _curCart.notes.remove(
                                                      _curCart.notes[i]);
                                                  _curCart.qtys
                                                      .remove(_curCart.qtys[i]);
                                                });

                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                              },
                                              child: Text("Discard Item",
                                                  style: Styles.customStyle(
                                                      "mediumOrange")))
                                        ],
                                      );
                                    });
                              else {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Wait",
                                            style: Styles.customStyle(
                                                "largeBoldBlack")),
                                        content: Text(
                                          "This action will empty your cart. Are you sure?",
                                          style:
                                              Styles.customStyle("mediumGray"),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                              onPressed: () => Navigator.of(
                                                      context,
                                                      rootNavigator: true)
                                                  .pop(),
                                              child: Text("Cancel",
                                                  style: Styles.customStyle(
                                                      "mediumOrange"))),
                                          FlatButton(
                                              onPressed: () {
                                                setState(() {
                                                  _curCart.foods.remove(
                                                      _curCart.foods[i]);
                                                  _curCart.notes.remove(
                                                      _curCart.notes[i]);
                                                  _curCart.qtys
                                                      .remove(_curCart.qtys[i]);
                                                });

                                                Navigator.of(context,
                                                        rootNavigator: true)
                                                    .pop();
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                  "Empty cart and go back",
                                                  style: Styles.customStyle(
                                                      "mediumOrange")))
                                        ],
                                      );
                                    });
                              }
                            } else
                              _curCart.qtys[i]--;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side: BorderSide(color: Styles.white, width: 1)),
                      )),
                    ),
                    Text("${_curCart.qtys[i]}",
                        style: Styles.customStyle("smallboldblack")),
                    ButtonTheme(
                      minWidth: 10,
                      height: 20,
                      child: (FlatButton(
                        padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: Styles.white,
                          size: 12,
                        ),
                        color: Styles.orange,
                        onPressed: () {
                          setState(() {
                            _curCart.qtys[i]++;
                          });
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      )),
                    ),
                  ],
                ),
              ),

              //Menu
              Container(
                width: screenWidth * 0.6 + 16,
                child: Wrap(
                  runSpacing: 5,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("${_curCart.foods[i].name}",
                            style: Styles.customStyle("mediumblack")),
                        Text("${_curCart.foods[i].getPrice()}",
                            style: Styles.customStyle("mediumblack")),
                      ],
                    ),
                    //Extra
                    _curCart.extras.isNotEmpty &&
                            _curCart.foods[i].name == "Chunky Pie"
                        ? MediaQuery.removePadding(
                            context: context,
                            removeTop: true,
                            child: ListView.builder(
                                itemCount: _curCart.extras.length,
                                shrinkWrap: true,
                                itemBuilder: (context, j) {
                                  return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          SizedBox(width: 10),
                                          Text("${_curCart.extras[j].name}",
                                              style: Styles.customStyle(
                                                  "midblack")),
                                        ],
                                      ),
                                      Text("${_curCart.extras[j].getPrice()}",
                                          style:
                                              Styles.customStyle("midblack")),
                                    ],
                                  );
                                }))
                        : Container(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _curCart.notes[i].isNotEmpty
                            ? Container(
                                width: screenWidth * 0.45,
                                child: Text("${_curCart.notes[i]}",
                                    style: Styles.customStyle("smallgray")),
                              )
                            : Container(),
                        SizedBox(height: 5),
                        Text("Edit", style: Styles.customStyle("smallorange")),
                        //TODO edit note
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 10),
          // Garis
          Container(
            width: screenWidth * 0.9,
            height: 1,
            color: Styles.white,
          ),
        ],
      ),
    );
  }
}

class CustomPlaceOrderButton extends StatefulWidget {
  final String text;

  const CustomPlaceOrderButton({Key key, this.text}) : super(key: key);

  @override
  _CustomPlaceOrderButtonState createState() => _CustomPlaceOrderButtonState();
}

class _CustomPlaceOrderButtonState extends State<CustomPlaceOrderButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}

// Container(
//   padding: EdgeInsets.only(left: screenWidth * 0.05 - 16, top: 10),
//   child: Column(
//     children: <Widget>[
//       //Item
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           //Tombol
//           Container(
//             width: screenWidth * 0.3,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 ButtonTheme(
//                   minWidth: 10,
//                   height: 20,
//                   child: (FlatButton(
//                     padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
//                     child: Icon(
//                       FontAwesomeIcons.minus,
//                       color: Styles.orange,
//                       size: 12,
//                     ),
//                     color: Colors.white,
//                     onPressed: () {
//                       setState(() {
//                         // Reduce counter
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2),
//                         side: BorderSide(
//                             color: Styles.white, width: 1)),
//                   )),
//                 ),
//                 Text("1",
//                     style: Styles.customStyle("smallboldblack")),
//                 ButtonTheme(
//                   minWidth: 10,
//                   height: 20,
//                   child: (FlatButton(
//                     padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
//                     child: Icon(
//                       FontAwesomeIcons.plus,
//                       color: Styles.white,
//                       size: 12,
//                     ),
//                     color: Styles.orange,
//                     onPressed: () {
//                       setState(() {
//                         // Add counter
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2)),
//                   )),
//                 ),
//               ],
//             ),
//           ),

//           //Menu
//           Container(
//             width: screenWidth * 0.6 + 16,
//             child: Wrap(
//               runSpacing: 5,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text("Chunky Pie",
//                         style: Styles.customStyle("mediumblack")),
//                     Text("75.000",
//                         style: Styles.customStyle("mediumblack")),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         SizedBox(width: 10),
//                         Text("Wafflepuff",
//                             style: Styles.customStyle("midblack")),
//                       ],
//                     ),
//                     Text("7.500",
//                         style: Styles.customStyle("midblack")),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       width: screenWidth * 0.45,
//                       child: Text("Don't use so much milk",
//                           style: Styles.customStyle("smallgray")),
//                     ),
//                     SizedBox(height: 5),
//                     Text("Edit",
//                         style: Styles.customStyle("smallorange")),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//       SizedBox(height: 10),
//       // Garis
//       Container(
//         width: screenWidth * 0.9,
//         height: 1,
//         color: Styles.white,
//       ),
//     ],
//   ),
// ),
// Container(
//   padding: EdgeInsets.only(left: screenWidth * 0.05 - 16, top: 10),
//   child: Column(
//     children: <Widget>[
//       //Item
//       Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: <Widget>[
//           //Tombol
//           Container(
//             width: screenWidth * 0.3,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 ButtonTheme(
//                   minWidth: 10,
//                   height: 20,
//                   child: (FlatButton(
//                     padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
//                     child: Icon(
//                       FontAwesomeIcons.minus,
//                       color: Styles.orange,
//                       size: 12,
//                     ),
//                     color: Colors.white,
//                     onPressed: () {
//                       setState(() {
//                         // Reduce counter
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2),
//                         side: BorderSide(
//                             color: Styles.white, width: 1)),
//                   )),
//                 ),
//                 Text("1",
//                     style: Styles.customStyle("smallboldblack")),
//                 ButtonTheme(
//                   minWidth: 10,
//                   height: 20,
//                   child: (FlatButton(
//                     padding: EdgeInsets.fromLTRB(4, 0, 4, 0),
//                     child: Icon(
//                       FontAwesomeIcons.plus,
//                       color: Styles.white,
//                       size: 12,
//                     ),
//                     color: Styles.orange,
//                     onPressed: () {
//                       setState(() {
//                         // Add counter
//                       });
//                     },
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(2)),
//                   )),
//                 ),
//               ],
//             ),
//           ),

//           //Menu
//           Container(
//             width: screenWidth * 0.6 + 16,
//             child: Wrap(
//               runSpacing: 5,
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Text("F'Bread Tofu",
//                         style: Styles.customStyle("mediumblack")),
//                     Text("35.000",
//                         style: Styles.customStyle("mediumblack")),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         SizedBox(width: 10),
//                         Text("Onion Ring",
//                             style: Styles.customStyle("midblack")),
//                       ],
//                     ),
//                     Text("10.500",
//                         style: Styles.customStyle("midblack")),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         SizedBox(width: 10),
//                         Text("Crackers",
//                             style: Styles.customStyle("midblack")),
//                       ],
//                     ),
//                     Text("2.500",
//                         style: Styles.customStyle("midblack")),
//                   ],
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       width: screenWidth * 0.45,
//                       child: Text(
//                           "Please, fry tofu a half cooked and spread more garlic",
//                           style: Styles.customStyle("smallgray")),
//                     ),
//                     SizedBox(height: 5),
//                     Text("Edit",
//                         style: Styles.customStyle("smallorange")),
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//       SizedBox(height: 10),
//       // Garis
//       Container(
//         width: screenWidth * 0.9,
//         height: 1,
//         color: Styles.white,
//       ),
//     ],
//   ),
// ),
