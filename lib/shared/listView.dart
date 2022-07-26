import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:conditional_builder_rec/conditional_builder_rec.dart';
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
  Widget listFit(int index, {String search = '', String searchList=''}) {
    return  BlocProvider(
            create: (BuildContext context) => AppCubit()..getProductData(),
            child: BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                var cubit = AppCubit.get(context);
                cubit.setIndex(index);
                //HomeProducts.fromMap(AppCubit.productList![0]).user!.userName
                return FittedBox(
                    child: NewCardWidget(
                  name: cubit.getName(),
                  date: cubit.getPublishDate().toString(),
                  isFav: cubit.fav,
                  imgUrl: cubit.getImgUrl() ??
                      'https://media.istockphoto.com/vectors/dress-icon-vector-id507081676?k=20&m=507081676&s=612x612&w=0&h=k1p9VA6YqPIwMEyj290EMrI1EtHIz4EK8yLf9YV7_DM=',
                  title: cubit.getTitle(),
                  price: cubit.getPrice(),
                  size: cubit.getSize(),
                  index: index,
                ));
              },
              listener: (context, state) {},
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..getProductData(),
        child: BlocConsumer<AppCubit, AppStates>(
          builder: (context, state) {
            var listCubit = AppCubit.get(context);
            return ConditionalBuilderRec(
              condition: state is! AppLoadingHomeState,
              builder: (context) => ListView.builder(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemCount: listCubit.getLength(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsScreen.routeName,
                          arguments: DUMMY_DATA[index].id,
                        );
                        listCubit.setIndex(index);
                        print(listCubit.getIndex());
                        numId = DUMMY_DATA[index].id - 1;
                        id=listCubit.ids[index];
                      },
                      child: listFit(index, search: widget.search,searchList: listCubit.getTitle())

                    );
                  }),
              fallback: (context) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CircularProgressIndicator(
                    color: Colors.deepPurple,
                  ),
                ),
              ),
            );
          },
          listener: (context, state) {},
        ));
  }
}
