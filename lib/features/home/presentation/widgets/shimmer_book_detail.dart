import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/shimmer_effect.dart';

class ShimmerBookDetail extends StatelessWidget {
  const ShimmerBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: ShimmerWidget(width: 150, height: 225)),
          SizedBox(height: 16.h),
          const ShimmerWidget(width: double.infinity, height: 30),
          SizedBox(height: 10.h),
          const ShimmerWidget(width: 200, height: 20),
          SizedBox(height: 30.h),
          const ShimmerWidget(width: double.infinity, height: 200),
          SizedBox(height: 30.h),
          const ShimmerWidget(width: double.infinity, height: 50),
        ],
      ),
    );
  }
}
