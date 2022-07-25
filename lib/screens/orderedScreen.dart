import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/new_card_widget.dart';
import 'package:graduation_project/models/order_model.dart';
import 'package:graduation_project/network/cubit/orderedStates.dart';
import 'package:graduation_project/network/cubit/user_data_cubit.dart';
import 'package:graduation_project/network/cubit/user_data_states.dart';

import '../network/cubit/orderedCubit.dart';


class OrderedScreen extends StatelessWidget {
  static const routeName = 'ordered_screen';

  const OrderedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) => OrderedCubit()..getOrderedData(),
        child: BlocConsumer<OrderedCubit, OrderedStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = OrderedCubit.get(context);
              return ConditionalBuilderRec(
                condition: state is! OrderedLoadingStates,
                builder: (context) => cubit.products.length != 0
                    ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.getLength(),
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    cubit.setIndex(index);
                    return Column(
                      children: [
                        FittedBox(
                          child: NewCardWidget(
                              name: cubit.getTitle(),
                              date: '',
                              imgUrl: '${cubit.getImage()}',
                              title: 'Total : ${cubit.getTotalPrice()}',
                              price: cubit.getTotalPrice(),
                              size: '',
                              index: index),
                        ),
                      ],
                    );
                  },
                )
                    : Center(
                  child: Text(
                    'no ordered products yet, go ahead and order some...',
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
