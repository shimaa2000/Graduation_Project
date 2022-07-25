import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/detials_widget.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'homeScreen.dart';

class DetailsScreen extends StatelessWidget {
  static const routeName = 'details_screen';

  const DetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getProductDetails(id!),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return  ConditionalBuilderRec(
              condition: state is! AppLoadingHomeState,
              builder: (context) =>DetailsWidget(
              type: cubit.getType(),
              size: cubit.getSize(),
              title: cubit.getTitle(),
              price: cubit.getPrice().toString(),
              gender: '',
              date: cubit.getPublishDate(),
              description: cubit.getDescription(),
              height: cubit.getHeight().toString(),
              width: cubit.getWidth().toString(),
              imageUrl: cubit.getImgUrl()),
            fallback: (context) => Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            ),
          );
        },
      ),
    );
  }
}
