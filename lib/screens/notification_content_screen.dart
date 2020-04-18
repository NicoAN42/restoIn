import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.23 + 30,
                ),
                Container(
                  width: screenWidth,
                  height: screenHeight * 0.23,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/icon/phone_banner.jpg")),
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
                      ],
                    )),
                Positioned(
                    bottom: 0,
                    width: screenWidth,
                    child: Image.asset("assets/icon/disc_circle.png",
                        width: 60, height: 60)),
                Positioned(
                    bottom: 15,
                    width: screenWidth,
                    child: Center(
                        child: Text("%",
                            style: Styles.customStyle("largerboldorange"))))
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
                  Text("Haragakure Birthday",
                      style: Styles.customStyle("largeboldblack")),
                  SizedBox(height: 5),
                  Text("Valid in 24 February 2020 to 24 June 2021",
                      style: Styles.customStyle("smallblack")),
                  SizedBox(height: 20),
                  Container(
                    width: screenWidth * 0.9,
                    height: 2,
                    color: Styles.white,
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      runSpacing: 10,
                      children: <Widget>[
                        Text("Description",
                            style: Styles.customStyle("mediumblack")),
                        Text(
                            "This is the notification detail page. The content of this page is the detail of the notification.",
                            style: Styles.customStyle("midBlack")),
                        Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi tristique ipsum a suscipit venenatis. Pellentesque nulla nisl, molestie gravida congue in, laoreet facilisis dui. Vestibulum at molestie metus. Suspendisse eleifend eros a magna finibus, id hendrerit turpis blandit. Ut pharetra tincidunt vulputate. Donec at turpis euismod, aliquam libero ut, mattis arcu. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas aliquam risus non tincidunt cursus. Suspendisse ultrices ex magna, eget aliquet risus pulvinar ut.",
                            style: Styles.customStyle("midblack"))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: screenWidth * 0.9,
        child: CustomOrderNowButton(text: "Order Now"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: BottomAppBar(
        color: Colors.yellow,
        child: Container(height: 0),
      ),
    );
  }
}

class CustomOrderNowButton extends StatefulWidget {
  final String text;
  final String voucherCode;

  const CustomOrderNowButton({Key key, this.text, this.voucherCode})
      : super(key: key);

  @override
  _CustomOrderNowButtonState createState() => _CustomOrderNowButtonState();
}

class _CustomOrderNowButtonState extends State<CustomOrderNowButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        backgroundColor: Styles.orange,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        label: Text(
          widget.text,
          style: Styles.customStyle("mediumboldwhite"),
        ));
  }
}
