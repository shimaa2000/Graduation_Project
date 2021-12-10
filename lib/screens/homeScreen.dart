import 'package:flutter/material.dart';
import 'package:graduation_project/screens/details_screen.dart';
import 'package:graduation_project/screens/edit_profile.dart';
import 'package:graduation_project/screens/profile.dart';
import '../dummy_data.dart';
import '../layout/card_widget.dart';

int index = 0;

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
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                style: Theme.of(context).textTheme.headline3,
              ),
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
                            index = data.id - 1;
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
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              height: 10.0,
            ),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                children: [
                 Column(children: [
                   ...DUMMY_DATA
                       .map(
                         (data) => InkWell(
                       onTap: () {
                         Navigator.of(context).pushNamed(
                           DetailsScreen.routeName,
                           arguments: data.id,
                         );
                         index = data.id - 1;
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

                 ],),
                  Column(children: [
                    ...DUMMY_DATA
                        .map(
                          (data) => InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            DetailsScreen.routeName,
                            arguments: data.id,
                          );
                          index = data.id - 1;
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

                  ],),
                ],
              ),
            ),
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
                      onTap: () {
                        Navigator.pushNamed(context, Profile.routeName);
                      },
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
              title: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, EditProfile.routeName);
                  },
                  child: Text('Edit Profile')),
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
