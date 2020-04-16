import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

var _value = "Take Away";
int _timeOption = 1;
int _guestCounter = 1;
OrderTypeResult orderTypeResult;
DateTime dateTime;
List<String> timeOptions = ["8.30am", "10:30am", "12:30pm", "2:30pm", "4:30pm", "6:30pm", "8:30pm"];

class OrderTypeResult extends StatelessWidget {
  final String orderType;
  final String date;
  final String time;
  final int guest;

  OrderTypeResult({this.orderType, this.date, this.time, this.guest});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class ChangeOrderTypeScreen extends StatefulWidget {
  @override
  _ChangeOrderTypeScreenState createState() => _ChangeOrderTypeScreenState();
}

class _ChangeOrderTypeScreenState extends State<ChangeOrderTypeScreen> {
  List<Widget> getTimeOptionsButton(){
    List<Widget> result = new List();

    for (int i = 0; i < timeOptions.length; i++){
      if (_value == "Dine In" && i == 0) {
        result.add(
          FlatButton(
            child: Text("Now", style: _timeOption == i ? Styles.customStyle("midwhite") : Styles.customStyle("midblack")),
            color: _timeOption == i ? Styles.orange : Styles.white,
            onPressed: () {
              setState(() {
                _timeOption = i;
              });
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(color: Styles.white, width: 1)
            ),
          )
        );
        continue;
      }

      result.add(
        FlatButton(
          child: Text(timeOptions[i], style: _timeOption == i ? Styles.customStyle("midwhite") : Styles.customStyle("midblack")),
          color: _timeOption == i ? Styles.orange : Styles.white,
          onPressed: () {
            setState(() {
              _timeOption = i;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Styles.white, width: 1)
          ),
        )
      );
    }
    return result;
  }

  DropdownButton _orderType() => DropdownButton<String>(
      style: Styles.customStyle("largeboldblack"),
      underline: SizedBox(),
      items: [
        DropdownMenuItem<String>(
          value: "Take Away",
          child: Text("Take Away"),
        ),
        DropdownMenuItem<String>(
          value: "Book Place",
          child: Text("Book Place"),
        ),
        DropdownMenuItem<String>(
          value: "Dine In",
          child: Text("Dine In"),
        ),
        DropdownMenuItem<String>(
          value: "Pick Later",
          child: Text("Pick Later"),
        ),
      ],
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      value: _value,
    );


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

            SizedBox(height: 10),

            Container(
              width: screenWidth * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Order type", style: Styles.customStyle("mediumblack")),
                  _orderType()
                ],
              ),
            ),

            // Date & Time
            Visibility(
              visible: _value == "Book Place",
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/date.png", width: 20, height: 20),
                        SizedBox(width: 10),
                        Text("Date & Time", style: Styles.customStyle("mediumblack"))
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Date : " + (dateTime == null ? "Please choose a date" : dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString()), style: Styles.customStyle("midblack")),
                          FlatButton(
                            child: Text("Pick Date", style: Styles.customStyle("midblack")),
                            color: Styles.white,
                            onPressed: () {
                              showDatePicker(
                                context: context, 
                                initialDate: dateTime == null ? DateTime.now() : dateTime, 
                                firstDate: DateTime(2001), 
                                lastDate: DateTime(2222)
                              ).then((date){
                                setState(() {
                                  dateTime = date;
                                });
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(color: Styles.white, width: 1)
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenWidth * 0.9,
                      child: Center(
                        child: Wrap(
                          spacing: 5,
                          children: getTimeOptionsButton()
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),

            Visibility(
              visible: _value == "Pick Later" || _value == "Dine In",
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                         Icon(
                          FontAwesomeIcons.clock,
                          color: Styles.black,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Text("Time", style: Styles.customStyle("mediumblack"))
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenWidth * 0.9,
                      child: Center(
                        child: Wrap(
                          spacing: 5,
                          children: getTimeOptionsButton()
                        )
                      ),
                    )
                  ],
                ),
              ),
            ),

            Visibility(
              visible: _value == "Book Place" || _value == "Dine In",
              child: Container(
                padding: EdgeInsets.only(bottom: 20),
                width: screenWidth * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/icon/guest.png", width: 20, height: 20),
                        SizedBox(width: 10),
                        Text("Guest", style: Styles.customStyle("mediumblack"))
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenWidth * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 0,
                            child: FlatButton(
                              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                              color: Styles.white,
                              onPressed: () {
                                setState(() {
                                  if (_guestCounter > 1) _guestCounter--;
                                });
                              },
                              child: new Icon(
                                FontAwesomeIcons.minus,
                                color: Styles.orange,
                                size: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(4.0),
                                side: BorderSide(color: Styles.white),
                              ),
                            ),
                          ),
                          Text(" " + _guestCounter.toString() + " ", style: Styles.customStyle("largeboldblack")),
                          ButtonTheme(
                            minWidth: 0,
                            child: FlatButton(
                              padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                              color: Styles.orange,
                              onPressed: () {
                                setState(() {
                                  _guestCounter++;
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


                  ],
                ),
              ),
            )
          ],
        ),
      ),

      floatingActionButton: Container(
        width: screenWidth * 0.9,
        child: CustomConfirmButton(text: "Confirm"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
      ),
    );
  }
}

class CustomConfirmButton extends StatefulWidget {
  final String text;

  const CustomConfirmButton({Key key, this.text}) : super(key: key);

  @override
  _CustomConfirmButtonState createState() => _CustomConfirmButtonState();
}

class _CustomConfirmButtonState extends State<CustomConfirmButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          if (dateTime == null) dateTime = DateTime.now();
          Navigator.pop(context,
            OrderTypeResult(
              orderType: _value,
              date: dateTime.day.toString() + "/" + dateTime.month.toString() + "/" + dateTime.year.toString(), 
              time: timeOptions[_timeOption],
              guest: _guestCounter,
            )
          );
        },
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}