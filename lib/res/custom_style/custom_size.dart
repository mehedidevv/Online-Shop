import 'package:flutter/cupertino.dart';

const heightBox5 =  SizedBox(height: 5,);
const heightBox10 = SizedBox(height: 10,);
const heightBox8 = SizedBox(height: 8,);
const heightBox20 = SizedBox(height: 20,);
const heightBox14 = SizedBox(height: 14,);
const heightBox16 = SizedBox(height: 16,);
const heightBox30 = SizedBox(height: 30,);
const heightBox40 = SizedBox(height: 40,);
const heightBox50 = SizedBox(height: 50,);
const heightBox100 = SizedBox(height: 100,);

const widthBox5 = SizedBox(width: 5,);
const widthBox8 = SizedBox(width: 8,);
const widthBox10 = SizedBox(width: 10,);
const widthBox14 = SizedBox(width: 14,);
const widthBox20 = SizedBox(width: 20,);
const widthBox15 = SizedBox(width: 15,);
const widthBox40 = SizedBox(width: 40,);
const widthBox50 = SizedBox(width: 50,);

// Extensions on int for width and height boxes
extension SpacingExtension on int {
  Widget get widthBox => SizedBox(width: toDouble());
  Widget get heightBox => SizedBox(height: toDouble());
}



