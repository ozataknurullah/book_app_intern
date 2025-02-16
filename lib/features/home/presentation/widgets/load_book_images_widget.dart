import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/app_assets.dart';
import '../providers/book_cover_provider.dart';

class LoadBookImagesWidget extends ConsumerWidget {
  final String fileName;
  final double? height;
  final double? width;

  const LoadBookImagesWidget(
      {super.key,
      this.height = 120.0,
      this.width = 80.0,
      h,
      required this.fileName});

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
        loading: () => SizedBox(
          width: width!.w,
          height: height!.h,
          child: const Center(child: CircularProgressIndicator()),
        ),
        error: (error, stack) => Image.asset(
          AppAssets.book,
          width: width!.w,
          height: height!.h,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
