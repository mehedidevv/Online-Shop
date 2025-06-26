import 'package:flutter/material.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import '../app_images/App_images.dart';

class CustomBottomNavBar extends StatefulWidget {
  final Function(int) onTap;
  final int currentIndex;

  const CustomBottomNavBar({
    Key? key,
    required this.onTap,
    this.currentIndex = 0,
  }) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.currentIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onTap(index);
  }

  @override
  Widget build(BuildContext context) {
    final Color activeIconColor = Colors.white;
    final Color inactiveIconColor = Colors.grey;

    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(width: 1, color: AppColors.primaryDeep),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _buildNavItem(
                assetPath: AppImages.newsFeedIcon,
                label: 'Feed',
                index: 0,
                activeIconColor: activeIconColor,
                inactiveIconColor: inactiveIconColor,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                assetPath: AppImages.locationIcon,
                label: 'Map',
                index: 1,
                activeIconColor: activeIconColor,
                inactiveIconColor: inactiveIconColor,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                assetPath: AppImages.addIcon,
                label: 'Add',
                index: 2,
                activeIconColor: activeIconColor,
                inactiveIconColor: inactiveIconColor,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                assetPath: AppImages.notification,
                label: 'Alert',
                index: 3,
                activeIconColor: activeIconColor,
                inactiveIconColor: inactiveIconColor,
              ),
            ),
            Expanded(
              child: _buildNavItem(
                assetPath: AppImages.profile,
                label: 'Profile',
                index: 4,
                activeIconColor: activeIconColor,
                inactiveIconColor: inactiveIconColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required String assetPath,
    required String label,
    required int index,
    required Color activeIconColor,
    required Color inactiveIconColor,
  }) {
    final bool isActive = selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Container(
        height: 70,
        // width removed, Expanded controls width now
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isActive ? AppColors.primaryGradient : null,
          color: isActive ? null : Colors.transparent,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  assetPath,
                  width: 25,
                  height: 25,
                  color: isActive ? activeIconColor : inactiveIconColor,
                  fit: BoxFit.contain,
                ),
                if (isActive) ...[
                  const SizedBox(height: 2),
                  Expanded(
                    child: CustomText(
                       title: label,
                        color: activeIconColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
