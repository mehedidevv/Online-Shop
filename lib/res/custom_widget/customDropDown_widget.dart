// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../app_colors/App_Colors.dart';

class CustomDropDownWidget extends StatelessWidget {
  final String? selectedValue; // Changed to nullable to handle unselected state
  final List<String> items;
  final ValueChanged<String?> onChanged;
  final String hintText;

  CustomDropDownWidget({
    required this.selectedValue,
    required this.items,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    // Ensure the items list contains unique values
    final uniqueItems = items.toSet().toList();

    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Color(0XFFF8F9FA),
        border: Border.all(color: Color(0XFF6B6B6B), width: 0.35),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: uniqueItems.contains(selectedValue) ? selectedValue : null,
        hint: Text(hintText),
        underline: SizedBox(),
        onChanged: onChanged,
        items: uniqueItems
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        isExpanded: true,
        style: TextStyle(
            color: AppColors.mainTextColor,
            fontSize: 15,
            fontWeight: FontWeight.w600,
            fontFamily: ('Montserrat'),
        ),
        icon: Icon(
          Icons.arrow_drop_down,
          color: Color(0XFF212529),
          size: 24,
        ),
        dropdownColor: AppColors.whiteColor,
      ),
    );
  }
}