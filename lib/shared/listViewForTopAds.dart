import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/topAdCard.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';

class ListViewForTopAds extends StatelessWidget {
  const ListViewForTopAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return SizedBox(
            height: 220.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: DUMMY_DATA.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TopAdCard(
                  title: cubit.getTitle(),
                  price: cubit.getPrice().toDouble(),
                  imgUrl: DUMMY_DATA[index].ImgUrl,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
