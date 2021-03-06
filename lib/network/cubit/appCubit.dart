import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
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
  List<Widget> pages = [HomeScreen(), AddPost(), Profile()];
  List<String> titles = ['', '', ''];
  List<TabItem> tabItems = [
    TabItem(
      icon: Icons.home,
    ),
    TabItem(
      icon: Icons.add,
    ),
    TabItem(
      icon: Icons.person,
    ),
  ];

  void changeBottomNavItem(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavStates());
  }

  void changeModeApp() {
    isDark = !isDark;
    CashHelper.saveData(key: 'isDark', value: isDark).then((value) => {emit(AppModeState())});
  }

  void changeAppLanguage(String value) {
    lang = value;
    CashHelper.saveData(key: 'lang', value: value).then((v) {
      // Get.updateLocale(Locale(value));
      //debugPrint(lang);
    });
    emit(AppChangeLanguageState());
  }

  final authRepository = AuthRepository();
  String _title = '';
  String _name = '';
  int _price = 0;
  String? _imgUrl;
  List<String> pImages=[];
  int _length = 0;
  int _index = 0;
  String _publishDate = '';
  String _size = '';
  Product? value;
  static List<dynamic>? productList;

  void getProductData() async {
    emit(AppLoadingHomeState());
    final response = await authRepository.homeDataFun();
    response.fold(
      (error) => emit(AppErrorHomeState(error)),
      (response) {
        value = Product.fromMap(response.homeProduct![getIndex()]);
        setLength(response.homeProduct!.length);
        setTitle(value!.title!);
        setPrice(value!.price!);
        for(int i=0;i<value!.images!.length;i++){
          pImages.add('$BASEURL/${value!.images![0]}');
        }
         setImgUrl('${pImages[0]}');
        setSize(value!.size!.name!);
        setName(value!.user!.userName);
        setLength(response.homeProduct!.length);
        emit(AppSuccessHomeState(response));
      },
    );
  }

  void setLength(int length) {
    _length = length;
  }

  getLength() {
    return _length;
  }

  void setTitle(String title) {
    _title = title;
  }

  getTitle() {
    return _title;
  }
  void setImgUrl(String url) {
    _imgUrl = url;
  }

  getImgUrl() {
    return _imgUrl;
  }

  void setPrice(int price) {
    _price = price;
  }

  getPrice() {
    return _price;
  }

  void setPublishDate(String publishDate) {
    _publishDate = publishDate;
  }

  getPublishDate() {
    return _publishDate;
  }

  void setSize(String size) {
    _size = size;
  }

  getSize() {
    return _size;
  }

  void setName(String name) {
    _name = name;
  }

  getName() {
    return _name;
  }

  void setIndex(int index) {
    _index = index;
  }

  getIndex() {
    return _index;
  }
}
