import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/network/cubit/layoutStates.dart';
import 'package:graduation_project/screens/homeScreen.dart';
import 'package:graduation_project/shared/defaultButton.dart';

// for all classes variables
class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialStates());

  static LayoutCubit get(context) => BlocProvider.of(context);

  // for bottom card
  String btmCardImgUrl = 'images/photourl.jpg';
  String btmCardTitle = 'Gold Dress';
  int btmCardPrice = 360;
  String btmCardDialog =
      'Simple gold dress with extension and hand embroidery belt in the same colour.';

// for edit profile content
  var editProfileUserNameController = TextEditingController();
  var editProfileEmailController = TextEditingController();
  var editProfilePasswordController = TextEditingController();
  var editProfileNewPasswordController = TextEditingController();
  var editProfileAddressController = TextEditingController();
  var editProfileConfirmPasswordController = TextEditingController();
  var editProfileFormKey = GlobalKey<FormState>();

// for radio card
  String groupValueAddress = 'current';
  String groupValueContact = '01009525463';
  String groupValuePay = 'cash';
  String valueAdd1 = 'current';
  String valueAdd2 = 'new';
  String valueCon1 = '01009525463';
  String valueCon2 = 'newC';
  String cashValuePay1 = 'cash';
  String onlineValuePay2 = 'online';

//for new password screen
  String passEmojiUrl = '';
  String passSmallText = 'Reset';
  String passBigText = 'Password';
  String passFistLineAfterEmoji = 'You can have a new password';
  String passSecondLine = 'for your account now!';

// in container class
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();

  //for reset pass
  final resetUserController = TextEditingController();

  String resetEmojiUrl = 'images/sad.png';
  String resetSmallText = 'Forget';
  String resetBigText = 'Password?';
  String resetFirstLineAfterEmoji =
      'Enter your email associated with this account ';
  String resetSecondLine = 'for password recovery!';

  //for add post content1
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  final  TextEditingController colorController = TextEditingController();
  final TextEditingController sizeController = TextEditingController();
  final TextEditingController typeController = TextEditingController();

  // for prices in payment
  double price = DUMMY_DATA[id].price;
  double delivery = 50;
  double getTotal(){
    double total = price + delivery;
    return total;
  }

}