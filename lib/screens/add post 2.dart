import 'package:flutter/material.dart';
import 'package:graduation_project/screens/startApp.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/radioButton.dart';
import 'package:intl/intl.dart';

class AddPost2 extends StatefulWidget {
  static const routeName = 'add_post2';
  const AddPost2({Key? key}) : super(key: key);

  @override
  _AddPost2State createState() => _AddPost2State();
}

class _AddPost2State extends State<AddPost2> {
  final forHeight = TextEditingController();
  final forWeight = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  String genderType = 'male';
  String postType = 'rent';
  String donationV = 'yes';
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
              child: Text(
                'Enter Your Product data',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(double.infinity, 50),
                            primary: Colors.white,elevation: 1.0),
                        onPressed: () {
                          // PostAlerts.photoDialog(context,);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.upload_rounded,color: Colors.black54,),
                            SizedBox(width: 100.0,),
                            Text('Upload',style: TextStyle(color: Colors.black54),)
                          ],
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text("for Height",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("for Weight",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("Available form",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("Price",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("Gender",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("Post for",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 27,
                    ),
                    Text("Donation",
                        style: Theme.of(context).textTheme.headline5),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 50,
                      child: BoxTextField(
                          controller: forHeight,
                        validatorText: 'please enter height',
                          icon: Icon(
                            Icons.height,
                          ),
                          onTap: () {}),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 50,
                      child: BoxTextField(
                          controller: forWeight,
                          validatorText: 'please choose weight',
                          icon: Icon(
                            Icons.monitor_weight,
                          ),
                          onTap: () {}),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 50,
                      child: BoxTextField(
                          controller: dateController,
                          autofocus: true,
                          keyboardType: TextInputType.datetime,
                          onTap: () {
                            DatePicker.selectDate(context).then(
                                  (value) => dateController.text =
                                  DateFormat.yMMMd().format(value!),
                            );
                          },
                          icon: Icon(
                            Icons.date_range,
                          ),
                          validatorText: 'please enter date',),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.8,
                      height: 50,
                      child: BoxTextField(
                          controller: priceController,
                          keyboardType: TextInputType.number,
                          validatorText: 'please enter price',
                          icon: Icon(
                            Icons.attach_money,
                          ),
                          onTap: () {}),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      child: RadioButtonClass(
                        title1: 'male',
                        title2: 'female',
                        value1: 'male',
                        value2: 'female',
                        groupValue: genderType,
                        onChange1: (value) {
                          setState(() {
                            genderType = 'male';
                          });},
                        onChange2: (value) {
                          setState(() {
                            genderType = 'female';
                          });
                        }, sizedHeight: 0,
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Container(
                      height: 40,
                      child: RadioButtonClass(
                        title1: 'Rent',
                        title2: 'Sale',
                        value1: 'rent',
                        value2: 'sale',
                        groupValue: postType,
                        onChange1: (value) {
                          setState(() {
                            postType = 'rent' ;
                          });

                        },
                        onChange2: (value) {
                          setState(() {
                            postType = 'sale';
                          });
                        }, sizedHeight: 0,
                      ),
                    ),
                    SizedBox(
                      height: 7.5,
                    ),
                    Container(
                      height: 40,
                      child: RadioButtonClass(
                        title1: 'Yes',
                        title2: 'No',
                        value1: 'yes',
                        value2: 'no',
                        groupValue: donationV,
                        onChange1: (value) {
                          setState(() {
                            donationV = 'yes';
                          });

                        },
                        onChange2: (value) {
                          setState(() {
                            donationV = 'no';
                          });
                        }, sizedHeight: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: DefaultButton(
                  onPressedFun: () {
                    Navigator.pushNamed(context, StartApp.routeName);
                  },
                  text: 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
