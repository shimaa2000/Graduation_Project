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
          return Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Subtotal',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  Text(
                    'EGP ${LayoutCubit().price}',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
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
                    style: TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  Text(
                    'EGP ${LayoutCubit().delivery}',
                    style: TextStyle(fontSize: 16, color: Colors.black54),
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
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'EGP ${LayoutCubit().getTotal()}',
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.deepPurple,
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
