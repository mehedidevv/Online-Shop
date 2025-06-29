
import 'package:flutter/material.dart';
import 'package:shop_app/view/profileView/profile_view.dart';
import '../res/custom_widget/customBottomNavBar_widget.dart';
import 'addView/add_view.dart';
import 'feedView/feed_view.dart';
import 'locationView/view/location_view.dart';
import 'notificationView/view/notification_view.dart';



class HomeDashboardView extends StatefulWidget {
  const HomeDashboardView({super.key});

  @override
  State<HomeDashboardView> createState() => _HomeDashboardViewState();
}

class _HomeDashboardViewState extends State<HomeDashboardView> {
  int _selectedNavIndex = 0;

  final List<Widget> _bottomScreens = [
    FeedView(),
    LocationView(),
    AddView(),
    NotificationView(),
    ProfileView(),
  ];

  void _onNavBarTap(int index) {
    setState(() {
      _selectedNavIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bottomScreens[_selectedNavIndex],
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedNavIndex,
        onTap: _onNavBarTap,
      ),
    );
  }
}

