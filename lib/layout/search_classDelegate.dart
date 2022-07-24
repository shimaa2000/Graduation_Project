import 'package:flutter/material.dart';
import 'package:graduation_project/dummy_data.dart';
import 'package:graduation_project/endPoints.dart';
import 'package:graduation_project/models/postsModel.dart';
import 'package:graduation_project/screens/search_screen.dart';
class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {

    return <Widget>[
      IconButton(
        icon: Icon(Icons.close,color: isDark? Colors.grey: Colors.white70,),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back,color: isDark? Colors.grey: Colors.white70,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Container(
      child: Center(
        child: SearchScreen(search: selectedResult,),
      ),
    );
  }

  final List <PostModel>listExample;
  Search(this.listExample);

  List<PostModel> recentList = [DUMMY_DATA[0],DUMMY_DATA[1]];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PostModel> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList
        : suggestionList.addAll(listExample.where(
          (element) => element.name.contains(query),
    ));

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index].name,style: Theme.of(context).textTheme.bodyText1,
          ),
          leading: query.isEmpty ? Icon(Icons.access_time,color: isDark? Colors.grey: Colors.white70,) : SizedBox(),
          onTap: (){
            selectedResult = suggestionList[index].name;
            showResults(context);
          },
        );
      },
    );
  }
}