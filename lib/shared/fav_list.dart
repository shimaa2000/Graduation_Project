import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/network/cubit/favCubit.dart';
import 'package:graduation_project/network/cubit/favStates.dart';

class FavList extends StatelessWidget {
  const FavList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavCubit, FavStates>(
        builder: (context, state) {
          var fav = FavCubit.get(context);
          return fav.favouriteList!.isEmpty

              ? const Center(
                  child: Text(
                    'There are no favorites yet!',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: fav.getLength(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                        child: NewCardWidget(
                      isFav: true,
                      name: fav.value!.user!.userName,
                      date: '',
                      imgUrl: fav.value!.images![0],
                      title: fav.value!.title,
                      price: double.parse(fav.value!.price) ,
                      size: fav.value!.size!.name,
                      index: fav.getIndex(),
                    ));
                  },
                );
        },
        listener: (context, state) {});
  }
}
