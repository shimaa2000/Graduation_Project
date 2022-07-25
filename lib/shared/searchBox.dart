import 'package:flutter/material.dart';

class SearchBox extends StatelessWidget {
  final TextEditingController searchController;
  final Icon icon;
  final bool enabled;
  final Function onTap;
  final String label;
  final double padding;
  final double margin;
  final String hint;
  final TextInputType keyboardType;


  const SearchBox({
    required this.searchController,
    required this.icon,
    required this.enabled,
    required this.onTap,
    required this.label,
    required this.hint,
    required this.padding,
    required this.margin,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.all( padding),
      margin: EdgeInsets.all( margin),
      child: TextFormField(
        controller: searchController,
        keyboardType: keyboardType,
        enabled: enabled,
        decoration: InputDecoration(
          prefix: icon,
          labelText: label,
          hintText: hint,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide( width: 1, color: Colors.grey),
            borderRadius:BorderRadius.circular(15),
          ),
        ),
        style: TextStyle(fontSize: 18.0, color: Colors.grey),

      ),
    );
  }
}
