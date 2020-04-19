import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:restoin/models/cart.dart';
import 'package:restoin/models/restaurant.dart';
import 'package:restoin/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:restoin/widgets/custom_list_tile.dart';

class FavoriteScreen extends StatefulWidget {
  final Function addToCart;
  final Cart lastCart;
  final Function addActivity;

  const FavoriteScreen(
      {Key key, this.addToCart, this.lastCart, this.addActivity})
      : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<Restaurant> restoList = [];

  @override
  void initState() {
    super.initState();
    restoList.clear();
    restoList.add(new Restaurant(
      image: "assets/restaurant/louiseBranz.jpg",
      rating: [4.9],
      name: "Louise Branz",
      open: "7am",
      close: "11pm",
      location: "No. 17 Large River, Tangerang",
      type: ["Western", "Indonesian"],
      distance: 4,
      featuredFoods: [
        // new Food(
        //     image: "assets/food/louise_branz/chunkypie.jpg",
        //     name: "Chunky Pie",
        //     price: 75000,
        //     type: ["Western"],
        //     rating: [5.0]),
        // new Food(
        //     image: "assets/food/louise_branz/fbread.jpg",
        //     name: "F' Bread Tofu",
        //     price: 35000,
        //     type: ["Western"],
        //     rating: [5.0]),
      ],
      menu: [
        '9CHK8MuV2qxPwYtEs9zV',
        'wh257CI3uoUnEoRBGEUx',
        'DTSCBAOpBIX26aEaufra',
        'Gn6mEWodhOPwHGqlJTUx',
        'vXD1EroLdRF1y88AReyn'
      ],
    ));
    restoList.add(new Restaurant(
      image: "assets/restaurant/geraldVenue.jpg",
      rating: [4.9],
      name: "Gerald Venue",
      open: "10am",
      close: "10pm",
      location: "Plaza Terra, Fl. 5, Bandung",
      type: ["Western", "Soup"],
      distance: 9.3,
      featuredFoods: [
        // new Food(
        //     image: "assets/food/gerald_venue/frutelamina.jpg",
        //     name: "Frute La Mina",
        //     price: 195000,
        //     type: ["Western", "Breakfast"],
        //     rating: [4.9]),
      ],
      menu: [
        '3A0UPfIJD9rp2cpv9EmL',
        'Jr4PFBmnWXwUrD1FLzCH',
        'cv4g1TC8omRuoVJKvBFu',
        'ieQkZ9qtKCMCMDTM9vjz',
        'uDgDI6ZoXfj2DLK9wE7e',
        'yJO2TQGpQhmFlpfMlTQw'
      ],
    ));
    restoList.add(new Restaurant(
      image: "assets/restaurant/queenRe.png",
      rating: [4.9],
      name: "Queen Re",
      open: "7am",
      close: "11pm",
      location: "No. 11 Long River, Banten",
      type: ["Western", "Indonesian"],
      distance: 15,
      featuredFoods: [
        // new Food(
        //     image: "assets/food/queen_re/mackcorne.jpg",
        //     name: "Mack Corne",
        //     price: 75000,
        //     type: ["Western", "Indonesian"],
        //     rating: [5.0]),
      ],
      menu: [
        'OXe0uNdq3hTQstRckPsQ',
        '1h8ASbuWUpVLaARmFnrH',
        'CzP0c6EkUAEWJ7S9M1Cp',
        'fgkinwiCHxwecIkbyWQk',
        'mCTGv8GysJrzcXAzIenL',
        'yCiIo7xrmeLhfSSkZgZm'
      ],
    ));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // Code the contents here
            // Header
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
                      "Favorites",
                      style: Styles.customStyle("largeboldblack"),
                    ),
                  )
                ],
              ),
            ),

            // Content
            Container(
                color: Colors.white,
                height: screenHeight - 88,
                child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                        itemCount: restoList.length,
                        // shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CustomRestoTile(
                            r: restoList[index],
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                            addToCart: widget.addToCart,
                            lastCart: widget.lastCart,
                            addActivity: widget.addActivity,
                          );
                        })))

            // Code the contents here
          ],
        ),
      ),
    );
  }
}
