
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:intl/intl.dart';

class AddPost2 extends StatefulWidget {
  static const routeName='add_post2';
  const AddPost2({Key? key}) : super(key: key);

  @override
  _AddPost2State createState() => _AddPost2State();
}
enum gender{male ,female}
enum donation{Yes ,No}
class _AddPost2State extends State<AddPost2> {
  final forHeight = TextEditingController();
  final forWeight = TextEditingController();
  final dateController = TextEditingController();
  final priceController = TextEditingController();
  gender? genderType=gender.male;donation? donationV=donation.No;
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
                    Text("forHeight", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("forWeight", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("Available form",
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("Price", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("Gender", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("Post for", style: Theme.of(context).textTheme.headline5),
                    SizedBox(height: 27,),
                    Text("Donation", style: Theme.of(context).textTheme.headline5),

                  ],
                ),

                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: BoxTextField(
                          controller: forHeight,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Enter The Height";
                            }
                          },
                          hint: "",
                          icon: Icon(
                            Icons.height,
                          ),
                          label: '',
                          onTap: () {}),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: BoxTextField(
                          controller: forWeight,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Enter The Weight";
                            }
                          },
                          hint: "",
                          icon: Icon(
                            Icons.monitor_weight,
                          ),
                          label: '',
                          onTap: () {}),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: BoxTextField(
                          controller: forWeight,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Enter The Weight";
                            }
                          },
                          hint: "",
                          icon: Icon(
                            Icons.monitor_weight,
                          ),
                          label: '',
                          onTap: () {}),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: BoxTextField(
                          controller: dateController ,
                          autofocus: true,
                          label: "" ,
                          keyboardType: TextInputType.datetime ,
                          hint: ' ',
                          onTap: (){
                            showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.utc(2021,12,31),
                            ).then((value) =>
                            dateController.text = DateFormat.yMMMd().format(value!),);
                          },
                          icon: Icon(Icons.date_range,),
                          validator: (value) {
                            if (value ==null || value.isEmpty) {
                              return 'please enter your date';
                            }
                            return null;
                          }
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      height: 50,
                      child: BoxTextField(
                          controller: priceController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return " Enter The price";
                            }
                          },
                          hint: "",
                          icon: Icon(
                            Icons.attach_money,
                          ),
                          label: '',
                          onTap: () {}),
                    ),


                    Row(children: [


                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                child: ListTile(
                                  leading: Radio(
                                    value: gender.male,
                                    groupValue: genderType,
                                    onChanged: ( gender? value) { setState(() {
                                      genderType = value ;
                                    }); },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('Male',style: Theme.of(context).textTheme.headline5,),
                            ],
                          ),
                          SizedBox(width: 30,),

                          Row(
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    genderType = gender.male;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  child: ListTile(
                                    leading: Radio(
                                      value: gender.female,
                                      groupValue: genderType,
                                      onChanged: ( gender? value) { setState(() {
                                        genderType = value;
                                      }); },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('Female',style: Theme.of(context).textTheme.headline5,),
                            ],
                          ),
                        ],
                      )
                    ],),
                    Row(children: [


                      Row(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 20,
                                child: ListTile(
                                  leading: Radio(
                                    value: donation.No,
                                    groupValue: donationV,
                                    onChanged: ( donation? value) { setState(() {
                                      donationV = value ;
                                    }); },
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('No',style: Theme.of(context).textTheme.headline5,),
                            ],
                          ),
                          SizedBox(width: 30,),

                          Row(
                            textBaseline: TextBaseline.ideographic,
                            children: [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    donationV = donation.No;
                                  });
                                },
                                child: Container(
                                  width: 25,
                                  child: ListTile(
                                    leading: Radio(
                                      value: donation.Yes,
                                      groupValue: donationV,
                                      onChanged: ( donation? value) { setState(() {
                                        donationV = value;
                                      }); },
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Text('Yes',style: Theme.of(context).textTheme.headline5,),
                            ],
                          ),
                        ],
                      )
                    ],),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: DefaultButton(onPressedFun: (){
                Navigator.pushNamed(context, AddPost2.routeName);
              }, text: 'Next'),
            ),
          ],
        ),
      ),
    );
  }
}
