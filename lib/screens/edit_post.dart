
import 'package:flutter/material.dart';
import 'package:graduation_project/shared/boxtextfield.dart';
import 'package:graduation_project/shared/imagePicker.dart';
import 'add post 2.dart';

class EditPost extends StatefulWidget {
  static const routeName = 'edit_post';

  const EditPost({Key? key}) : super(key: key);

  @override
  _EditPostState createstate() => _EditPostState();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}

class _EditPostState extends State<EditPost> {
  final Title = TextEditingController();
  final Description = TextEditingController();
  final Price = TextEditingController();
  final postfor = TextEditingController();
  final Donate = TextEditingController();

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
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " Enter The Title ";
                                      }
                                    },
                                    hint: "",
                                    icon: Icon(Icons.height),
                                    label: '',
                                    onTap: () {}
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: BoxTextField(
                                    controller: Description,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " Enter The Description ";
                                      }
                                    } ,
                                    hint: "",
                                    icon: Icon(Icons.monitor_weight,),
                                    label: '',
                                    onTap: () {}
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.5,
                                height: 50,
                                child: BoxTextField(
                                    controller: Price,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return " Enter The Price";
                                      }
                                    } ,
                                    hint: "",
                                    icon: Icon(Icons.monitor_weight),
                                    label: '',
                                    onTap: () {}
                                ),
                              ),
                              Row(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          // child: ListTile(
                                          //   leading: Radio(
                                          //       value: donation.No,
                                          //       groupValue: donationv,
                                          //       onChanged: ( donation? value) { setState(() {donationv = value;}); }
                                          //   ),
                                          // ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text('No',style: Theme.of(context).textTheme.headline5,),
                                      ],
                                    ),
                                    SizedBox(width: 30,),
                                    Row(
                                      textBaseline: TextBaseline.ideographic,
                                      children: [
                                        Container(
                                          width: 20,
                                          // child: ListTile(
                                          //   leading: Radio(
                                          //       value: donation.No,
                                          //       groupValue: donationv,
                                          //       onChanged: ( donation? value) { setState(() {donationv = value ;}); }
                                          //   ),
                                          // ),
                                        ),
                                        SizedBox(width: 10,),
                                        Text('Yes',style: Theme.of(context).textTheme.headline5,),
                                      ],
                                    ),
                                  ]
                              )
                            ]
                        )
                      ]
                  )
                ]
            )
        )
    );
  }
}