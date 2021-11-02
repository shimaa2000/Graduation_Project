import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class ToggleDetails {
  static Widget item(
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
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Type : ',
                    style: Theme.of(ctx).textTheme.headline3,
                    textAlign: TextAlign.start,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Size : ',
                    style: Theme.of(ctx).textTheme.headline3,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Gender : ',
                    style: Theme.of(ctx).textTheme.headline3,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    'Published : ',
                    style: Theme.of(ctx).textTheme.headline3,
                  ),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(ctx).size.width / 2.5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: Theme.of(ctx).textTheme.headline5,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    size,
                    style: Theme.of(ctx).textTheme.headline5,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    gender,
                    style: Theme.of(ctx).textTheme.headline5,
                  ),
                  SizedBox(height: 10,),
                  Text(
                    date,
                    style: Theme.of(ctx).textTheme.headline5,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 30,),
          DefaultButton(onPressedFun: (){}, text: 'Order'),
        ],
      ),
    );
  }

  static Widget detail(BuildContext context ,String description,String height,String width) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),

      decoration:
      BoxDecoration(border: Border.all(width: 2.5,color: Colors.deepPurple),borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.start,
          ),
          TextField(
            readOnly: true,
            maxLines: 3,
            controller: TextEditingController(
              text: description,
            ),
          ),
          Text(
            'Detail Size',
            style: Theme.of(context).textTheme.headline3,
            textAlign: TextAlign.start,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Height',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Text(height,style: Theme.of(context).textTheme.bodyText1,)
          ],),
          SizedBox(
            height: 10,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                'Weight',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Text(width,style: Theme.of(context).textTheme.bodyText1,)
            ],),
        ],
      ),
    );
  }

  static Widget review(BuildContext context) {
    return Center(child: Text('No Reviews yet .',style: Theme.of(context).textTheme.headline3,));
  }
}
