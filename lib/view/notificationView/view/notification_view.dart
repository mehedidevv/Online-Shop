import 'package:flutter/material.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'Notification',onBackTap: ()=> Navigator.pop(context),),
      body: Center(
        child: Text('Notification'),
      ),
    );
  }
}
