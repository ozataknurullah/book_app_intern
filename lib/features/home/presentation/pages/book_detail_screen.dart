import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/load_book_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/book_model.dart';
import '../providers/favorite_button_provider.dart';

@RoutePage()
class BookDetailScreen extends ConsumerWidget {
  final BookModel book;

  const BookDetailScreen({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Book Details", showBackButton: true),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _BookImageAndFavIcon(book: book),
            SizedBox(height: 16.h),
            _BookTitleAndAuthor(book: book),
            SizedBox(height: 30.h),
            _BookSummary(book: book),
            SizedBox(height: 30.h),
            _BuyNowButton(book: book),
          ],
        ),
      ),
    );
  }
}

class _BookImageAndFavIcon extends StatelessWidget {
  const _BookImageAndFavIcon({
    required this.book,
  });
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Stack(
            children: [
              Center(
                child: LoadBookImagesWidget(
                  fileName: book.cover,
                  width: 150.w,
                  height: 225.h,
                ),
              ),
              SizedBox(width: 16.w),
              const _FavIcon(),
            ],
          )
        ],
      ),
    );
  }
}

class _BookTitleAndAuthor extends StatelessWidget {
  const _BookTitleAndAuthor({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            book.name,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(height: 8.h),
          Text(
            book.author,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class _BookSummary extends StatelessWidget {
  const _BookSummary({
    required this.book,
  });

  final BookModel book;

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
            book.description,
            style: AppTheme.lightTheme.textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}

class _BuyNowButton extends StatelessWidget {
  const _BuyNowButton({
    required this.book,
  });

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${book.price.toString()}"),
            const Text("Buy Now"),
          ],
        ),
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
