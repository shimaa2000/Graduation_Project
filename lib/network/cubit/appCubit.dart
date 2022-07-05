import 'package:bloc/bloc.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/models/products.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/repository/auth_repository.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    AddPost(),
    NotificationScreen(),
    Profile()
  ];
  List<String> titles = ['', '', 'Notifications', ''];
  List<TabItem> tabItems = [
    TabItem(
      icon: Icons.home,
    ),
    TabItem(
      icon: Icons.add,
    ),
    TabItem(
      icon: Icons.notifications,
    ),
    TabItem(
      icon: Icons.person,
    ),
  ];

  void changeBottomNavItem(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }
  bool isDark = false;

  void changeModeApp(){
    isDark = !isDark;
    CashHelper.saveData(key: 'isDark', value: isDark).then((value) => {
      emit(AppModeState())
    });

  }

  final authRepository = AuthRepository();
  String _title='';
  int _price=0 ;
  int _length=0;
  void getProductData() async {
    emit(AppLoadingHomeState());
    final response = await authRepository.homeDataFun();
    response.fold(
          (error) => emit(AppErrorHomeState(error)),
          (response) {
            HomeProducts value=HomeProducts.fromMap(response.homeProducts![0]);
        //setLength(value.length);
        setTitle(value.title!);
        setPrice(value.price);
        emit(AppSuccessHomeState(response));
      },
    );
  }
  void setLength(int length){
    _length = length;
  }
  getLength(){
    return _length;
  }
  void setTitle(String title){
    _title = title;
  }
  getTitle(){
    return _title;
  }
  void setPrice(int price){
    _price = price;
  }
  getPrice(){
    return _price;
  }
}


