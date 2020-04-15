import 'package:flutter/material.dart';
import 'package:restoin/screens/voucher_detail_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VoucherSearchScreen extends StatefulWidget {
  String voucherCode;
  VoucherSearchScreen({this.voucherCode});

  @override
  _VoucherSearchScreenState createState() => _VoucherSearchScreenState();
}

class _VoucherSearchScreenState extends State<VoucherSearchScreen> {
  @override

  List<String> voucherList = ["CODE145", "CODE155", "CODE175"];

  List<VoucherSection> displayList = new List();

  int counter = 0;

  void init() {
    if (counter > 0) return;
    counter++;
    for (int i = 0; i < voucherList.length; i++){
      displayList.add(VoucherSection(code: voucherList[i], used: voucherList[i] == widget.voucherCode));
    }
  }

  void search(String query) {
    displayList.clear();
    if (query == "") query = "code";
    for (int i = 0; i < voucherList.length; i++){
      if (voucherList[i].toLowerCase().contains(query.toLowerCase())){
          displayList.add(VoucherSection(code: voucherList[i], used: voucherList[i] == widget.voucherCode));
      }
    }
  }

  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    init();

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
                      "Voucher",
                      style: Styles.customStyle("largeboldblack"),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                  0, screenWidth * 0.05, 15),
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFF3F3F3),
                ),
                child: Row(
                  children: <Widget>[
                    Image.asset("assets/icon/g_search.png", width: 20, height: 20),
                    SizedBox(width: 10),
                    Flexible(
                      child: TextField(
                        onChanged: (query){
                          setState(() {
                            search(query);
                            print(query);
                          });
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,                    
                          hintText: "Search voucher code",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: screenWidth * 0.9,
              height: 2,
              color: Styles.white,
            ),

            Column(
              children: displayList,
            ),

          ],
        ),
      ),
    );
  }
}

class VoucherSection extends StatefulWidget {
  String code;
  bool used;
 
  VoucherSection({this.code, this.used});

  @override
  _VoucherSectionState createState() => _VoucherSectionState();
}

class _VoucherSectionState extends State<VoucherSection> {
  
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => VoucherDetailScreen(voucherCode: widget.code)
          )
        );
      },
      child: Container(  
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(screenWidth * 0.05,
                10, screenWidth * 0.05, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.15,
                        height: screenWidth * 0.15,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red,
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 6, top: 2, right: 6, bottom: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFFFFE6B0),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text("Reward", style: Styles.customStyle("midorange")),
                          ),
                          SizedBox(height: 4),
                          Container(
                            width: screenWidth * 0.65,
                            child: Text(widget.code + " - Discount 40%", style: Styles.customStyle("mediumblack"))
                          ),
                          SizedBox(height: 10),
                          Text("Valid until 24 June 2021", style: Styles.customStyle("midgray")),
                        ],
                      ),
                    ],
                  ),
                  widget.used ?
                  Container(
                    width: 15,
                    height: 15,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Styles.orange
                    )
                  ) : Container()
                ],
              )
            ),
            Container(
              width: screenWidth * 0.9,
              height: 2,
              color: Styles.white,
            ),
          ],
        ),
      )
    );
  }
}