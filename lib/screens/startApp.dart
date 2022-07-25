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
import 'package:graduation_project/screens/search_screen.dart';

class StartApp extends StatefulWidget {
  static const routeName = 'start_app';

  const StartApp({Key? key}) : super(key: key);

  @override
  _StartAppState createState() => _StartAppState();
}

class _StartAppState extends State<StartApp> {
  @override
  Widget build(BuildContext context) {

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
                statusBarIconBrightness:
                    isDark ? Brightness.light : Brightness.dark),
            title: Text(cubit.titles[cubit.currentIndex]),
            centerTitle: true,
            //  backgroundColor: Colors.deepPurple,
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  List<String> searchTerms = [];
                  List<String> idList = [];
                  cubit.getProductData();
                  for (int i = 0; i < cubit.product.length; i++) {
                    searchTerms.add(cubit.product[i].title!);
                    // print(searchTerms[i]);
                  }
                  for (int i = 0; i < cubit.product.length; i++) {
                    idList.add(cubit.ids[i]);
                    print(idList[i]);
                  }
                  showSearch(
                      context: context,
                      // delegate to customize the search bar
                      delegate: CustomSearchDelegate(searchTerms: searchTerms,idList: idList));
                },
                icon: Icon(Icons.search, color: isDark ? iDark : iLight),
              )
            ],
          ),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 0,
            backgroundColor: Theme.of(context).primaryColor,
            color: isDark ? iDark : iLight,
            activeColor: isDark ? iDark : iLight,
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
