import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/models/postsModel.dart';


class FavoriteIcon extends StatefulWidget {
  bool isFav;
  final int index;

 FavoriteIcon({Key? key, required this.index, required this.isFav, }) : super(key: key);

  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          if (widget.isFav) {
            widget.isFav = false;
            fav_list.remove(fav_list[widget.index]);
            // DUMMY_DATA[DUMMY_DATA.indexOf(fav_list[widget.index])].isFav=false;

          } else {
            widget.isFav = true;
            fav_list.add(DUMMY_DATA[widget.index]);
            DUMMY_DATA[widget.index].isFav=true;
          }
        });
      },
      icon: widget.isFav
          ? Icon(Icons.favorite)
          : Icon(Icons.favorite_border),
      color: Colors.deepPurple,
    );
  }
}
