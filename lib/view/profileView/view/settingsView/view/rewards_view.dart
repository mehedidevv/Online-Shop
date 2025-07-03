import 'package:awesome_circular_chart/awesome_circular_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app/res/app_colors/App_Colors.dart';
import 'package:shop_app/res/custom_style/custom_size.dart';
import 'package:shop_app/res/custom_widget/customAppBar_widget.dart';
import 'package:shop_app/res/custom_widget/custom_text.dart';

class RewardsView extends StatelessWidget {
  RewardsView({super.key});

  final GlobalKey<AnimatedCircularChartState> _chartKey =
  GlobalKey<AnimatedCircularChartState>();

  final List<CircularStackEntry> data = <CircularStackEntry>[
    CircularStackEntry(
      <CircularSegmentEntry>[
        CircularSegmentEntry(500.0, Colors.red[300]!, rankKey: 'Q1'),
        CircularSegmentEntry(1000.0, Colors.green[300]!, rankKey: 'Q2'),
        CircularSegmentEntry(2000.0, Colors.blue[300]!, rankKey: 'Q3'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppBar(
        text: 'Forager Reward',
        onBackTap: () => Navigator.pop(context),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Row
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      title: 'Mallory',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),
                    CustomText(
                      title: 'Gold',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),
                  ],
                ),
              ),

              heightBox10,

              // Join Date
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CustomText(
                  title: 'Joined 12/20/2025',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.mainTextColor,
                ),
              ),

              // Pie Chart
              Center(
                child: AnimatedCircularChart(
                  key: _chartKey,
                  size: Size(400, 400),
                  initialChartData: data,
                  chartType: CircularChartType.Pie,
                  edgeStyle: SegmentEdgeStyle.round,
                  percentageValues: false,
                  holeRadius: 0.0, // No hole, full pie
                ),
              ),


              // Optional: Legend or Labels
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: 'Reward Breakdown',
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.mainTextColor,
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        _buildLegendDot(Colors.red[300]!, 'Forager'),
                        _buildLegendDot(Colors.green[300]!, 'Gatherer'),
                        _buildLegendDot(Colors.blue[300]!, 'Scouter'),
                      ],
                    )
                  ],
                ),
              ),

              heightBox30,


              Center(child: CustomText(
                  title: 'Upgrade to Foreger status here.',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.mainTextColor,
              ),
              ),
              heightBox10,
              Center(child: CustomText(
                title: 'Foragers can personalize their notifications to include their '

                    'favourite notifications categories, brands, and their size!',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.mainTextColor,
              ),
              ),






            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLegendDot(Color color, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: Row(
        children: [
          Container(
            width: 10.w,
            height: 10.w,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          SizedBox(width: 6),
          CustomText(
            title: label,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.mainTextColor,
          )
        ],
      ),
    );
  }
}
