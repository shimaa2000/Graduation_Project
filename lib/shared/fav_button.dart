import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/network/cubit/favCubit.dart';
import 'package:graduation_project/network/cubit/favStates.dart';

import '../screens/homeScreen.dart';

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
    return BlocProvider(create: (BuildContext context)=> FavCubit(),child: BlocConsumer<FavCubit , FavStates>(
      listener: (context, state){},
      builder: (context , state){
        return IconButton(
          onPressed: () {
            setState(() {
              if (widget.isFav) {
                widget.isFav = false;
              } else {
                widget.isFav = true;
                FavCubit.get(context).setFav(id!);
              }
            });
          },
          icon: widget.isFav
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
          color: Theme.of(context).primaryColor,
        );
      },
    ),);

  }
}
