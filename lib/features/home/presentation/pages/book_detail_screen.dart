import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class BookDetailScreen extends StatefulWidget {
  const BookDetailScreen({
    super.key,
  });

  @override
  State<BookDetailScreen> createState() => _BookDetailScreenState();
}

class _BookDetailScreenState extends State<BookDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Book Details", showBackButton: false),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Stack(children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset(
                          'assets/images/book.png',
                          width: 140.w,
                          height: 225.h,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset('assets/icons/heart1.svg'),
                    )
                  ])
                ],
              ),
            ),
            SizedBox(height: 16.h),
            Center(
              child: Column(
                children: [
                  Text(
                    "Book Name",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    "author",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Summary",
              style: AppTheme.lightTheme.textTheme.bodyLarge,
            ),
            SizedBox(height: 8.h),
            Container(
              height: 245.h,
              width: 350.w,
              child: Text("this is the summary"),
            ),
            SizedBox(height: 30.h),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Price"),
                    Text("Buy Now"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
