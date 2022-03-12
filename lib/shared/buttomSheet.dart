import 'package:flutter/material.dart';
import 'package:graduation_project/screens/search_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/datePicker.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/dropDown.dart';
import 'package:graduation_project/shared/radioForBottomsheet.dart';

void bottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context1) {
        String dropdownValueColor = 'Red';
        List<String> colorList = ['Red', 'Blue', 'Gray'];
        String dropdownValueType = 'Bodycon';
        List<String> typeList = ['Bodycon', 'A-line', 'Paesant'];
        double price = 250;
        var dateController = TextEditingController();
        return Container(
            height: 900,
            width: MediaQuery.of(context).size.width,
            child: Container(
                height: 950,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.filter_list_rounded,
                            size: 45,
                            color: Colors.deepPurple,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            'Filter',
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [Column(textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              'For',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Colour',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Type',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Price',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                            SizedBox(height: 20,),
                            Text(
                              'Date',
                              style: Theme.of(context).textTheme.headline3,
                            ),
                        ],),
                        SizedBox(width: 20,),
                          Expanded(
                            child: Column(children: [
                              RadioForSheet(),
                              SizedBox(height: 20,),
                              DropDown(
                                value: dropdownValueColor,
                                itemsList: colorList,
                              ),
                              SizedBox(height: 20,),
                              DropDown(
                                value: dropdownValueType,
                                itemsList: typeList,
                              ),
                              SizedBox(height: 20,),
                              Slider(
                                value: price,
                                onChanged: (double value) {
                                  //  setState(() => {price = value});
                                },
                                min: 200,
                                max: 1200,
                                divisions: 1000,
                              ),
                              SizedBox(height: 20,),
                              BoxTextField(
                                padding: 10,
                                margin: 10,
                                icon: Icon(Icons.calendar_today_rounded),
                                validatorText: 'please pick data',
                                controller: dateController,
                                onTap: () {
                                  DatePicker();
                                },
                              ),
                            ],),
                          ),
                        ],
                      ),
                     SizedBox(height: 40,),
                      DefaultButton(
                        text: 'Search',
                        onPressedFun: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()));
                        },
                      ),
                    ],
                  ),
                )));
      });
}
