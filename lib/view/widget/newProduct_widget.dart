import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../res/app_colors/App_Colors.dart';
import '../../res/custom_style/custom_size.dart';
import '../../res/custom_widget/custom_text.dart';

class NewProductWidget extends StatefulWidget {
  final String imagePath;
  final String brandName;
  final String productName;
  final String price;
  final String discountPrice;
  final double rating;
  final int ratingCount;
  final bool initialFavorite;

  const NewProductWidget({
    super.key,
    required this.imagePath,
    required this.brandName,
    required this.productName,
    required this.price,
    required this.discountPrice,
    required this.rating,
    required this.ratingCount,
    this.initialFavorite = false,
  });

  @override
  State<NewProductWidget> createState() => _NewProductWidgetState();
}

class _NewProductWidgetState extends State<NewProductWidget> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.initialFavorite;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120.w,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image + Heart Icon
          Stack(
            children: [
              Container(
                height: 170.h,
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: Image.asset(
                    widget.imagePath,
                    height: 170.h,
                    width: 120.w,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // **New label top-left**
              Positioned(
                top: 8.h,
                left: 8.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(5.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: CustomText(
                     title:  'New',
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),

              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                  child: Container(
                    height: 28.w,
                    width: 28.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.redAccent,
                        size: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),


          heightBox10,

          /// Rating
          Row(
            children: [
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    color: index < widget.rating ? AppColors.appBarTextColor : Colors.grey.shade300,
                    size: 12.sp,
                  );
                }),
              ),
              widthBox5,
              CustomText(
                title: '(${widget.ratingCount})',
                fontSize: 10.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor.withOpacity(0.7),
              ),
            ],
          ),

          heightBox5,

          /// Brand
          CustomText(
            title: widget.brandName,
            fontSize: 11.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor.withOpacity(0.5),
          ),

          heightBox5,

          /// Product Title
          CustomText(
            title: widget.productName,
            fontSize: 12.sp,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor,
          ),

          heightBox5,

          /// Price
          Row(
            children: [
              CustomText(
                title: widget.price,
                fontSize: 14.sp,
                fontFamily: 'Roboto',
                lineThrough: true,
                fontWeight: FontWeight.w500,
                color: AppColors.mainTextColor.withOpacity(0.5),
              ),
              widthBox8,
              CustomText(
                title: widget.discountPrice,
                fontSize: 14.sp,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
                color: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
