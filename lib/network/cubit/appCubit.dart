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
    CashHelper.saveData(key: 'isDark', value: isDark)
        .then((value) => {emit(AppModeState())});
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
  List<String> pImages = [];
  int _length = 0;
  String? _id;
  int _index = 0;
  String _publishDate = '';
  String _size = '';
  Product? value;
  String? _description;
  int? _height;
  String? uId;
  int? _width;
  String? _type;
  List<Product> product = [];
  List<String> ids = [];
  String? _gender;
  bool fav = false;
  List<Product> maleList = [];
  List<Product> femaleList = [];


  void getProductData() async {
    emit(AppLoadingHomeState());
    final response = await authRepository.homeDataFun();
    response.fold(
      (error) => emit(AppErrorHomeState(error)),
      (response) {
        for (int i = 0; i < response.homeProduct!.length; i++) {
          product.add(Product.fromMap(response.homeProduct![i]));
          ids.add(product[i].id!);
        }
        value = Product.fromMap(response.homeProduct![getIndex()]);
        setLength(response.homeProduct!.length);
        setGender(value!.gender!);
        fav = value!.fav!;
        for (int i = 0; i < response.homeProduct!.length; i++) {
          if (Product.fromMap(response.homeProduct![i]).gender == 'male')
            maleList.add(Product.fromMap(response.homeProduct![i]));
        }
        for (int i = 0; i < response.homeProduct!.length; i++) {
          if (Product.fromMap(response.homeProduct![i]).gender == 'female')
            femaleList.add(Product.fromMap(response.homeProduct![i]));
        }
        setTitle(value!.title!);
        setPrice(value!.price!);
        setId(value!.id!);
        for (int i = 0; i < value!.images!.length; i++) {
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

  void getProductDetails(String id) async {
    emit(AppLoadingHomeState());
    final response = await authRepository.detailsFun(id);
    response.fold(
      (error) => emit(AppErrorHomeState(error)),
      (response) {
        setTitle(response.title!);
        setPrice(response.price!);
        setUserId(response.user!.id!);
        setDescription(response.description!);
        setImgUrl('$BASEURL/${response.images![0]}');
        setSize(response.size!.name!);
        setName(response.user!.userName);
        setWidth(response.size!.width!);
        setType(response.type!);
        //setHeight(response.size!.height!);
        setPublishDate(response.publishDate!);
        emit(DetailsSuccessState(response));
      },
    );
  }

  void setLength(int length) {
    _length = length;
  }

  getLength() {
    return _length;
  }

  void setUserId(String id) {
    uId = id;
  }

  getUserId() {
    return uId;
  }

  void setGender(String gender) {
    _gender = gender;
  }

  getGender() {
    return _gender;
  }

  void setHeight(int height) {
    _height = height;
  }

  getHeight() {
    return _height;
  }

  void setWidth(int width) {
    _width = width;
  }

  getWidth() {
    return _width;
  }

  void setTitle(String title) {
    _title = title;
  }

  getTitle() {
    return _title;
  }

  void setType(String type) {
    _type = type;
  }

  getType() {
    return _type;
  }

  void setId(String id) {
    _id = id;
  }

  getId() {
    return _id;
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

  void setDescription(String description) {
    _description = description;
  }

  getDescription() {
    return _description;
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

  final Title = TextEditingController();
  final Description = TextEditingController();
  final Price = TextEditingController();

//edit post
  void editPostFun(String id) async {
    emit(AppLoadingHomeState());
    final response = await authRepository.updatePostData({
      'title': Title.text,
      'description': Description.text,
      'price': Price.text
    }, id);
    response.fold(
      (error) => emit(AppErrorHomeState(error)),
      (response) {
        emit(SuccessHomeState(response));
      },
    );
  }
}
