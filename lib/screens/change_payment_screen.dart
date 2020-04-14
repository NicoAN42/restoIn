import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

int paymentType = 0;

class ChangePaymentScreen extends StatefulWidget {
  ChangePaymentScreen({paymentType});

  @override
  _ChangePaymentScreenState createState() => _ChangePaymentScreenState();
}

class _ChangePaymentScreenState extends State<ChangePaymentScreen> {
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
                ],
              ),
            ),
            Container(
              width: screenWidth,
              height: 10,
              color: Styles.white,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05, 10, screenWidth * 0.05, 10),
              child: Row(
                children: <Widget>[
                  Text("Payment Type", style: Styles.customStyle("mediumblack")),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.9,
              height: 2,
              color: Styles.white,
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  paymentType = 0;
                });
              },
              child: Container(
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
                              Text("Cash", style: Styles.customStyle("mediumblack")),
                            ],
                          ),
                          paymentType == 0 ?
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Styles.orange
                            )
                          ) : Container(),
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
            ),

            GestureDetector(
              onTap: () {
                setState(() {
                  paymentType = 1;
                });
              },
              child: Container(
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
                          paymentType == 1 ?
                          Container(
                            width: 15,
                            height: 15,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Styles.orange
                            )
                          ) : Container(),
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
            ),
          ],
        ),
      ),

      floatingActionButton: Container(
        width: screenWidth * 0.9,
        child: CustomConfirmPaymentTypeButton(text: "Confirm"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
      ),
    );
  }
}

class CustomConfirmPaymentTypeButton extends StatefulWidget {
  final String text;

  const CustomConfirmPaymentTypeButton({Key key, this.text}) : super(key: key);

  @override
  _CustomConfirmPaymentTypeButtonState createState() => _CustomConfirmPaymentTypeButtonState();
}

class _CustomConfirmPaymentTypeButtonState extends State<CustomConfirmPaymentTypeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context, paymentType);
        },
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}