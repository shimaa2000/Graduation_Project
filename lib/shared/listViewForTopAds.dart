import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/topAdCard.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';

class ListViewForTopAds extends StatelessWidget {
  const ListViewForTopAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return SizedBox(
            height: 220.0,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return TopAdCard(
                  title: 'xxx',
                  price: 0,
                  imgUrl: 'https://media.istockphoto.com/vectors/dress-icon-vector-id507081676?k=20&m=507081676&s=612x612&w=0&h=k1p9VA6YqPIwMEyj290EMrI1EtHIz4EK8yLf9YV7_DM=',
                );
              },
            ),
          );
        }
  }
