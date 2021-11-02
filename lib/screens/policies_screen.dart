import 'package:flutter/material.dart';
import 'package:graduation_project/screens/sign_up.dart';
import 'package:graduation_project/shared/defaultButton.dart';

class policiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
       body:SingleChildScrollView(
         child: Padding(
           padding: EdgeInsets.only(top: 40,left: 20),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Row(
                 children: [
                   Text(
                     'Terms &',
                     style:TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 29,
                       color: Colors.black,
                     ),
                   ),
                   SizedBox(width: 10,),
                   Text(
                     'Conditions',
                     style:TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 29,
                       color: Colors.deepPurple,
                     ),
                   ),
                 ],
               ),
               SizedBox(height: 15,),
               Text(
                   'Please read these terms and conditions \n carefully before using "Dressuit" App.',
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 15,),
               RichText(
                 text: TextSpan(
                   children:[
                     TextSpan(
                     text: '''Your agreement with us includes these Terms and
our Privacy Policy. You acknowledge that you have 
read and understood Agreements, and agree to be
bound of them.
If you do not agree with them, then you may not use 
the Service, but please let us know by emailing
at ''',
                     style: TextStyle(color: Colors.black,
                       fontSize: 16,),
                   ),
                     TextSpan(
                      text: 'dressuitofficial@outlook.com ',
                       style: TextStyle(color: Colors.deepPurple,
                         fontSize: 16,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                     TextSpan(
                       text: '''so we can try to
find a solution. These Terms apply to all visitors,
users and others who wish to access or use Service. ''',
                       style: TextStyle(color: Colors.black,
                         fontSize: 16,),
                     ),
                   ],
               ),

               ),
               SizedBox(height: 10,),
               Text('''*Our service allows you to post you clothes as a post,
you are responsible for content you post or through
service's legality.
you also can rent item, favourite or rate it, in addition
 to follow and chat owners.''',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                 ),),
               SizedBox(height: 10,),
               Text(
                 '''*Half of the amount is paid online and the rest upon
receipt  

*Delivery by a shipping company, which in turn checks
 the validity of the product upon receipt and upon
 delivery
 *You can display your bracelets for rent, sale, or even 
donate at a lower price You can also rent clothes from 
other people ''',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                 ),
               ),
               SizedBox(height: 10,),
              Text('''*When you do not receive after ordering or do not
deliver the displayed product if you are the owner,
in these cases you will not be able to use the app
again
              ''',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),),
               SizedBox(height: 10,),
               Text('''*In the event that the product is damaged, the tenant 
will have to pay compensation to the owner
              ''',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                 ),),
               SizedBox(height: 10,),
               Text('''*The money is delivered to the owner after the rental
 process is completed.
              ''',
                 style: TextStyle(
                   fontSize: 16,
                   color: Colors.black,
                 ),),
               SizedBox(height: 25,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  // SizedBox(width: 25.0,),
                   DefaultButton(onPressedFun: (){
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SignUp(), ),);
                   }, text: 'Accept'),
                   SizedBox(width: 20.0,),
                   DefaultButton(onPressedFun: (){
                     Navigator.push(context,
                       MaterialPageRoute(builder: (context) => SignUp(), ),);
                   }, text: 'Decline'),



                 ],
               ),
               SizedBox(height: 25,),

             ],
           ),

         ),
       ),
      ),
    );
  }
}
