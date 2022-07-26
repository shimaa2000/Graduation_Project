import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/network/cubit/appCubit.dart';
import 'package:graduation_project/network/cubit/appStates.dart';
import 'package:graduation_project/screens/details_screen.dart';

import '../screens/homeScreen.dart';
class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms;
  List<String> idList;
  int idSearch=0;
  CustomSearchDelegate({required this.searchTerms, required this.idList});

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    // addProducts(context)
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        idSearch =searchTerms.indexOf(fruit);
        matchQuery.add(fruit);
      }
    }
    return BlocProvider(
      create:(context)=>AppCubit(),
      child:BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {
        },
      builder: (context, state) {
          return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var result = matchQuery[index];
              return InkWell(
                onTap: (){
                  id= idList[idSearch];
                  Navigator.pushNamed(context, DetailsScreen.routeName);
                },
                child: ListTile(
                  title: Text(result),
                ),
              );});
            },
          ),
      ) ;
  }
}