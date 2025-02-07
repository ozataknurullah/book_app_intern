import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/constant/app_assets.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/presentation/providers/book_detail_provider.dart';
import 'package:book_app_intern_project/features/home/presentation/states/book_detail_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../providers/favorite_button_provider.dart';

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
                          const _BookImageAndFavIcon(),
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

class _BookImageAndFavIcon extends StatelessWidget {
  const _BookImageAndFavIcon();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              const _BookImage(),
              SizedBox(width: 16.w),
              const _FavIcon(),
            ],
          )
        ],
      ),
    );
  }
}

class _FavIcon extends ConsumerWidget {
  const _FavIcon();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteState = ref.watch(favoriteProvider);

    return Align(
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          ref.read(favoriteProvider.notifier).toggleFavorite();
        },
        child: AnimatedScale(
          scale: favoriteState.scale,
          duration: const Duration(milliseconds: 150), // Animasyon süresi
          child: Icon(
            favoriteState.isFavorited ? Icons.favorite : Icons.favorite_border,
            color: favoriteState.isFavorited ? Colors.purple : Colors.grey,
            size: 30.0,
          ),
        ),
      ),
    );
  }
}

class _BookImage extends StatelessWidget {
  const _BookImage();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.r),
        child: Image.asset(
          AppAssets.book,
          width: 140.w,
          height: 225.h,
        ),
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
