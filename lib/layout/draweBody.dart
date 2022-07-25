import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/change_password.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/favourite_Rent.dart';
import 'package:graduation_project/screens/get_started.dart';
import 'package:graduation_project/screens/profile.dart';
import 'package:graduation_project/screens/user_ads_screen.dart';
import 'package:graduation_project/shared/languageAlert.dart';

import '../screens/orderedScreen.dart';

class DrawerBody extends StatefulWidget {
  const DrawerBody({Key? key}) : super(key: key);

  @override
  _DrawerBodyState createState() => _DrawerBodyState();
}

class _DrawerBodyState extends State<DrawerBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Color dark = Colors.white70;
        Color light = Colors.black87;
        Color iDark = Colors.white70;
        Color iLight = Colors.black87;
        return Container(
          color: Theme.of(context).backgroundColor,
          padding: EdgeInsets.only(top: 50),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, EditProfile.routeName);
                },
                child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: isDark ? iLight : iDark,
                    ),
                    title: Text('Edit Profile')),
              ),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              InkWell(
                onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword())),
                  child: ListTile(
                      leading: Icon(
                        Icons.password,
                        color: isDark ? iLight : iDark,
                      ),
                      title: Text('Change password'))),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Favourite_Rent.routeName);
                },
                child: ListTile(
                    leading: Icon(
                      Icons.favorite,
                      color: isDark ? iLight : iDark,
                    ),
                    title: Text('Favourite')),
              ),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, OrderedScreen.routeName);
                },
                child: ListTile(
                    leading: Icon(
                      Icons.border_all_sharp,
                      color: isDark ? iLight : iDark,
                    ),
                    title: Text('Rent')),
              ),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, UserAds.routeName);
                },
                child: ListTile(
                    leading: Icon(
                      Icons.ad_units_sharp,
                      color: isDark ? iLight : iDark,
                    ),
                    title: Text('User ads')),
              ),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              InkWell(
                child: ListTile(
                  leading: Icon(
                    Icons.lightbulb,
                    color: isDark ? iLight : iDark,
                  ),
                  title: Text('Dark Mode'),
                ),
                onTap: () {
                  AppCubit.get(context).changeModeApp();
                },
              ),
              Divider(
                thickness: 1.0,
                height: 1.0,
                color: isDark ? light : dark,
              ),
              // InkWell(
              //   child: ListTile(
              //     leading: Icon(Icons.language),
              //     title: Text('Language'),
              //   ),
              //   onTap: (){
              //     LanguageAlert.Future(context);
              //   },
              // ),

              InkWell(
                  onTap: () {
                    CashHelper.removeData(key: 'token').then((value) {
                      if (value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GetStarted()));
                      }
                    });
                  },
                  child: ListTile(
                    leading: Icon(
                      Icons.subdirectory_arrow_left_outlined,
                      color: isDark ? iLight : iDark,
                    ),
                    title: Text('SignOut'),
                  )),
            ],
          ),
        );
      },
    );
  }
}
