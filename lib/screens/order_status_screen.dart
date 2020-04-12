import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class OrderStatusScreen extends StatefulWidget {
  @override
  _OrderStatusScreenState createState() => _OrderStatusScreenState();
}

class _OrderStatusScreenState extends State<OrderStatusScreen> {
  int _orderStatus = 0;

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
                      "Order Status",
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
              width: screenWidth,
              padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Order Id", style: Styles.customStyle("mediumblack")),
                            SizedBox(height: 5),
                            Text("LB-018271", style: Styles.customStyle("mediumboldblack")),
                          ]
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text("21/06/2020 12:10", style: Styles.customStyle("midblack")),
                            SizedBox(height: 5),
                            Text("Show Detail", style: Styles.customStyle("midgray")),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Restaurant", style: Styles.customStyle("mediumblack")),
                        SizedBox(height: 5),
                        Container(
                          width: screenWidth * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Louise Branz", style: Styles.customStyle("largeboldorange")),
                              Row(
                                children: <Widget>[
                                  Icon(FontAwesomeIcons.phone,
                                    color: Colors.black,
                                    size: 15,
                                  ),
                                  SizedBox(width: 20),
                                  Image.asset("assets/icon/chat.png", width: 16, height: 16),
                                ],
                              )
                            ],
                          ),
                        )
                      ]
                    ),
                  ),

                  Container(
                    width: screenWidth,
                    height: 2,
                    color: Styles.white,
                  ),

                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Order Status", style: Styles.customStyle("mediumblack")),
                        Stack(
                          children: <Widget>[
                            Container(
                              width: screenWidth * 0.9,
                              height: 80,
                            ),
                            Positioned(
                              top: 21, 
                              child: Container(
                                width: screenWidth * 0.9,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Styles.lightOrange,
                                ),
                              ),
                            ),
                            Positioned(
                              width: screenWidth * 0.9,
                              top: 15,
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _orderStatus == 0 ? Styles.orange : Styles.gray,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white
                                            )
                                          ),
                                        ),
                                        Text("Waiting", style: _orderStatus == 0 ? Styles.customStyle("smallorange") :Styles.customStyle("smallgray"))
                                      ],
                                    ),
                                    
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _orderStatus == 1 ? Styles.orange : Styles.gray,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white
                                            )
                                          ),
                                        ),
                                        Text("Confirmed", style: _orderStatus == 1 ? Styles.customStyle("smallorange") : Styles.customStyle("smallgray"))
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _orderStatus == 2 ? Styles.orange : Styles.gray,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white
                                            )
                                          ),
                                        ),
                                        Text("Preparing", style: _orderStatus == 2 ? Styles.customStyle("smallorange") : Styles.customStyle("smallgray"))
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _orderStatus == 3 ? Styles.orange : Styles.gray,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white
                                            )
                                          ),
                                        ),
                                        Container(
                                          width: 60,
                                          child: Text(
                                            "Ready to serve", 
                                            style: _orderStatus == 3 ? Styles.customStyle("smallorange") : Styles.customStyle("smallgray"),
                                            textAlign: TextAlign.center),
                                        )
                                      ],
                                    ),

                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: _orderStatus == 4 ? Styles.orange : Styles.gray,
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white
                                            )
                                          ),
                                        ),
                                        Text("Done", style: _orderStatus == 4 ? Styles.customStyle("smallorange") : Styles.customStyle("smallgray"))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: 
        Visibility(
          visible: _orderStatus == 0,
          child: Container(
            width: screenWidth * 0.9,
            child: CustomCancelOrderButton(text: "Cancel Order"),
          ),
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Styles.red,
        child: Container(height: 0),
      ),
    );
  }
}

class CustomCancelOrderButton extends StatefulWidget {
  final String text;

  const CustomCancelOrderButton({Key key, this.text}) : super(key: key);

  @override
  _CustomCancelOrderButtonState createState() => _CustomCancelOrderButtonState();
}

class _CustomCancelOrderButtonState extends State<CustomCancelOrderButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => CancelOrderPopUp()
          );
        },
        backgroundColor: Styles.red,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}

class CancelOrderPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: 300,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              color: Colors.white,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Image.asset("assets/icon/close.png", width: 15, height: 15),
            )
          ),
          Positioned(
            top: 10,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Are you sure to", style: Styles.customStyle("mediumgray")),
                ],
              ),
            )
          ),
          Positioned(
            top: 40,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Cancel Order", style: Styles.customStyle("largerboldblack")),
                ],
              ),
            )
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(left: 80, top: 10, right: 80, bottom: 10),
                    onPressed: () {
                      // TODO: Cancel Order
                    }, 
                    child: Text("Confirm", style: Styles.customStyle("mediumwhite")),
                    color: Styles.red,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}