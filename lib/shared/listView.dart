import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/models/products.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:intl/intl.dart';

import '../layout/new_card_widget.dart';

class ListViewBuilderData extends StatefulWidget {
  final String categories;
  String search;

  ListViewBuilderData({Key? key, this.categories = 'all', this.search = ''})
      : super(key: key);

  @override
  _ListViewBuilderDataState createState() => _ListViewBuilderDataState();
}

class _ListViewBuilderDataState extends State<ListViewBuilderData> {
  Widget listFit(int index, {String search = ''}) {
    return DUMMY_DATA[index].name.contains(search)
        ? BlocProvider(
      create: (BuildContext context) => AppCubit()..getProductData(),
      child: BlocConsumer<AppCubit, AppStates>(
        builder: (context, state) {
          var cubit= AppCubit.get(context);
          cubit.setIndex(index);
          //HomeProducts.fromMap(AppCubit.productList![0]).user!.userName
          return FittedBox(
              child: NewCardWidget(
                name: cubit.getName(),
                date:cubit.getPublishDate().toString(),
                isFav: fav_list.contains(DUMMY_DATA[index]) ? true : false,
                imgUrl: DUMMY_DATA[index].ImgUrl,
                title: cubit.getTitle(),
                price: cubit.getPrice().toDouble(),
                size: cubit.getSize(),
                index: index,
              ));
        },
        listener: (context, state) {},
      ),
    )
        : SizedBox(
      width: 500,
      height: 1,
    );
  }

  final Stream<List<PostModel>> _posts = Stream<List<PostModel>>.fromIterable(
    <List<PostModel>>[List.generate(DUMMY_DATA.length, (id) => DUMMY_DATA[id])],
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: _posts,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Text('Loading...',
                  style: TextStyle(color: Colors.deepPurple));
            default:
              if (!snapshot.hasData) {
                return const Text(
                  'No content',
                  style: TextStyle(color: Colors.deepPurple),
                );
              }
              // if (snapshot.hasData ) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: 2,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsScreen.routeName,
                          arguments: DUMMY_DATA[index].id,
                        );
                        id = DUMMY_DATA[index].id - 1;
                      },
                      child: widget.categories == 'all'
                          ? listFit(index, search: widget.search)
                          : DUMMY_DATA[index].gender == widget.categories
                          ? listFit(index)
                          : SizedBox(
                        width: 500,
                        height: .5,
                      ),
                    );
                  });
          }
        });
  }
}
