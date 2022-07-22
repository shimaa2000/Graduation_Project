import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/screens/confirmOrder.dart';
import 'package:graduation_project/shared/bottomForDetails.dart';
import 'package:graduation_project/shared/circular_container.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:path/path.dart';

class ToggleDetails {
  static Widget item(
    Function function,
    BuildContext ctx,
    String type,
    String size,
    String gender,
    String date,
  ) {
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
                Navigator.pushNamed(ctx, ConfirmOrder.routeName);
              },
              txtColor: isDark? Colors.white: Colors.black,
              text: 'Order'),
        ],
      ),
    );
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
          SizedBox(height: 15.0,),
          TextField(
            readOnly: true,
            style: Theme.of(context).textTheme.headline5,
            maxLines: 3,
            enabled: false,
            decoration: InputDecoration(
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: isDark? iLight: iDark))
            ),
            controller: TextEditingController(
              text: description,
            ),
          ),
          SizedBox(height: 15.0,),
          Text(
            'Detail Size',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 15.0,),
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

  static Widget review(BuildContext context) {
    return Center(
        child: Text(
      'No Reviews yet...',
      style: Theme.of(context).textTheme.bodyText1,
    ));
  }
}
