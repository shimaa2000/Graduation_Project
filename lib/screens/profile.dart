import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/profile_container.dart';
import 'package:graduation_project/network/cubit/user_data_cubit.dart';
import 'package:graduation_project/network/cubit/user_data_states.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/user_ads_screen.dart';
import 'package:graduation_project/shared/gird_image.dart';
import 'details_screen.dart';

class Profile extends StatelessWidget {
  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => UserDataCubit()..getUserData(),
      child: BlocConsumer<UserDataCubit, UserDataStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = UserDataCubit.get(context);
            return Scaffold(
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProfileContainer(
                        userName: cubit.getUserName(),
                        userAddress: cubit.getUserAddress(),
                        imgUrl: cubit.getUserImage() ??
                            'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg',
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        'User Ads',
                        style: TextStyle(
                          color: isDark ? Colors.black : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 26.0,
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      ConditionalBuilderRec(
                        condition: state is! UserDataLoadingState,
                        builder: (context) => Container(
                          width: 270,
                          height: 300,
                          child: cubit.productImages.length != 0
                              ? PhotoGrid(
                                  imageUrls: cubit.productImages,
                                  onImageClicked: (i) {
                                    Navigator.of(context).pushNamed(
                                      DetailsScreen.routeName,
                                      arguments: i + 1,
                                    );
                                    numId = i;
                                  },
                                  onExpandClicked: () {
                                    Navigator.pushNamed(
                                        context, UserAds.routeName);
                                  },
                                  maxImages:
                                      cubit.length < 4 ? cubit.length : 4,
                                )
                              : Text(
                                  'no product available, please add some...',
                                  style: Theme.of(context).textTheme.bodyText1,
                                  textAlign: TextAlign.center,
                                ),
                        ),
                        fallback: (context) => Center(
                          child: CircularProgressIndicator(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
