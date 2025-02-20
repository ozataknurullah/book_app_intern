import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/constant/app_assets.dart';
import '../providers/book_cover_provider.dart';

class LoadBookImagesWidget extends ConsumerWidget {
  final String fileName;
  final double? height;
  final double? width;

  const LoadBookImagesWidget({
    super.key,
    this.height = 120.0,
    this.width = 80.0,
    required this.fileName,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coverAsync = ref.watch(bookCoverProvider(fileName));

    return ClipRRect(
      borderRadius: BorderRadius.circular(8.r),
      child: coverAsync.when(
        data: (coverUrl) => Image.network(
          coverUrl,
          width: width!.w,
          height: height!.h,
          fit: BoxFit.cover,
        ),
        loading: () => _buildShimmerEffect(),
        error: (error, stack) => Image.asset(
          AppAssets.book,
          width: width!.w,
          height: height!.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // Shimmer Effect
  Widget _buildShimmerEffect() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width!.w,
        height: height!.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
