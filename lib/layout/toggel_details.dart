import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/services/local/casheHelper.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/screens/confirmOrder.dart';
import 'package:graduation_project/screens/edit_post.dart';
import 'package:graduation_project/shared/circular_container.dart';
import 'package:graduation_project/shared/defaultButton.dart';

import '../network/cubit/appCubit.dart';
import '../network/cubit/appStates.dart';
import '../screens/homeScreen.dart';
import '../shared/boxtextfield.dart';

class ToggleDetails {
  static Widget item(
    Function function,
    BuildContext ctx,
    String type,
    String size,
    String gender,
    String date,
  ) {
    return BlocProvider(
        create: (context) => AppCubit()..getProductDetails(id!),
        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit =AppCubit.get(context);
              return Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Type : ',
                              style: Theme.of(ctx).textTheme.headline4,
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Size : ',
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Gender : ',
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Published : ',
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              type,
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              size,
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              gender,
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              date,
                              style: Theme.of(ctx).textTheme.headline4,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    DefaultButton(
                        onPressedFun: () {
                          cubit.getUserId()==CashHelper.getData(key: 'id')?Navigator.pushNamed(ctx, EditPost.routeName) :Navigator.pushNamed(ctx, ConfirmOrder.routeName);
                        },
                        txtColor: isDark ? Colors.white : Colors.black,
                        text: cubit.getUserId()==CashHelper.getData(key: 'id')?'Edit' :'Order'),
                  ],
                ),
              );
            }));
  }

  static Widget detail(
      BuildContext context, String description, String height, String width) {
    Color iLight = Colors.black54;
    Color iDark = Colors.white70;
    return CircularContainer(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height / 2,
      padding: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 15.0,
          ),
          TextField(
            readOnly: true,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: isDark ? iLight : iDark))),
            controller: TextEditingController(
              text: description,
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Text(
            'Detail Size',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 15.0,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Height',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3.5,
              ),
              Text(
                height,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Weight',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Text(
                width,
                style: Theme.of(context).textTheme.headline5,
              )
            ],
          ),
        ],
      ),
    );
  }
  //
  static bool content = false;
  static final reviewController = TextEditingController();
  static Widget review(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: content ? 30.0 : 50.0,
        ),
        Center(
            child: content
                ? CircularContainer(
              width: double.infinity,
              height: 80,
              padding: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'hadeer moustafa',
                    style: TextStyle(
                        color: isDark ? Colors.black : Colors.white),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    reviewController.text,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            )
                : Text(
              'No Reviews yet...',
              style: Theme.of(context).textTheme.bodyText1,
            )),
        Padding(
          padding: const EdgeInsets.only(top: 60.0, right: 20.0),
          child: Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(

                        backgroundColor: isDark? Colors.white: Colors.black,
                        title: Text(
                          'New Review',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        content: Container(
                          width: double.infinity,
                          height: 180,
                          child: Column(
                            children: [
                              BoxTextField(
                                padding:0,
                                margin: 0,
                                onTap: () {},
                                icon: Icon(Icons.reviews, color:isDark? Colors.black: Colors.white ,),
                                controller: reviewController,
                                validatorText: 'enter your review',
                              ),
                              SizedBox(height: 40.0,),
                              Row(children: [
                                TextButton(
                                  onPressed: (){Navigator.of(context).pop();},
                                  child: Text(
                                    'Cancel'
                                    ,style: TextStyle(
                                      color: isDark ? Colors.black : Colors.white),
                                  ),style: TextButton.styleFrom(
                                  side: BorderSide(
                                      color: Theme.of(context).primaryColor,
                                      width: 1,
                                      style: BorderStyle.solid),
                                  minimumSize: Size(130, 50),
                                  textStyle: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 20),
                                  backgroundColor:
                                  isDark ? Colors.white : Colors.black,
                                  shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0),
                                  ),
                                ),),
                                SizedBox(width: 15.0,),
                                DefaultButton(onPressedFun: (){
                                  content= true;
                                  Navigator.of(context).pop();
                                }, text: ('Add'), txtColor: isDark? Colors.white: Colors.black,)
                              ],)
                            ],
                          ),
                        ),
                      ));
                },
                child: Icon(
                  Icons.add,
                  color: isDark ? Colors.white : Colors.black,
                ),
                backgroundColor: Theme.of(context).primaryColor,
              )),
        )
      ],
    );
  }
}

