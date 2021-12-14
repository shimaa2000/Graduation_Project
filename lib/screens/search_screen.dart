import 'package:flutter/material.dart';
import 'package:graduation_project/screens/Search_result_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/searchBox.dart';
import 'package:intl/intl.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}




class _SearchScreenState extends State<SearchScreen> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  String typeFor = 'Sell';
  String dropdownValueColor = 'Red';
  List<String> colorList = ['Red', 'Blue', 'Gray'];
  String dropdownValueType = 'Bodycon';
  List<String> typeList = ['Bodycon', 'A-line', 'Paesant'];
  double price = 250;
  var dateController = TextEditingController();
  final searchController = TextEditingController();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                child: SearchBox(searchController: searchController, enabled: true, icon: Icon(Icons.search), onTap: (){}, label: 'Search', padding: 10.0,margin: 0.0,
                  hint: 'Search',
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext ctx) {
                return Container(
                    height: 900,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                        height: 900,
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
                                textBaseline: TextBaseline.ideographic,
                                children: [
                                  Text(
                                    'For',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 20,
                                            child:  Radio(
                                              value: 'Rent',
                                              groupValue: typeFor,
                                              onChanged: (value) {
                                                setState(() {
                                                  typeFor = 'Rent';
                                                  print(44);
                                                });
                                              },

                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Rent',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Row(
                                        textBaseline: TextBaseline.ideographic,
                                        children: [
                                          Container(
                                            width: 25,
                                            child: Radio(
                                              value: 'Sell',
                                              groupValue: typeFor,
                                              onChanged: (value) {
                                                setState(() {
                                                  typeFor = 'Sell';
                                                  print(44);
                                                });
                                              },
                                            ),

                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'Sell',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline5,
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Colour',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: DropdownButton(
                                    value: dropdownValueColor,
                                    icon: Icon(Icons.arrow_drop_down),
                                    elevation: 16,
                                    style: TextStyle(color: Colors.deepPurple),
                                    underline: Container(
                                      height: 2,
                                      color: Colors.deepPurple,
                                    ),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValueColor = newValue!;
                                      });
                                    },
                                    // ignore: non_constant_identifier_names
                                    items: colorList
                                        .map<DropdownMenuItem<String>>(
                                            (String? value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value!),
                                      );
                                    }).toList(),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Type',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  SizedBox(
                                    width: 35,
                                  ),
                                  Expanded(
                                    child: DropdownButton(
                                      value: dropdownValueType,
                                      icon: Icon(Icons.arrow_drop_down),
                                      elevation: 16,
                                      style: TextStyle(color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurple,
                                      ),
                                      onChanged: (String? newValue2) {
                                        setState(() {
                                          dropdownValueType = newValue2!;
                                        });
                                      },
                                      // ignore: non_constant_identifier_names
                                      items: typeList
                                          .map<DropdownMenuItem<String>>(
                                              (String? value2) {
                                        return DropdownMenuItem<String>(
                                          value: value2,
                                          child: Text(value2!),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Price',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Slider(
                                      value: price,
                                      onChanged: (double value) {
                                        setState(() => {price = value});
                                      },
                                      min: 200,
                                      max: 1200,
                                      divisions: 1000,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Date',
                                    style: Theme.of(context).textTheme.headline3,
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: BoxTextField(
                                      label: 'Date',
                                      padding: 10,
                                      margin: 10,
                                      icon: Icon(Icons.calendar_today_rounded), hint: 'Pick A Date', validator: (String? value) { if (value!.isEmpty) {
                                      return 'date must not be empty';
                                    } }, controller: dateController,
                                      onTap: (){
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime(2022),
                                        ).then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                        }).catchError((error) {
                                          print(error.toString());
                                        });
                                      },
                                    ),
                                  ),
                                  
                                      ],
                              ),

                              DefaultButton(text: 'Search', onPressedFun: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=> SearchResult()));
                              },),
                            ],
                          ),
                        )));
              });
        },
        child: Icon(Icons.filter_alt_outlined),
      ),
    );
  }
}

bool isBottomSheetShown = false;

void changeBottomSheetState({
  required bool isshow,
}) {
  isBottomSheetShown = isshow;
}
