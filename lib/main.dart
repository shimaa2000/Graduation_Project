import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/layout/topAdCard.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/network/cubit/blocObserver.dart';
import 'package:graduation_project/network/cubit/loginCubit.dart';
import 'package:graduation_project/network/cubit/signUpCubit.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/network/cubit/update_user_cubit.dart';
import 'package:graduation_project/network/cubit/user_data_cubit.dart';
import 'package:graduation_project/screens/account_verification.dart';
import 'package:graduation_project/screens/add%20post%202.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/confirmOrder.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/edit_post.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/favourite_Rent.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/login_screen.dart';
import 'package:graduation_project/screens/new_password_screeen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';
import 'package:graduation_project/screens/reset_password_screen.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/screens/splash_screen.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/screens/user_ads_screen.dart';
import 'package:graduation_project/shared/listView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(() {
    LoginCubit();
    SignUpCubit();
    AppCubit();
  }, blocObserver: MyBlocObserver());
  await CashHelper.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
//  late User user;
  // This widget is the root of your application.
  //final Widget start;
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeModeApp(),
        ),
        BlocProvider(create: (BuildContext context) => LoginCubit()),
        BlocProvider(create: (BuildContext context) => SignUpCubit()),
        BlocProvider(create: (BuildContext context) => UserDataCubit()),
        BlocProvider(create: (BuildContext context) => UpdateUserDataCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.deepPurple,
                accentColor: Color.fromRGBO(220, 129, 102, 0.9019607843137255),
                canvasColor: Color.fromRGBO(255, 255, 255, 1),
                textTheme: ThemeData.light().textTheme.copyWith(
                      bodyText1: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      bodyText2: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      headline2: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      headline1: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      headline3: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      headline4: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                      headline5: TextStyle(
                        color: Colors.black,
                        fontSize: 21,
                      ),
                    ),
                backgroundColor: Colors.white,
                elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.deepPurple),
                  ),
                )),
            darkTheme: ThemeData(backgroundColor: Colors.grey),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            routes: {
              '/': (context) => SplashScreen(),
              LoginScreen.routeName: (context) => LoginScreen(),
              ResetPasswordScreen.routeName: (context) => ResetPasswordScreen(),
              AccountVerification.routeName: (context) => AccountVerification(),
              NewPassword.routeName: (context) => NewPassword(),
              HomeScreen.routeName: (context) => HomeScreen(),
              DetailsScreen.routeName: (context) => DetailsScreen(),
              SignUp.routeName: (context) => SignUp(),
              Profile.routeName: (context) => Profile(),
              EditProfile.routeName: (context) => EditProfile(),
              StartApp.routeName: (context) => StartApp(),
              NotificationScreen.routeName: (context) => NotificationScreen(),
              AddPost.routeName: (context) => AddPost(),
              AddPost2.routeName: (context) => AddPost2(),
              EditPost.routeName: (context) => EditPost(),
              UserAds.routeName: (context) => UserAds(),
              ConfirmOrder.routeName: (context) => ConfirmOrder(),
              Favourite_Rent.routeName: (context) => Favourite_Rent(),
            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  static void navigateToReplace() {}
}
