import 'package:flutter/material.dart';
import 'package:restoin/screens/notification_content_screen.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final items = List<String>.generate(5, (i) => "Item ${i + 1}");
  int _currentIndex = 3;
  bool isClearAll = false;

  void showDeletePopUp() async{
    bool result = await showDialog(
      context: context,
      builder: (context) => DeleteAllPopUp()
    );

    if (result == null) result = false;

    setState(() {
      isClearAll = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return new Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
       child: Column(
         children: <Widget>[
           Container(
             padding: EdgeInsets.fromLTRB(screenWidth * 0.05, screenWidth * 0.1, screenWidth * 0.05, 0),
             width: screenWidth,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 GestureDetector(
                   onTap: () {
                     Navigator.pop(context);
                   },
                   child: Icon(FontAwesomeIcons.angleLeft, color: Colors.black, size: 28)
                 ),
                 Text("Notification", style: Styles.customStyle("largeboldblack")),
                 GestureDetector(
                   onTap: () {
                     showDeletePopUp();
                   },
                   child: Icon(FontAwesomeIcons.trashAlt, color: Colors.black, size: 28),
                 )
               ],
             ),
            ),
            SizedBox(height: 10),
            Container(
              width: screenWidth,
              height: 5,
              color: Styles.white,
            ),
    
            isClearAll ? Container() : 
            ListView.builder(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                var deletedItem;

                return Dismissible(
                  key: Key(item),
                  background: Container(
                    padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                    color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(FontAwesomeIcons.trashAlt, color: Colors.white, size: 28),
                        SizedBox(width: 20),
                        Text("Delete", style: Styles.customStyle("midboldwhite"))
                      ],
                    ),
                  ),
                  onDismissed: (direction) {
                    setState(() {
                      deletedItem = items.removeAt(index);
                    });

                    // Show Alert
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                      content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(FontAwesomeIcons.trashAlt, color: Colors.white, size: 28),
                            Text("Notification Deleted", style: Styles.customStyle("midboldwhite")),
                            GestureDetector(
                              onTap: () {
                                // Return the data to the list
                                setState(() {
                                  items.insert(index, deletedItem);  
                                });
                              },
                              child: Text("Undo", style: Styles.customStyle("midboldwhite"))
                            )
                          ]
                        )
                      )
                    );
                  },
                  child: GestureDetector(
                    onTap: () {
                      // Go to Notification Content
                      Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => NotificationContentScreen()
                        )
                      );
                    },
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Container(
                              child: Icon(FontAwesomeIcons.envelope,
                                color: Colors.white,
                                size: 20
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                color: Styles.orange
                              ),
                            ),
                          ),
                          title: Text("You got message from Haragakure !", style: Styles.customStyle("midblack")),
                          subtitle: Text("Come to our resto and get 10% discount", style: Styles.customStyle("smallblack")),
                        ),
                        GrayLine()
                      ]
                    )
                  )
                );
              }
            ),
         ],
       ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset("assets/icon/o_home.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_home.png",
                    width: 20, height: 20),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset("assets/icon/o_notif.png",
                    width: 20, height: 20)
                : Image.asset("assets/icon/b_notif.png",
                    width: 20, height: 20),
            title: Text('Notification'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset("assets/icon/o_wallet.png",
                    width: 20, height: 20)
                : Image.asset("assets/icon/b_wallet.png",
                    width: 20, height: 20),
            title: Text('Wallet'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 3
                ? Image.asset("assets/icon/o_note.png", width: 20, height: 20)
                : Image.asset("assets/icon/b_note.png",
                    width: 20, height: 20),
            title: Text('Note'),
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 4
                ? Image.asset("assets/icon/o_profile.png",
                    width: 20, height: 20)
                : Image.asset("assets/icon/b_profile.png",
                    width: 20, height: 20),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      )
    );
  }
}

class GrayLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: 2,
      color: Styles.white
    );
  }
}

class DeleteAllPopUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            width: 300,
            height: 200,
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
                  Text("Delete All", style: Styles.customStyle("largerboldblack")),
                ],
              ),
            )
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              width: 280,
              height: 2,
              color: Styles.white,
            ),
          ),
          Positioned(
            top: 70,
            left: 70,
            child: Container(
              width: 160,
              child: Wrap(
                alignment: WrapAlignment.center,
                children: <Widget>[
                  Text(
                    "Your notification list will be deleted permanently be careful", 
                    style: Styles.customStyle("midgray"),
                    textAlign: TextAlign.center,  
                  ),
                ],
              ),
            ),          
          ),
          Positioned(
            bottom: 10,
            child: Container(
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.only(left: 90, top: 10, right: 90, bottom: 10),
                    onPressed: () {
                      Navigator.pop(context, true);
                    }, 
                    child: Text("Delete All", style: Styles.customStyle("mediumwhite")),
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