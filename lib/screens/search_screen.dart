import 'package:flutter/material.dart';
import 'package:graduation_project/shared/listView.dart';
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
      body: ListViewBuilderData(),
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
