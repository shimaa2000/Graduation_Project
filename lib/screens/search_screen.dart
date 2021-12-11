import 'package:flutter/material.dart';
import 'package:graduation_project/screens/Search_result_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
enum productFor {Sell,Buy}

class _SearchScreenState extends State<SearchScreen> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  productFor? typeFor = productFor.Buy;
  String dropdownValue = 'Red';
  List <String> colorList = ['Red', 'Blue', 'Gray'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {

                },
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 36.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              'Search',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 16.0),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          showModalBottomSheet<void>(context: context, builder: (BuildContext ctx){
            return Container(
              height: 400,
              child: Container(
                height: 400,
              child: Column (children: [
                Row(
                  children: [
                    Icon(Icons.filter_list_rounded, size: 45,color: Colors.deepPurple,),
                    SizedBox(width: 15,),
                    Text('Filter',style: TextStyle( color: Colors.deepPurple, fontSize: 30, fontWeight: FontWeight.bold),)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  textBaseline: TextBaseline.ideographic,
                  children: [
                    Text('For',style: Theme.of(context).textTheme.headline3,),
                    SizedBox(width: 20,),
                   Row(
                     children: [
                       Row(
                         children: [
                           Text('sell'),
                           Container(
                             width: 20,
                             child: ListTile(
                               leading: Radio(
                                 value: productFor.Sell,
                                 groupValue: typeFor,
                                 onChanged: ( productFor? value) { setState(() {
                                   typeFor = value ;
                                 }); },
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           Text('Rent',style: Theme.of(context).textTheme.headline5,),
                         ],
                       ),
                       SizedBox(width: 30,),

                       Row(
                         textBaseline: TextBaseline.ideographic,
                         children: [
                           InkWell(
                             onTap:(){
                               setState(() {
                                 typeFor = productFor.Sell;
                               });
                             },
                             child: Container(
                               width: 25,
                               child: ListTile(
                                 leading: Radio(
                                   value: productFor.Buy,
                                   groupValue: typeFor,
                                   onChanged: ( productFor? value) { setState(() {
                                     typeFor = value;
                                   }); },
                                 ),
                               ),
                             ),
                           ),
                           SizedBox(width: 10,),
                           Text('Sell',style: Theme.of(context).textTheme.headline5,),
                         ],
                       ),
                     ],
                   )
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text('Colour', style: Theme.of(context).textTheme.headline3,),
                    SizedBox(width: 20,),
                    Container(
                      width: 50,
                      height: 20,
                      child: DropdownButton(
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        style: TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,

                          color: Colors.deepPurple,
                        ),
                        onChanged: (String? newValue){
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        // ignore: non_constant_identifier_names
                        items: colorList.map<DropdownMenuItem<String>>((String? value){
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value!),);
                        }).toList(),
                      ),
                    )

                  ],
                ),

              ],)
              )
            );
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
