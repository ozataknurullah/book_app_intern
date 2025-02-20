import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/shimmer_effect.dart';

class ShimmerHomeScreen extends StatelessWidget {
  const ShimmerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category Shimmer
          SizedBox(
            height: 42.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  const ShimmerWidget(width: 100, height: 40),
              itemCount: 5,
              separatorBuilder: (_, __) => SizedBox(width: 8.w),
            ),
          ),
          SizedBox(height: 20.h),

          // SearchBar shimmer
          const ShimmerWidget(width: double.infinity, height: 50),
          SizedBox(height: 20.h),

          // Books Shimmer
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 8.h),
                child: Row(
                  children: [
                    const ShimmerWidget(width: 100, height: 150),
                    SizedBox(width: 10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ShimmerWidget(width: 150, height: 20),
                        SizedBox(height: 5.h),
                        const ShimmerWidget(width: 100, height: 15),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
