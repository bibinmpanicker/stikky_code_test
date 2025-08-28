import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stikky_code_test/product_list/product_list_response.dart';
import 'package:stikky_code_test/repository.dart';

part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final ProductRepository repository;

  ProductListCubit(this.repository) : super(const ProductListInitialState());

  /// Fetch products
  Future<void> fetchProducts() async {
    try {
      emit(const ProductListLoadingState());

      final ProductListResponse response = await repository.fetchProducts();
      final products = response.edges.map((edge) => edge.product).toList();

      final hasNextPage = response.pageInfo.hasNextPage;
      final endCursor = response.pageInfo.endCursor;

      emit(
        ProductListLoadedState(
          products: products,
          hasNextPage: hasNextPage,
          endCursor: endCursor,
        ),
      );
    } catch (e) {
      emit(ProductListErrorState(e.toString()));
    }
  }

  /// Load more products.
  Future<void> fetchMoreProducts() async {
    try {
      await Future.delayed(Duration(seconds: 1));

      if (state is ProductListLoadedState) {
        final currentState = state as ProductListLoadedState;

        final ProductListResponse response = await repository.fetchProducts(
          endCursor: currentState.endCursor,
        );
        final products = response.edges.map((edge) => edge.product).toList();

        final hasNextPage = response.pageInfo.hasNextPage;
        final endCursor = response.pageInfo.endCursor;

        emit(
          ProductListLoadedState(
            products: [...currentState.products, ...products],
            hasNextPage: hasNextPage,
            endCursor: endCursor,
          ),
        );
      }
    } catch (e) {
      emit(ProductListErrorState(e.toString()));
    }
  }
}
