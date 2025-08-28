part of 'product_list_cubit.dart';

abstract class ProductListState {
  const ProductListState();
}

class ProductListInitialState extends ProductListState {
  const ProductListInitialState();
}

class ProductListLoadingState extends ProductListState {
  const ProductListLoadingState();
}

class ProductListLoadedState extends ProductListState {
  final List<Product> products;
  final bool hasNextPage;
  final String? endCursor;

  const ProductListLoadedState({
    this.products = const [],
    this.hasNextPage = true,
    this.endCursor,
  });
}

class ProductListErrorState extends ProductListState {
  final String message;

  const ProductListErrorState(this.message);
}
