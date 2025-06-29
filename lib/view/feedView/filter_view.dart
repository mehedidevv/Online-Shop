import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/app_images/App_images.dart';
import 'package:shop_app/res/custom_widget/customDropDown_widget.dart';
import 'package:shop_app/res/custom_widget/custom_button.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';
import '../../../../res/custom_style/custom_size.dart';
import '../../../../res/custom_widget/customAppBar_widget.dart';
import '../widget/bottomSheet_widget.dart';

// ---------------------- CONTROLLER ----------------------
class FilterController extends GetxController {
  var selectedRadius = '40'.obs;
  final List<String> radiusOption = ['40', '50', '60', '70', '80', '90', '100'].obs;

  final CameraPosition initialCameraPosition =
  CameraPosition(target: LatLng(33.9391, 67.7100), zoom: 10);
  final RxSet<Marker> markers = <Marker>{}.obs;

  late GoogleMapController mapController;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}

// ---------------------- UI ----------------------
class FilterView extends StatefulWidget {
  const FilterView({super.key});

  @override
  State<FilterView> createState() => _FilterViewState();
}

class _FilterViewState extends State<FilterView> {
  final FilterController controller = Get.put(FilterController());
  RangeValues _currentRange = const RangeValues(78, 143);

  final List<Color> colorOptions = [
    Colors.black,
    const Color(0xFF617D89),
    AppColors.primaryDeep,
    const Color(0xFFBEA9A9),
    AppColors.appBarTextColor,
    const Color(0xFF151867),
  ];

  int selectedColorIndex = -1;

  // Sizes with multiple selection support
  final List<String> sizeOptions = ['XS', 'S', 'M', 'L', 'XL'];
  Set<int> selectedSizes = {}; // holds multiple selected indices

  final List<String> categories = [
    'All', 'Women', 'Men', 'Kids', 'Furniture', 'Health&Beauty'
  ];

  int selectedCategories = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'Filter',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: Colors.transparent,
                    border: Border.all(color: const Color(0XFFDADADA), width: 1.5),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 20.h,
                        width: 20.w,
                        child: Image.asset(AppImages.location),
                      ),
                      widthBox20,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Location',
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                            color: AppColors.mainTextColor.withOpacity(0.50),
                          ),
                          CustomText(
                            title: 'Bristol, Virginia',
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      )
                    ],
                  ),
                ),

                heightBox20,

                // Radius Dropdown
                Obx(() => CustomDropDownWidget(
                  selectedValue: controller.selectedRadius.value,
                  items: controller.radiusOption,
                  hintText: 'Radius',
                  onChanged: (newValue) {
                    controller.selectedRadius.value = newValue!;
                  },
                )),

                heightBox10,

                // Google Map
                Container(
                  height: 200.h,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Obx(() => GoogleMap(
                          initialCameraPosition: controller.initialCameraPosition,
                          markers: controller.markers.value,
                          onMapCreated: controller.onMapCreated,
                          zoomControlsEnabled: false,
                          myLocationButtonEnabled: false,
                          liteModeEnabled: false,
                        )),

                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Obx(() => CustomText(
                              title: '${controller.selectedRadius.value}-mile',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.black,
                            )),
                          ),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Obx(() {
                            final radius = double.tryParse(controller.selectedRadius.value) ?? 40;
                            final size = radius * 4;
                            return Container(
                              width: size,
                              height: size,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: Colors.white, width: 2),
                                color: Colors.grey.withOpacity(0.2),
                              ),
                            );
                          }),
                        ),

                        Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.amber,
                            ),
                            child: Center(child: Image.asset(AppImages.locationIndicator)),
                          ),
                        ),

                        Positioned(top: 30, left: 120, child: Image.asset(AppImages.shop, width: 30)),
                        Positioned(top: 50, right: 100, child: Image.asset(AppImages.shop, width: 30)),
                        Positioned(bottom: 20, left: 270, child: Image.asset(AppImages.shop, width: 30)),
                        Positioned(top: 170, left: 100, child: Image.asset(AppImages.shop, width: 30)),
                      ],
                    ),
                  ),
                ),

                heightBox20,
                CustomText(
                  title: 'Price ranges',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),
                //Price Slider
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(title: '\$${_currentRange.start.round()}', fontSize: 16, color: Colors.black),
                          CustomText(title: '\$${_currentRange.end.round()}', fontSize: 16, color: Colors.black),
                        ],
                      ),
                    ),
                    RangeSlider(
                      values: _currentRange,
                      min: 0,
                      max: 200,
                      divisions: 200,
                      activeColor: Colors.brown,
                      inactiveColor: Colors.grey.shade400,
                      onChanged: (values) => setState(() => _currentRange = values),
                    ),
                  ],
                ),

                heightBox20,
                //Colors
                CustomText(
                  title: 'Colors',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),

                //Colors selector (single selection)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(colorOptions.length, (index) {
                      final isSelected = selectedColorIndex == index;
                      return Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: GestureDetector(
                          onTap: () => setState(() => selectedColorIndex = index),
                          child: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: isSelected
                                  ? Border.all(color: AppColors.primaryDeep, width: 1)
                                  : Border.all(color: Colors.transparent, width: 1),
                            ),
                            child: Center(
                              child: Container(
                                width: 40.w,
                                height: 40.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: colorOptions[index],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                heightBox20,

                //Sizes
                CustomText(
                  title: 'Sizes',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                // Multiple selectable sizes
                SizedBox(
                  height: 40.w,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sizeOptions.length,
                    itemBuilder: (context, index) {
                      bool isSelected = selectedSizes.contains(index);
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            if (isSelected) {
                              selectedSizes.remove(index);
                            } else {
                              selectedSizes.add(index);
                            }
                          });
                        },
                        child: Container(
                          width: 40.w,
                          margin: EdgeInsets.only(right: 8.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: isSelected ? AppColors.primaryDeep : Colors.transparent,
                            border: Border.all(
                              color: AppColors.primaryDeep,
                              width: 1,
                            ),
                          ),
                          alignment: Alignment.center,
                          child: CustomText(
                            title: sizeOptions[index],
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: isSelected
                                ? AppColors.whiteColor
                                : AppColors.mainTextColor.withOpacity(0.5),
                          ),
                        ),
                      );
                    },
                  ),
                ),


                heightBox20,

                //Sizes
                CustomText(
                  title: 'Categories',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.mainTextColor,
                ),

                heightBox10,

                //Categories
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: List.generate(categories.length, (index) {
                    final isSelected = selectedCategories == index;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedCategories = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.primaryDeep : Colors.transparent,
                          // brown or white
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : Color(0XFF9B9B9B),
                            width: 0.4,
                          ),

                        ),
                        child: CustomText(
                         title:  categories[index],
                            color: isSelected ? AppColors.whiteColor : AppColors.mainTextColor.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          fontFamily: 'Roboto',

                        ),
                      ),
                    );
                  }),
                ),

                heightBox20,

                //Stores Container

                GestureDetector(
                  onTap: (){
                    //TODO
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) =>  CustomBottomSheet(),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color:Color(0XFFF9F9F9),
                    ),
                    child:Row(
                      children: [

                        CustomText(
                          title: 'Stories',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.blackColor,
                        ),
                        Spacer(),
                        Icon(
                          Icons.arrow_drop_down,size: 25,)
                      ],
                    ),
                  ),
                ),

                heightBox20,

                Row(
                  children: [
                    // Discard Button
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context); // or any custom discard logic
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: Colors.transparent,
                            border: Border.all(color: const Color(0XFF222222), width: 1),
                          ),
                          child: Center(
                            child: CustomText(
                              title: 'Discard',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.mainTextColor,
                            ),
                          ),
                        ),
                      ),
                    ),

                    widthBox14,

                    // Apply Button
                    Expanded(
                      child: CustomButton(
                        title: 'Apply',
                        fontSize: 14.sp,
                        onTap: () {
                          // Apply filter logic here
                        },
                      ),
                    ),
                  ],
                )




              ],
            ),
          ),
        ),
      ),
    );
  }
}

