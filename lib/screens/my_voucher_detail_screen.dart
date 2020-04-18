import 'package:flutter/material.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyVoucherDetailScreen extends StatefulWidget {
  final String voucherCode;

  MyVoucherDetailScreen({this.voucherCode = "CODE145"});

  @override
  _MyVoucherDetailScreenState createState() => _MyVoucherDetailScreenState();
}

class _MyVoucherDetailScreenState extends State<MyVoucherDetailScreen> {
  @override
  void initState() {
    super.initState();
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
            Stack(
              children: <Widget>[
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
                  top: 40,
                  left: 5,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      child: new Icon(
                        FontAwesomeIcons.angleLeft,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Column(
                children: <Widget>[
                  Text(widget.voucherCode + " - Discount 40%",
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
                            "This is the voucher detail page. The content of this page is the detail of the voucher.",
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
    );
  }
}
