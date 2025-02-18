import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/theme/app_theme.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:book_app_intern_project/features/home/presentation/providers/user_provider.dart';
import 'package:book_app_intern_project/features/home/presentation/widgets/load_book_images_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/models/book_model.dart';
import '../providers/fav_provider.dart';
import '../states/fav_state.dart';

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
              _FavIcon(
                book: book,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _FavIcon extends ConsumerWidget {
  final BookModel book;
  const _FavIcon({required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUserId = ref.watch(userIdProvider);
    final favState = ref.watch(favProvider);

    bool isFavorited = favState.favoriteBooks[book.id] ?? book.isFavorited;

    return asyncUserId.when(
      data: (userId) {
        if (userId == null) {
          return _buildIcon(isFavorited, null);
        }

        return GestureDetector(
          onTap: () {
            ref.read(favProvider.notifier).toggleFavorite(
                userId: userId,
                productId: book.id,
                currentFavoriteStatus: isFavorited);
          },
          child: AnimatedScale(
            scale: favState.scale,
            duration: const Duration(milliseconds: 150),
            child: _buildIcon(isFavorited, favState),
          ),
        );
      },
      loading: () => _buildIcon(isFavorited, null),
      error: (_, __) => _buildIcon(isFavorited, null),
    );
  }

  Widget _buildIcon(bool isFavorited, FavState? favState) {
    return Icon(
      isFavorited ? Icons.favorite : Icons.favorite_border,
      color: isFavorited ? Colors.purple : Colors.grey,
      size: 30.0,
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
