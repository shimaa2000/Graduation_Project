import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/add_post.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/screens/notifications_screen.dart';
import 'package:graduation_project/screens/profile.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());
  static AppCubit get(context)=> AppCubit();

  int currentIndex= 0;
  List <Widget> pages =[HomeScreen(), AddPost(), NotificationScreen(), Profile() ];
  List <String> titles = ['', '', 'Notifications', ''];

  void changeBottomNavItem (int index){
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }
}