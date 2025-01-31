import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/presentation/providers/book_detail_provider.dart';
import 'package:book_app_intern_project/features/home/presentation/states/book_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class BookDetailScreen extends ConsumerWidget {
  final String bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookState = ref.watch(bookProvider(bookId));
    return Scaffold(
      appBar: const CustomAppBar(title: "Book Details", showBackButton: true),
      body: bookState.isLoading
          ? const Center(child: CircularProgressIndicator())
          : bookState.errorMessage != null
              ? Center(child: Text("Error: ${bookState.errorMessage}"))
              : bookState.book == null
                  ? const Center(child: Text("Book not found"))
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 16.w, vertical: 16.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _BookPictureWithFavIcon(),
                          SizedBox(height: 16.h),
                          _BookTitleAndAuthor(bookState: bookState),
                          SizedBox(height: 30.h),
                          _BookSummary(bookState: bookState),
                          SizedBox(height: 30.h),
                          _BuyNowButton(bookState: bookState),
                        ],
                      ),
                    ),
    );
  }
}

class _BookPictureWithFavIcon extends StatelessWidget {
  const _BookPictureWithFavIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
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
              child: SvgPicture.asset(AppAssets.favIco),
            )
          ])
        ],
      ),
    );
  }
}

class _BookTitleAndAuthor extends StatelessWidget {
  const _BookTitleAndAuthor({
    required this.bookState,
  });

  final BookState bookState;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            bookState.book!.title,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            bookState.book!.author,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _BuyNowButton extends StatelessWidget {
  const _BuyNowButton({
    required this.bookState,
  });

  final BookState bookState;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${bookState.book!.price.toString()}"),
            const Text("Buy Now"),
          ],
        ),
      ),
    );
  }
}

class _BookSummary extends StatelessWidget {
  const _BookSummary({
    required this.bookState,
  });

  final BookState bookState;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Summary",
          style: AppTheme.lightTheme.textTheme.bodyLarge,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          height: 245.h,
          width: 350.w,
          child: Text(
            bookState.book!.summary,
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
