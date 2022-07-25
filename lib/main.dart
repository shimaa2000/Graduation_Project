import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:graduation_project/network/cubit/favCubit.dart';
import 'package:graduation_project/network/cubit/layoutCubit.dart';
import 'package:graduation_project/screens/orderedScreen.dart';
import 'package:graduation_project/screens/paybalScreen.dart';
import 'package:graduation_project/themes.dart';
import 'package:graduation_project/endPoints.dart';
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
import 'package:graduation_project/screens/profile.dart';
import 'package:graduation_project/screens/reset_password_screen.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/screens/splash_screen.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/screens/user_ads_screen.dart';
import 'network/cubit/loginCubit.dart';
import 'network/cubit/resetCubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  BlocOverrides.runZoned(() {
    LoginCubit();
    SignUpCubit();
    AppCubit();
  }, blocObserver: MyBlocObserver());
  await CashHelper.init();
  await GetStorage.init();
  final String defaultLocale = Platform.localeName.substring(0, 2);
  defaultLang = defaultLocale;
  lang = GetStorage().read('lang') ?? (defaultLang == 'ar' ? 'ar' : 'en');
  isDark = GetStorage().read('isDarkMode')??false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()..changeModeApp(),
        ),
        BlocProvider(create: (BuildContext context) => SignUpCubit()),
        BlocProvider(create: (BuildContext context)  => UserDataCubit()),
        BlocProvider(create: (BuildContext context) => UpdateUserDataCubit()),
        BlocProvider(create: (BuildContext context) => LayoutCubit()),
        BlocProvider(create: (BuildContext context) => ResetCubit()),
        BlocProvider(create: (BuildContext context )=> FavCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            home: Directionality(
              textDirection:
                  languageFun(ar: TextDirection.rtl, en: TextDirection.ltr),
              child: SplashScreen(),
            ),
            locale:  Locale(languageFun(ar: 'ar', en: 'en')),
            darkTheme: dark,
            theme: light,

            themeMode: isDark? ThemeMode.light :ThemeMode.dark,
            routes: {
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
              AddPost.routeName: (context) => AddPost(),
              EditPost.routeName: (context) => EditPost(),
              UserAds.routeName: (context) => UserAds(),
              ConfirmOrder.routeName: (context) => ConfirmOrder(),
              Favourite_Rent.routeName: (context) => Favourite_Rent(),
              OrderedScreen.routeName: (context) => OrderedScreen(),
              PaybalScreen.routeName: (context) => PaybalScreen(),

            },
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }

  static void navigateToReplace() {}
}
