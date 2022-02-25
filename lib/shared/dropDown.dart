import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  String value;
  final List<String> itemsList;

  @override
  State<DropDown> createState() => _DropDownState();

  DropDown({required this.value, required this.itemsList});
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      isDense: true,
      value: widget.value,
      icon: Icon(
        Icons.arrow_drop_down,
        color: Colors.brown,
      ),
      iconSize: 20,
      onChanged: (value)=> setState(()=>widget.value = value.toString()),
      items: widget.itemsList.map(buildMenuItem).toList(),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(item),
  );

}
