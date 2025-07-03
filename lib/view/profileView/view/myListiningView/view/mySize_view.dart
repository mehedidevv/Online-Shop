import 'package:flutter/material.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';

class MySizeView extends StatelessWidget {
  const MySizeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Size',onBackTap: ()=>Navigator.pop(context),),
      body: SafeArea(child: Column(
        children: [




        ],
      )),
    );
  }
}
