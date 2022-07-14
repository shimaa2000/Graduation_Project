// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:graduation_project/network/cubit/appCubit.dart';
// import 'package:graduation_project/network/cubit/appStates.dart';
// import 'package:graduation_project/screens/homeScreen.dart';
// import 'package:graduation_project/shared/defaultButton.dart';
//
// enum lang { en, ar }
//
// class LanguageAlert {
//   static Future<Action>(
//     BuildContext context,
//   ) async {
//     final action = await showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (BuildContext context) {
//           return BlocConsumer<AppCubit , AppStates>(
//               builder: (context, state) {
//                 return Center(
//                   child: AlertDialog(
//                     contentPadding:
//                         EdgeInsets.symmetric(vertical: 15.0, horizontal: 50.0),
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(20))),
//                     content: Text(
//                       'Choose Language',
//                       style: TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                     actions: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           DefaultButton(
//                             text: 'Arabic',
//                             onPressedFun: () {
//                               AppCubit.get(context)
//                                   .changeAppLanguage(lang.ar.toString());
//                             },
//                           ),
//                           SizedBox(
//                             width: 15.0,
//                           ),
//                           DefaultButton(
//                             text: 'English',
//                             btnColor: Colors.white,
//                             txtColor: Colors.deepPurple,
//                             onPressedFun: () {
//                               AppCubit.get(context)
//                                   .changeAppLanguage(lang.en.toString());
//                             },
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               listener: (context, state) {});
//         });
//   }
// }
