import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/layout/draweBody.dart';
import 'package:graduation_project/layout/search_classDelegate.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';

class StartApp extends StatefulWidget {
  static const routeName = 'start_app';
  const StartApp({Key? key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {
    final List<PostModel> list =
        List.generate(DUMMY_DATA.length, (id) => DUMMY_DATA[id]);

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        Color iLight = Colors.black87;
        Color iDark = Colors.white;
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: isDark ? iDark : iLight),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
                  statusBarIconBrightness: isDark? Brightness.light: Brightness.dark
            ),
            title: Text(cubit.titles[cubit.currentIndex]),
            centerTitle: true,
          //  backgroundColor: Colors.deepPurple,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: Search(list));
                },
                icon: Icon(Icons.search,   color: isDark ? iDark : iLight),
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 0,
            backgroundColor: Theme.of(context).primaryColor,
            color: isDark ? iDark : iLight,
            activeColor:isDark ? iDark : iLight ,
            onTap: (index) {
              cubit.changeBottomNavItem(index);
              print(cubit.currentIndex);
              print(cubit.pages[cubit.currentIndex].toString());
            },
            items: cubit.tabItems,
          ),
          body: cubit.pages[cubit.currentIndex],
          drawer: Drawer(
            child: DrawerBody(),
          ),
        );
      },
    );
  }
}
