import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../styles.dart';

class CustomComment extends StatefulWidget {
  String profilePic;
  String name;
  String comment;
  List<String> image;
  int star;
  double screenWidth;
  double screenHeight;

  CustomComment({Key key, this.profilePic, this.name, this.comment, this.image, this.star, this.screenWidth, this.screenHeight}) : super(key: key);
  @override
  _CustomCommentState createState() => _CustomCommentState();
}

class _CustomCommentState extends State<CustomComment> {
  List<Widget> createImageList() {
    List<Widget> list = new List();
    if (widget.image == null) return list;
    for (int i = 0; i < widget.image.length; i++) {
      list.add(
        Container(
          width: widget.screenWidth * 0.15,
          height: widget.screenWidth * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(widget.image[i]),
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0))
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.screenWidth * 0.9,
      padding: EdgeInsets.only(top: widget.screenWidth * 0.05, bottom: widget.screenWidth * 0.05),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: widget.screenWidth * 0.15,
            height: widget.screenWidth * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(widget.profilePic),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0))
            ),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(widget.name, style: Styles.customStyle("mediumblack"),),
              Container(
                width: widget.screenWidth * 0.7,
                child: Text(widget.comment, style: Styles.customStyle("smallblack"),),
              ),
              SizedBox(height: 5),
              Container(
                width: widget.screenWidth * 0.7,
                height: 2,
                color: Styles.white,
              ),
              SizedBox(height: 5),
              Container(
                padding: createImageList().length == 0 ? EdgeInsets.only(bottom: 0) : EdgeInsets.only(bottom: 5),
                child: Wrap(
                  spacing: widget.screenWidth * 0.025,
                  runSpacing: widget.screenWidth * 0.025,
                  children: createImageList(),
                ),
              ),
              ReviewRating(star: widget.star),
            ],
          ),
        ],
      ),
    );
  }
}

class ReviewRating extends StatefulWidget {
  int star;

  ReviewRating({Key key, this.star}) : super(key: key);
  @override
  _ReviewRatingState createState() => _ReviewRatingState();
}

class _ReviewRatingState extends State<ReviewRating> {
  @override
  Widget build(BuildContext context) {
    switch (widget.star) {
      case 1:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
            ],
          ),
        );
        break;
      case 2:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
            ],
          ),
        );
        break;
      case 3:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
            ],
          ),
        );
        break;
      case 4:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
            ],
          ),
        );
        break;
      case 5:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
              Image.asset("assets/icon/o_star.png", width: 14, height: 14),
            ],
          ),
        );
        break;
      default:
        return Container(
          child: Wrap(
            spacing: 2,
            children: <Widget>[
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
              Icon(
                FontAwesomeIcons.star,
                color: Styles.orange,
                size: 14,
              ),
            ],
          ),
        );
        break;
    }
  }
}