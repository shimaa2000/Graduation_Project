import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/network/cubit/user_data_cubit.dart';
import 'package:graduation_project/network/cubit/user_data_states.dart';

class UserAds extends StatelessWidget {
  static const routeName = 'user_ads';

  const UserAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => UserDataCubit()..getUserData(),
        child: BlocConsumer<UserDataCubit, UserDataStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = UserDataCubit.get(context);
              return ConditionalBuilderRec(
                  condition: state is! UserDataLoadingState,
                  builder: (context) => cubit.products.length != 0
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: cubit.products.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                               FittedBox(
                                child: NewCardWidget(
                                    name: 'You',
                                    date: '',
                                    imgUrl: '$BASEURL/${cubit.products[index].images![0]}',
                                    title: cubit.products[index].title!,
                                    price: cubit.products[index].price!,
                                    size: '',
                                    index: index),
                              ),
                            ],
                          );
                        },
                      )
                    : Center(
                      child: Text(
                          'no product available, please add some...',
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),),
                fallback: (context) => Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
