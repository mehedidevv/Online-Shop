import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/view/profileView/view/myListiningView/widget/singleSize_widget.dart';
import 'package:shop_app/view/profileView/view/myListiningView/widget/sizeBottomSheet_widget.dart';

class WomanSizeWidget extends StatelessWidget {
  WomanSizeWidget({super.key});

  final List<Map<String, dynamic>> sizeList = [
    {
      'title': 'Pants',
      'sizes': ['M', 'L', 'XL'],
    },
    {
      'title': 'Shirts',
      'sizes': ['S', 'M', 'L'],
    },
    {
      'title': 'Jackets',
      'sizes': ['L', 'XL'],
    },
    {
      'title': 'Pants',
      'sizes': ['M', 'L', 'XL'],
    },
    {
      'title': 'Shirts',
      'sizes': ['S', 'M', 'L'],
    },
    {
      'title': 'Jackets',
      'sizes': ['L', 'XL'],
    },

    {
      'title': 'Pants',
      'sizes': ['M', 'L', 'XL'],
    },
    {
      'title': 'Shirts',
      'sizes': ['S', 'M', 'L'],
    },
    {
      'title': 'Jackets',
      'sizes': ['L', 'XL'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Optional: Add title or header here

              Expanded(
                child: ListView.builder(
                  itemCount: sizeList.length,
                  itemBuilder: (context, index) {
                    final item = sizeList[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: SingleSizeWidget(
                        title: item['title'],
                        sizes: List<String>.from(item['sizes']),
                        onTap: () {
                          showCustomBottomSheet(context);
                        },

                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
