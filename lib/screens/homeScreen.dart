import 'package:flutter/material.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/profile.dart';
import '../dummy_data.dart';
import '../layout/card_widget.dart'; int index=0;
class HomeScreen extends StatelessWidget {

  static const routeName = 'home_screen';

  // List<PostModel> posts = [
  //   PostModel(
  //
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        // title: Text('test'),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications,
            size: 28.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
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
                        style: TextStyle(color: Colors.grey, fontSize: 16.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'Top Ads',
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...DUMMY_DATA
                      .map(
                        (data) => InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              DetailsScreen.routeName,
                              arguments: data.id,
                            );
                            index=data.id-1;
                          },
                          child: Column(
                            children: [
                              CardWidget(
                                name: data.name,
                                date: data.date,
                                imgUrl: data.ImgUrl,
                                title: data.title,
                                price: data.price,
                                size: data.size,
                                isFav: data.isFav,
                              ),
                            ],
                          ),
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Available Items',
              style: TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            // GridView(
            //   padding: EdgeInsets.all(25),
            //   children: DUMMY_DATA
            //       .map(
            //         (data) => Column(
            //           children: [
            //             CardWidget(
            //               width: 175,
            //               height: 300,
            //               name: data.name,
            //               date: '',
            //               imgUrl: data.ImgUrl,
            //               title: data.title,
            //               price: data.price,
            //               size: data.size,
            //               isFav: data.isFav,
            //             ),
            //           ],
            //         ),
            //       )
            //       .toList(),
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200,
            //     childAspectRatio: 3 / 2,
            //     crossAxisSpacing: 20,
            //     mainAxisSpacing: 20,
            //   ),
            // ),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: (){Navigator.pushNamed(context, Profile.routeName);},
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 30.0,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('Hello, User Name'),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text('UserMail@gmail.com'),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: InkWell(onTap:(){Navigator.pushNamed(context, EditProfile.routeName);},child: Text('Edit Profile')),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[200],
            ),
            ListTile(
              leading: Icon(Icons.lightbulb_outline),
              title: Text('Dark Mode'),
            ),
            Container(
              width: double.infinity,
              height: 1.0,
              color: Colors.grey[200],
            ),
            ListTile(
              leading: Icon(Icons.subdirectory_arrow_left_outlined),
              title: Text('SignOut'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
//         SingleChildScrollView(
//           scrollDirection: Axis.horizontal,
//           child: Row(
//             children: [
//             Container(
//             height: 260.0,
//             width: 260,
//     child: Column(
//     children: [
//     Row(
//     children: [
//     CircleAvatar(
//     radius: 20.0,
//     ),
//     SizedBox(width: 6.0,),
//     Text('${AppCubit.get(context).posts[name]}'),
//     SizedBox(width: 6.0,),
//     Text('${post.date}'),
//     ],
//     ),
//     SizedBox(
//     height: 16.0,
//     ),
//     Container(
//     color: Colors.black,
//     ),
//     SizedBox(
//     height: 16.0,
//     ),
//     Row(
//     children: [
//     Text('${post.title}'),
//     SizedBox(width: 6.0,),
//     Text('${post.price}'),
//     ],
//     ),
//     SizedBox(
//     height: 16.0,
//     ),
//     Row(
//     children: [
//     Text('${post.size}'),
//     Icon(Icons.favorite_outline),
//     ],
//     )
//     ],
//     ),
//     );
//             ],
//           ),
//         ),

// // ListView.separated(
// // itemBuilder: (context, index) =>
// // AppCubit().buildTopAdItem(AppCubit().posts[index]),
// // separatorBuilder: (context, index) => Padding(
// // padding:
// // const EdgeInsets.only(right: 8.0, top: 4.0, bottom: 4.0),
// // child: Container(
// // height: 1.0,
// // color: Colors.grey,
// // ),
// // ),
// // itemCount: 10),
