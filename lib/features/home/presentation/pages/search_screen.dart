import 'package:auto_route/auto_route.dart';
import 'package:book_app_intern_project/core/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/routes/app_router.dart';
import '../providers/search_provider.dart';
import '../widgets/custom_search_field.dart';

@RoutePage()
class SearchResultsScreen extends ConsumerWidget {
  final String initialQuery;

  const SearchResultsScreen({super.key, required this.initialQuery});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchResults = ref.watch(searchProvider);
    final searchQuery = ref.watch(searchQueryProvider);
    final searchController = TextEditingController(text: searchQuery);

    return Scaffold(
      appBar: const CustomAppBar(title: "Search Results"),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Hero(
              tag: "searchBar",
              child: Material(
                type: MaterialType.transparency,
                child: CustomSearchField(
                  controller: searchController,
                  hintText: "Search",
                  onChanged: (query) {
                    ref.read(searchQueryProvider.notifier).state = query;
                    ref.read(searchProvider.notifier).search(query);
                  },
                  onTap: () {},
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Expanded(
              child: searchResults.isEmpty
                  ? const Center(child: Text("No results"))
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final book = searchResults[index];
                        return ListTile(
                          title: Text(book.name),
                          subtitle: Text(book.author),
                          onTap: () {
                            context.pushRoute(BookDetailRoute(book: book));
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
