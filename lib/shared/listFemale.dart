import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';

import '../layout/new_card_widget.dart';
import '../network/cubit/appCubit.dart';
import '../network/cubit/appStates.dart';
import '../screens/details_screen.dart';
import '../screens/homeScreen.dart';
class ListFemale extends StatelessWidget {
  const ListFemale({Key? key}) : super(key: key);

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
                  itemCount: listCubit.femaleList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          DetailsScreen.routeName,
                        );
                        listCubit.setIndex(index);
                        print(listCubit.getIndex());
                        id=listCubit.ids[index];
                      },
                      child: FittedBox(
                          child: NewCardWidget(
                            name: listCubit.femaleList[index].user!.userName,
                            date: '',
                            isFav: listCubit.femaleList[index].fav!,
                            imgUrl: '$BASEURL/${listCubit.femaleList[index].images![0]}' ,
                            title:listCubit.femaleList[index].title!,
                            price: listCubit.femaleList[index].price!,
                            size: listCubit.femaleList[index].size!.name!,
                            index: index,
                          )),

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
