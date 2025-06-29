import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/view/locationView/view/storeDetails_view.dart';
import '../../../../../res/app_images/App_images.dart';
import '../../../../../res/custom_widget/custom_text.dart';
import '../../widget/nearByStores_widget.dart';
import '../controller/locationController.dart';

class LocationView extends StatelessWidget {
  const LocationView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LocationController());

    return Scaffold(
      body: Stack(
        children: [
          // Fullscreen Google Map with reactive markers
          Obx(() => GoogleMap(
            initialCameraPosition: controller.initialCameraPosition,
            markers: controller.markers.toSet(), // Convert RxSet to Set
            onMapCreated: controller.onMapCreated,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
          )),

          // Radius label with reactive radius value
          Positioned(
            top: 60.h,
            left: 16.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Obx(() => CustomText(
                title: '${controller.selectedRadius.value}-mile radius',
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
                color: Colors.black,
              )),
            ),
          ),

          // Radius circle overlay
          Positioned(
            top: 100.h,
            left: 40.w,
            child: Container(
              width: 300.w,
              height: 300.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                color: Colors.blue.withOpacity(0.2),
              ),
            ),
          ),

          // Center Pin
          Positioned(
            top: 100.h + 150.h,
            left: MediaQuery.of(context).size.width / 2 - 25.w,
            child: Container(
              width: 50.w,
              height: 50.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.amber.withOpacity(0.9),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Center(
                child: Image.asset(
                  AppImages.locationIndicator,
                  height: 24.h,
                  width: 24.w,
                ),
              ),
            ),
          ),

          // Static Nearby Shops (outside Obx)
          Positioned(top: 200.h, left: 80.w, child: Image.asset(AppImages.shop, width: 30.w)),
          Positioned(top: 200.h, right: 90.w, child: Image.asset(AppImages.shop, width: 30.w)),
          Positioned(bottom: 370.h, left: 90.w, child: Image.asset(AppImages.shop, width: 30.w)),
          Positioned(bottom: 370.h, right: 90.w, child: Image.asset(AppImages.shop, width: 30.w)),

          // Add Shop Button
          Positioned(
            top: 60.h,
            right: 16.w,
            child: GestureDetector(
              onTap: () {
                controller.addMarker(
                  position: const LatLng(23.8110, 90.4125),
                  title: 'New Shop',
                );
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.appBarTextColor,
                ),
                child: Row(
                  children: [
                    Icon(Icons.add, color: Colors.white, size: 20.sp),
                    SizedBox(width: 5.w),
                    CustomText(
                      title: 'Add Shop',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Title Row for Nearby Stores
          Positioned(
            bottom: 250.h,
            left: 20.w,
            right: 20.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: 'Choose Near by Stores',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                CustomText(
                  title: 'See all',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ],
            ),
          ),

          //Near By Shops
          Positioned(
            bottom: 20.h,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 210.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: NearByStoresWidget(
                      onTab: ()=>Get.to(StoreDetailsView()),
                    ),
                  );
                },
              ),
            ),
          ),






        ],
      ),
    );
  }
}
