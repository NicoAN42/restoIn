import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderReceiptScreen extends StatefulWidget {
  @override
  _OrderReceiptScreenState createState() => _OrderReceiptScreenState();
}

class _OrderReceiptScreenState extends State<OrderReceiptScreen> {
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
              restaurantName: "Louise Branz",
              orderType: "Take Away",
              paymentType: "Cash",
              screenWidth: screenWidth,
            )
          ],
        )
      ),

      floatingActionButton: Container(
        width: screenWidth * 0.9,
        child: CustomOrderStatusButton(text: "Order Status"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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

  OrderReceiptSection({this.orderId, this.date, this.restaurantName, this.orderType, this.paymentType, this.screenWidth});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: screenWidth,
      padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Order Id", style: Styles.customStyle("mediumblack")),
                    SizedBox(height: 5),
                    Text(orderId, style: Styles.customStyle("mediumboldblack")),
                  ]
                ),
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
                    Text("Restaurant", style: Styles.customStyle("mediumblack")),
                    SizedBox(height: 5),
                    Text(restaurantName, style: Styles.customStyle("largeboldorange")),
                  ]
                ),
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
                    Text("Order list", style: Styles.customStyle("mediumblack")),
                    SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: screenWidth * 0.15,
                          child: Center(child: Text("1", style: Styles.customStyle("mediumboldblack"))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: screenWidth * 0.75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text("Chunky Pie", style: Styles.customStyle("mediumblack")),
                                  Text("75.000", style: Styles.customStyle("mediumblack")),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              width: screenWidth * 0.75,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      SizedBox(width: 5),
                                      Text("Wafflepuff", style: Styles.customStyle("mediumblack")),
                                    ],
                                  ),
                                  Text("7.500", style: Styles.customStyle("mediumblack")),
                                ],
                              ),
                            ),
                            SizedBox(height: 5),
                            Text("Don't use so much milk", style: Styles.customStyle("smallgray")),
                          ],
                        ),

                      ],
                    ),
                    
                  ]
                ),
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
                    border: Border.all(
                      color: Colors.black,
                      width: 1
                    )
                  ),
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
                Text("IDR 88.500", style: Styles.customStyle("largeboldblack"))
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
                      child: Image.asset("assets/icon/qr.png", width: 20, height: 20),
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
}

class CustomOrderStatusButton extends StatefulWidget {
  final String text;

  const CustomOrderStatusButton({Key key, this.text}) : super(key: key);

  @override
  _CustomOrderStatusButtonState createState() => _CustomOrderStatusButtonState();
}

class _CustomOrderStatusButtonState extends State<CustomOrderStatusButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          //TODO: Navigate to Order Status
        },
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}