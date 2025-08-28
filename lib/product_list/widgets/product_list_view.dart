part of '../product_list_page.dart';

class _ProductListView extends StatelessWidget {
  const _ProductListView({required this.state, required this.scrollController});

  final ProductListLoadedState state;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final listLength = state.products.length;

    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      controller: scrollController,
      itemCount: state.hasNextPage ? listLength + 1 : listLength,
      itemBuilder: (context, index) {
        if (index >= listLength) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: CircularProgressIndicator(),
            ),
          );
        }

        return _ListItemView(state.products[index]);
      },
    );
  }
}
