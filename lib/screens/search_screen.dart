import 'package:flutter/material.dart';
import 'package:graduation_project/shared/searchBox.dart';
import 'package:graduation_project/shared/buttomSheet.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var ScaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
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
          bottomSheet(context);
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
