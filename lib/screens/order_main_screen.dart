import 'package:flutter/material.dart';
import 'package:restoin/screens/voucher_search_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'change_payment_screen.dart';

class OrderMainScreen extends StatefulWidget {
  String voucherCode = "";

  OrderMainScreen({this.voucherCode});

  @override
  _OrderMainScreenState createState() => _OrderMainScreenState();
}

class _OrderMainScreenState extends State<OrderMainScreen> {
  int paymentType = 0;

  void updatePaymentType() async {
    paymentType = await Navigator.push(context,
      MaterialPageRoute<int>(builder: (context) => ChangePaymentScreen(paymentType: paymentType)
      )
    );
  }

  String getVoucherCode() {
    if (widget.voucherCode == null) 
      return "Voucher";
    else return widget.voucherCode;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  20, screenWidth * 0.05, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Restaurant", style: Styles.customStyle("mediumblack")),
                      SizedBox(height: 5),
                      Text("Louise Branz", style: Styles.customStyle("largeboldorange")),
                      Text("No. 17 Large River, Tangerang (110 minutes)", style: Styles.customStyle("smallgray"))
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text("40", style: Styles.customStyle("largeboldblack")),
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  20, screenWidth * 0.05, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Order List", style: Styles.customStyle("mediumblack")),
                  SizedBox(height: 10),
                  Container(
                    width: screenWidth,
                    height: 2,
                    color: Styles.white,
                  ),
                ],
              ) 
            ),

            Container(
              padding: EdgeInsets.only(left: screenWidth * 0.05 - 16, top: 10),
              child: Column(
                children: <Widget>[
                  //Item
                  Row (
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
                                    // Reduce counter
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  side: BorderSide(color: Styles.white, width: 1)
                                ),
                              )),
                            ),
                            Text("1", style: Styles.customStyle("smallboldblack")),
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
                                    // Add counter
                                  });
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
                                Text("Chunky Pie", style: Styles.customStyle("mediumblack")),
                                Text("75.000", style: Styles.customStyle("mediumblack")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                  Text("Wafflepuff", style: Styles.customStyle("midblack")),
                                  ],
                                ),
                                Text("7.500", style: Styles.customStyle("midblack")),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: screenWidth * 0.45,
                                  child: Text("Don't use so much milk", style: Styles.customStyle("smallgray")),
                                ),
                                SizedBox(height: 5),
                                Text("Edit", style: Styles.customStyle("smallorange")),
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
            ),

            Container(
              padding: EdgeInsets.only(left: screenWidth * 0.05 - 16, top: 10),
              child: Column(
                children: <Widget>[
                  //Item
                  Row (
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
                                    // Reduce counter
                                  });
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(2),
                                  side: BorderSide(color: Styles.white, width: 1)
                                ),
                              )),
                            ),
                            Text("1", style: Styles.customStyle("smallboldblack")),
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
                                    // Add counter
                                  });
                                },
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
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
                                Text("F'Bread Tofu", style: Styles.customStyle("mediumblack")),
                                Text("35.000", style: Styles.customStyle("mediumblack")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                  Text("Onion Ring", style: Styles.customStyle("midblack")),
                                  ],
                                ),
                                Text("10.500", style: Styles.customStyle("midblack")),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    SizedBox(width: 10),
                                  Text("Crackers", style: Styles.customStyle("midblack")),
                                  ],
                                ),
                                Text("2.500", style: Styles.customStyle("midblack")),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: screenWidth * 0.45,
                                  child: Text("Please, fry tofu a half cooked and spread more garlic", style: Styles.customStyle("smallgray")),
                                ),
                                SizedBox(height: 5),
                                Text("Edit", style: Styles.customStyle("smallorange")),
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
            ),

            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  10, screenWidth * 0.05, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Subtotal", style: Styles.customStyle("mediumblack")),
                        Text("130.500", style: Styles.customStyle("mediumblack")),
                      ]
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Tax", style: Styles.customStyle("mediumblack")),
                        Text("5.500", style: Styles.customStyle("mediumblack")),
                      ]
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  10, screenWidth * 0.05, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Total", style: Styles.customStyle("mediumboldblack")),
                        Text("IDR 136.000", style: Styles.customStyle("mediumboldblack")),
                      ]
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  10, screenWidth * 0.05, 0),
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
                              child: Image.asset("assets/icon/food.png", width: 15, height: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1
                                )
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Take Away", style: Styles.customStyle("mediumblack"))
                          ],
                        ),
                        Text("Change", style: Styles.customStyle("midgray"))
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  10, screenWidth * 0.05, 0),
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenWidth * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        paymentType == 0 ?
                        Row(
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
                                  color: Colors.black,
                                  width: 1
                                )
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Cash", style: Styles.customStyle("mediumblack"))
                          ],
                        ) :
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                              child: Text("UVU", 
                                style: TextStyle(
                                  color: Styles.black,
                                  fontSize: 8
                                ),
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1
                                )
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("129.500", style: Styles.customStyle("mediumblack"))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            updatePaymentType();
                          },
                          child: Text("Change", style: Styles.customStyle("midgray")),
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
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  10, screenWidth * 0.05, 0),
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
                              child: Image.asset("assets/icon/voucher.png", width: 15, height: 15),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1
                                )
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(getVoucherCode(), style: Styles.customStyle("mediumblack"))
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, 
                              MaterialPageRoute(
                                builder: (context) => VoucherSearchScreen(voucherCode: getVoucherCode())
                              )
                            );
                          },
                          child: Text("Change", style: Styles.customStyle("midgray")),
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
        child: CustomPlaceOrderButton(text: "Place Order"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
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
        onPressed: () {
          
        },
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}