import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:stikky_code_test/product_list/product_list_response.dart';

import '../env.dart';
import 'cubit/product_list_cubit.dart';

part 'widgets/list_item_view.dart';
part 'widgets/product_list_view.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopify')),
      body: BlocConsumer<ProductListCubit, ProductListState>(
        listener: (_, state) {
          if (state is ProductListLoadedState && !state.hasNextPage) {
            _scrollController.removeListener(_onScroll);
          }
        },
        builder: (_, state) {
          if (state is ProductListLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductListLoadedState) {
            return _ProductListView(
              state: state,
              scrollController: _scrollController,
            );
          }
          if (state is ProductListErrorState) {
            return Center(child: Text(state.message));
          }
          return SizedBox();
        },
      ),
    );
  }

  void _init() {
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.offset >=
            _scrollController.position.maxScrollExtent &&
        !_scrollController.position.outOfRange) {
      context.read<ProductListCubit>().fetchMoreProducts();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }
}
