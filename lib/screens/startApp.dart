import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/layout/draweBody.dart';
import 'package:graduation_project/layout/search_classDelegate.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/activity_taps.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';
class StartApp extends StatefulWidget {
  static const routeName='start_app';
  const StartApp({Key? key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    final List<PostModel> list = List.generate(DUMMY_DATA.length, (id) => DUMMY_DATA[id]);

    return BlocProvider(create: (BuildContext context)=> AppCubit(),
    child: BlocConsumer<AppCubit , AppStates>(
      listener:(context , state){} ,
      builder: (context , state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex]),
            centerTitle: true,
            backgroundColor: Colors.deepPurple,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(list));
                },
                icon: Icon(Icons.search),
              )
            ],
          ),
          body: cubit.pages[cubit.currentIndex],
          bottomNavigationBar: ConvexAppBar(

            initialActiveIndex: 0,
            backgroundColor: Colors.deepPurple,
            onTap: (index) {
              cubit.changeBottomNavItem(index);
            },
            items: [
              TabItem(icon: Icons.home,),
              TabItem(icon: Icons.add,),
              TabItem(icon: Icons.notifications,),
              TabItem(icon: Icons.person,),
            ],
          ),
          drawer: Drawer(
            child: DrawerBody(),
          ),
        );
      },
    ),);
  }
}


