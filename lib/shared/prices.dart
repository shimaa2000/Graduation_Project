import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/screens/homeScreen.dart';

class Prices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        builder: (context, state) {
          var layout = LayoutCubit.get(context);
          return Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'EGP ${layout.price}',
                    style:Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery Fee',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'EGP ${layout.delivery}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'EGP ${layout.getTotal()}',
                    style: TextStyle(
                        fontSize: 22,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          );
        },
        listener: (context, state) {});
  }
}
