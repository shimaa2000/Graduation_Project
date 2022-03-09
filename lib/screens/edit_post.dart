import 'package:flutter/material.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/defaultButton.dart';
import 'package:graduation_project/shared/imagePicker.dart';
import 'package:graduation_project/shared/radioButton.dart';

class EditPost extends StatefulWidget {
 static const routeName='edit_post';
  const EditPost({Key? key}) : super(key: key);
  @override
  _EditPostState createState() => _EditPostState();
}
class _EditPostState extends State<EditPost>{
  final Title = TextEditingController();
  final Description = TextEditingController();
  final Price = TextEditingController();
  final postfor = TextEditingController();
  final Donate = TextEditingController();
  String postType = 'rent';
  String donationV = 'yes';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
            child: Column(
                children: [
                  Padding(
                    padding:const EdgeInsets.symmetric(vertical: 15.0, horizontal: 8),
                    child: Text('Edit your product data', style: Theme.of(context).textTheme.headline5),
                  ),
                  Row(
                      children: [
                        Padding(padding: const EdgeInsets.only(left: 10)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 18),
                            Text('Upload photo',
                                style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 35,),
                            Text('Take a photo',
                                style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 32,),
                            Text("Title", style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 27,),
                            Text("Description", style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 27,),
                            Text("Price", style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 27,),
                            Text("Post for", style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 27,),
                            Text("Donation", style: Theme.of(context).textTheme.headline5),
                            SizedBox(height: 27,),
                          ],
                        ),
                        Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10.0),
                                child: MaterialButton(
                                    color: Colors.deepPurple,
                                    child: Text(
                                      "From Gallery",
                                      style: TextStyle(
                                          color: Colors.white70, fontWeight: FontWeight.bold),
                                    ),
                                    onPressed: () => Images().uploadImageFromGallery()
                                ),
                              ),
                              MaterialButton(
                                  color: Colors.deepPurple,
                                  child: Text(
                                    "From Camera",
                                    style: TextStyle(
                                        color: Colors.white70, fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: ()=> Images().uploadImageFromCamera()
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: BoxTextField(
                                    controller: Title,
                                    validatorText: 'please enter title',
                                    icon: Icon(Icons.height),
                                    onTap: () {}
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: BoxTextField(
                                    controller: Description,
                                    validatorText: 'please enter description' ,
                                    icon: Icon(Icons.monitor_weight,),
                                    onTap: () {}
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: BoxTextField(
                                    controller: Price,
                                    validatorText: 'please enter price' ,
                                    icon: Icon(Icons.monitor_weight),
                                    onTap: () {}
                                ),
                              ),
                              Container(
                                child: RadioButtonClass(value1: 'rent',
                                  value2: 'sale',
                                  title1: 'rent',
                                  title2: 'sale',
                                  groupValue: postType,
                                  onChange1: (value){
                                    setState(() {
                                      postType='rent';
                                    });
                                  } ,
                                  onChange2: (value){
                                    setState(() {
                                      postType='sale';
                                    });
                                  }, sizedHeight: 0,
                                ),

                              ),
                              SizedBox(width: 30,),
                              Container(
                                child: RadioButtonClass(value1: 'No',
                                  value2: 'Yes',
                                  title1: 'No',
                                  title2: 'Yes',
                                  groupValue: donationV,
                                  onChange1: (value){
                                    setState(() {
                                      donationV='No';
                                    });
                                  } ,
                                  onChange2: (value){
                                    setState(() {
                                      donationV='Yes';
                                    });
                                  }, sizedHeight: 0,
                                ),
                              ),
                            ],
                        ),
                      ],
                  ),
                  SizedBox(height: 30,),
                  DefaultButton(onPressedFun: (){
                    Navigator.of(context).pushNamed(DetailsScreen.routeName);
                  }, text: 'Save')
                ],
            ),
        ),
    );
  }
}

